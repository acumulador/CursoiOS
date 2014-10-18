//
//  ViewController.m
//  Gestos
//
//  Created by Juan C Salazar on 17/10/14.
//  Copyright (c) 2014 Juan C Salazar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(AVAudioPlayer *) loadAudio:(NSString *) ruta
{
    NSURL * url = [[NSBundle mainBundle]URLForResource:ruta withExtension:@"wav"];
    NSError * error;
    AVAudioPlayer * player = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:&error];
    
    if (!player) {
        NSLog(@"Error en audio");
    } else {
        [player prepareToPlay];
        return player;
    }
    
    return nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    [self.view addGestureRecognizer:_tapGesture];
    _audioJejeje = [self loadAudio:@"hehehe1"];
    _audioMordisco = [self loadAudio:@"chomp"];
}

- (IBAction)handleTap:(id)sender {
    [_audioJejeje play];
    
    UIImage * banana = [UIImage imageNamed:@"object_bananabunch.png"];
    UIImageView * bananaView = [[UIImageView alloc] initWithImage:banana];
    
    UITapGestureRecognizer * tap = sender;
    CGPoint bananaPoint = [tap locationOfTouch:0 inView:tap.view];
    
    bananaView.center = bananaPoint;
    [self.view addSubview:bananaView];
}
@end
