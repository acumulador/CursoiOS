//
//  ViewController.h
//  iVideo
//
//  Created by Juan C Salazar on 24/09/14.
//  Copyright (c) 2014 Juan C Salazar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIView *viewVideo;

@property MPMoviePlayerController * reproductorVideo;

@end

