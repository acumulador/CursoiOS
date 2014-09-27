//
//  ViewController.m
//  PasaTiempo
//
//  Created by Juan C Salazar on 26/09/14.
//  Copyright (c) 2014 Juan C Salazar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSTimer * timer;
    int secondsTime;
    int minuteTime;
    int tempSecondsTime;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _timeLabel.text = @"";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) startTime
{
    secondsTime ++;
    tempSecondsTime ++;
    if (tempSecondsTime>60) {
        minuteTime = tempSecondsTime/60;
    }
//    secondsTime = (int)(secondsTime/60)%60;
//    minuteTime = (int)secondsTime%60;
    
    _timeLabel.text = [NSString stringWithFormat:@"%02i:%02i", minuteTime, secondsTime];
}

- (IBAction)iniciarTimeButton:(id)sender {
    timer = [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(startTime) userInfo:nil repeats:YES];
}

- (IBAction)reiniciarTimeButton:(id)sender {
}
@end
