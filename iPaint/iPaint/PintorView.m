//
//  PintorView.m
//  iPaint
//
//  Created by Juan C Salazar on 3/10/14.
//  Copyright (c) 2014 Juan C Salazar. All rights reserved.
//

#import "PintorView.h"

@implementation PintorView

-(CGRect) currentRect
{
    return CGRectMake(_firstTouch.x, _firstTouch.y, _lastTouch.x-_firstTouch.x, _lastTouch.y-_firstTouch.y);
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch * touch = [touches anyObject];
    _firstTouch = [touch locationInView:self];
    _lastTouch = [touch locationInView:self];
    [self setNeedsDisplay];
}

-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch * touch = [touches anyObject];
    _lastTouch = [touch locationInView:self];
    _redrawRect = CGRectUnion(_redrawRect, self.currentRect);
    NSLog(@"Last x : %f- y %f",_lastTouch.x,_lastTouch.y);
    [self setNeedsDisplay];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch * touch = [touches anyObject];
    _lastTouch = [touch locationInView:self];
    _redrawRect = CGRectUnion(_redrawRect, self.currentRect);
    NSLog(@"Last x : %f- y %f",_lastTouch.x,_lastTouch.y);
    [self setNeedsDisplay];
}

@end
