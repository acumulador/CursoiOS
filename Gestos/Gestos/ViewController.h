//
//  ViewController.h
//  Gestos
//
//  Created by Juan C Salazar on 17/10/14.
//  Copyright (c) 2014 Juan C Salazar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapGesture;
- (IBAction)handleTap:(id)sender;
@property (strong, nonatomic) IBOutlet UIImageView *micoImageView;

@property AVAudioPlayer * audioJejeje;
@property AVAudioPlayer * audioMordisco;

@end

