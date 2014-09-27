//
//  ViewController.h
//  miReproductor
//
//  Created by Juan C Salazar on 22/09/14.
//  Copyright (c) 2014 Juan C Salazar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController <AVAudioPlayerDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *imagenPlay;
@property (strong, nonatomic) IBOutlet UILabel *timeLabel;
@property (strong, nonatomic) IBOutlet UIProgressView *progressPlay;
- (IBAction)PlayButton:(id)sender;
- (IBAction)pauseButton:(id)sender;
- (IBAction)stopButton:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *containerView;

- (IBAction)changeOptions:(id)sender;
- (IBAction)changeVolumen:(id)sender;
- (IBAction)changeRate:(id)sender;
- (IBAction)backSongButton:(id)sender;
- (IBAction)nextSongButton:(id)sender;

//Creo manual la propiedad para acceder al framework
@property AVAudioPlayer * reproductor;

@end

