//
//  MiPunto.m
//  mapas
//
//  Created by Jhon Wilfer Orrego on 10/10/14.
//  Copyright (c) 2014 Jhon Wilfer Orrego. All rights reserved.
//

#import "MiPunto.h"

@implementation MiPunto

-(id) init{
    //Cord Medellin: 6.235025, -75.57513
    return [self initWhithCoordinate:CLLocationCoordinate2DMake(6.235925, -75.57513) andTitle:@"Medellin"];
    
}

-(id)initWhithCoordinate:(CLLocationCoordinate2D)coor andTitle:(NSString *)theTitle{
    self = [super init];
    if (self) {
        _coordinate = coor;
        _title = theTitle;
    }
    return self;
}

@end
