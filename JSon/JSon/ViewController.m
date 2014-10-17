//
//  ViewController.m
//  JSon
//
//  Created by Juan C Salazar on 17/10/14.
//  Copyright (c) 2014 Juan C Salazar. All rights reserved.
//

#import "ViewController.h"

//Implementa la linea de carga antes de cargar el load y asi ganar unos segundos
#define kQueue dispatch_get_global_queue (DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL * url = [NSURL URLWithString:@"http://54.207.107.65/cluster/"];
    
    dispatch_async(kQueue, ^{
        [self performSelectorOnMainThread:@selector(printJSONData:) withObject:[NSData dataWithContentsOfURL:url] waitUntilDone:YES];
    });
}

-(void) printJSONData:(NSData *) responseData
{
    [_animationProcess stopAnimating];
    _animationProcess.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
