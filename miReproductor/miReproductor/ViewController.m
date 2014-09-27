//
//  ViewController.m
//  miReproductor
//
//  Created by Juan C Salazar on 22/09/14.
//  Copyright (c) 2014 Juan C Salazar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSTimer * progressTimer;
    NSArray * arraySong;
    NSArray * arrayImagesSong;
    int indexSong;
    int numberSong;
    NSString * currentSongPlay;
}
@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    arraySong = @[@"demo",@"NY NY USA"];
    arrayImagesSong = @[@"imagen.jpg",@"imagen.jpg"];
    numberSong = [arraySong count]-1;
    NSLog(@"%i",numberSong);
    indexSong = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSString *) timeUpdateLabel:(float)value
{
    int minuts = (int)(value/60)%60;
    int seconds = (int)value%60;
    
    return [NSString stringWithFormat:@"%02i:%02i",minuts,seconds];
}

-(void) updateProgressBar{
    _progressPlay.progress = _reproductor.currentTime/_reproductor.duration;
    
    _timeLabel.text = [self timeUpdateLabel:_reproductor.currentTime];
}

-(void) loadSong:(NSString *)nameSong andImage:(NSString *)nameImage
{
    NSString * ruta = [[NSBundle mainBundle] pathForResource:nameSong ofType:@"mp3"];
    //NSLog(@"%@",ruta);
    NSURL * url = [[NSURL alloc] initFileURLWithPath:ruta];
    //NSLog(@"%@",url);
    
    NSError * error;
    
    _reproductor = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:&error];
    
    //Propiedades iniciales para el reproductor; ya estan en el framework AVAudioPlayer
    _reproductor.volume = 1;
    _reproductor.pan = 0.5; //Panel stereo
    _reproductor.rate = 1;
    _reproductor.enableRate = YES; //Normalmente no se puede activar la edición de velocidad del audio, con esto se deja editar
    _reproductor.numberOfLoops = -1; //Para que se reproduzca solo una vez
    _reproductor.delegate = self;
    [_reproductor prepareToPlay];
    
    _imagenPlay.image = [UIImage imageNamed:nameImage];
}

- (IBAction)PlayButton:(id)sender {
    [_reproductor play];
    
    progressTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateProgressBar) userInfo:nil repeats:YES];
}

- (IBAction)pauseButton:(id)sender {
    [_reproductor pause];
}

- (IBAction)stopButton:(id)sender {
    _reproductor.currentTime = 0;
    [_reproductor stop];
    [progressTimer invalidate];
}

- (IBAction)changeOptions:(id)sender {
//    UISwitch * controlSwitch = sender;
//    if (controlSwitch.on) {
//        _containerView.hidden = NO;
//    } else {
//        _containerView.hidden = YES;
//    }
    //Otra forma mas optima
    _containerView.hidden = !((UISwitch *) sender).on;
}

- (IBAction)changeVolumen:(id)sender {
    _reproductor.volume = ((UISlider *) sender).value;
}

- (IBAction)changeRate:(id)sender {
    _reproductor.rate = ((UISlider *) sender).value;
}

- (IBAction)backSongButton:(id)sender {
    
    
    
    [_reproductor stop];
    [self loadSong:[arraySong objectAtIndex:0] andImage:[arrayImagesSong objectAtIndex:0]];
    [_reproductor play];
}

- (IBAction)nextSongButton:(id)sender {
    numberSong++;
    
    if (indexSong>numberSong) {
        indexSong = numberSong;
    }
    
    currentSongPlay = [arraySong objectAtIndex:indexSong];
    
    [_reproductor stop];
    [self loadSong:currentSongPlay andImage:[arrayImagesSong objectAtIndex:1]];
    [_reproductor play];
}

@end
