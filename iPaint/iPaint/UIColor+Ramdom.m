//
//  UIColor+Ramdom.m
//  iPaint
//
//  Created by Juan C Salazar on 3/10/14.
//  Copyright (c) 2014 Juan C Salazar. All rights reserved.
//

#import "UIColor+Ramdom.h"

@implementation UIColor (Ramdom)

+(UIColor *) randomColor{

    CGFloat red = (arc4random() % 256)/256.0f;
    CGFloat green = (arc4random() % 256)/256.0f;
    CGFloat blue = (arc4random() % 256)/256.0f;

    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
}
@end