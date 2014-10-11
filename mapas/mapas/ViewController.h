//
//  ViewController.h
//  mapas
//
//  Created by Jhon Wilfer Orrego on 10/10/14.
//  Copyright (c) 2014 Jhon Wilfer Orrego. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import "MiPunto.h"

@interface ViewController : UIViewController <MKAnnotation, CLLocationManagerDelegate>{
    MiPunto * medellin;
}


- (IBAction)changeMap:(id)sender;

@property (strong, nonatomic) IBOutlet MKMapView *mapView;


@end

