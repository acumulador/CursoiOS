//
//  MiPunto.h
//  mapas
//
//  Created by Jhon Wilfer Orrego on 10/10/14.
//  Copyright (c) 2014 Jhon Wilfer Orrego. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface MiPunto : NSObject <MKAnnotation>
@property (nonatomic,readonly)CLLocationCoordinate2D coordinate;
@property (nonatomic, readonly,copy)NSString *title;

-(id)initWhithCoordinate:(CLLocationCoordinate2D)coor andTitle:(NSString*)theTitle;


@end
