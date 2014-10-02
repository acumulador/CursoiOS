//
//  Converter.h
//  Convertidor Dolares
//
//  Created by Juan C Salazar on 29/09/14.
//  Copyright (c) 2014 Juan C Salazar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ConfigViewControllerDelegate.h"

@interface Converter : NSObject

@property id <ConfigViewControllerDelegate> delegate;

-(float) converter:(float)Pesos ToDolar:(float) valueDolar;

@end