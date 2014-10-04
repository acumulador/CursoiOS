//
//  PintorView.h
//  iPaint
//
//  Created by Juan C Salazar on 3/10/14.
//  Copyright (c) 2014 Juan C Salazar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"

@interface PintorView : UIView

@property CGPoint firstTouch;
@property CGPoint lastTouch;

@property (nonatomic) CGRect currentRect;
@property CGRect redrawRect;

@property UIColor * currentColor;
@property BOOL useRandom;

@property ShapeType * shapeType;
@property UIImage * image;

@end
