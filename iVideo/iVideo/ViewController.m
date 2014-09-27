//
//  ViewController.m
//  iVideo
//
//  Created by Juan C Salazar on 24/09/14.
//  Copyright (c) 2014 Juan C Salazar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //traigo la ruta del archivo cargado
    NSString * rutaVideo = [[NSBundle mainBundle] pathForResource:@"BigBuckBunny" ofType:@"mp4"];
    
    NSURL * urlVideo = [[NSURL alloc] initFileURLWithPath: rutaVideo];
    
    _reproductorVideo = [[MPMoviePlayerController alloc] initWithContentURL:urlVideo];
    _reproductorVideo.view.frame = CGRectMake(0, 0, _viewVideo.frame.size.width, _viewVideo.frame.size.height);
    
    [_viewVideo addSubview:_reproductorVideo.view];
    [_reproductorVideo play];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
