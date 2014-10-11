//
//  ViewController.m
//  mapas
//
//  Created by Jhon Wilfer Orrego on 10/10/14.
//  Copyright (c) 2014 Jhon Wilfer Orrego. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _mapView.delegate = self;
    medellin = [[MiPunto alloc]init];
    [_mapView addAnnotation:medellin];
    
    MKCoordinateRegion region;
    region.center.latitude = medellin.coordinate.latitude;
    region.center.longitude =medellin.coordinate.longitude;
    region.span.latitudeDelta = 0.5;
    region.span.longitudeDelta = 0.5;
    [_mapView setRegion:region animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeMap:(id)sender {
}
@end
