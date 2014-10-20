//
//  ViewController.m
//  Gestos
//
//  Created by Profesor on 17/10/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
-(AVAudioPlayer*)loadAudio:(NSString*)ruta{
    NSURL * url = [[NSBundle mainBundle] URLForResource:ruta withExtension:@"wav"];
    NSError * error;
    AVAudioPlayer * player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    if (!player) { NSLog(@"%@", error);}
    else{
        [player prepareToPlay];
        return player;
    }
    return nil;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addGestureRecognizer:_tapGesture];
    _audiojejeje = [self loadAudio:@"hehehe1"];
    _audioMordisco = [self loadAudio:@"chomp"];
}
- (IBAction)handleTap:(id)sender {
    [_audiojejeje play];
    UIImage * banana = [UIImage imageNamed:@"object_bananabunch.png"];
    UIImageView * bananaView = [[UIImageView alloc] initWithImage:banana];
    
    UITapGestureRecognizer * tap = sender;
    CGPoint bananaPoint = [tap locationOfTouch:0 inView:tap.view];
    bananaView.center = bananaPoint;
    bananaView.userInteractionEnabled = YES;
    [bananaView addGestureRecognizer:_panGesture];
    [bananaView addGestureRecognizer:_pinchGesture];
    [bananaView addGestureRecognizer:_rotationGesture];
    [self.view addSubview:bananaView];
}
/*
- (IBAction)handlePinch:(id)sender {
    UIPinchGestureRecognizer * pinch = sender;
    pinch.view.transform = CGAffineTransformScale(pinch.view.transform, pinch.scale, pinch.scale);
    pinch.scale = 1;
}
 */
- (IBAction)handleRotation:(id)sender {
    UIRotationGestureRecognizer * rotation = sender;
    rotation.view.transform = CGAffineTransformRotate(rotation.view.transform, rotation.rotation);
    rotation.rotation = 0;
}

//Mover la banana
- (IBAction)handlePan:(id)sender {
    UIPanGestureRecognizer * pan = sender;
    CGPoint pointTranslation = [pan translationInView:self.view];
    
    pan.view.center = CGPointMake(pan.view.center.x + pointTranslation.x, pan.view.center.y + pointTranslation.y);
    
    [pan setTranslation:CGPointMake(0,0) inView:self.view];
    
    if (pan.view.center.x > _mico.frame.origin.x && pan.view.center.y > _mico.frame.origin.y)
    {
        [_audioMordisco play];
        pan.view.hidden = YES;
    }
    
    
}

- (IBAction)programarDesayuno:(id)sender {
    UILocalNotification * desyuno = [[UILocalNotification alloc]init];
    
    desyuno.fireDate = [NSDate dateWithTimeIntervalSinceNow:10];
    desyuno.alertBody = @"Recuerda el desayuno del Mico!!";
    desyuno.timeZone = [NSTimeZone defaultTimeZone];
    desyuno.applicationIconBadgeNumber = [[UIApplication sharedApplication] applicationIconBadgeNumber]+1;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:desyuno];
}

@end
