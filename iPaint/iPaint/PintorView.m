//
//  PintorView.m
//  iPaint
//
//  Created by Juan C Salazar on 3/10/14.
//  Copyright (c) 2014 Juan C Salazar. All rights reserved.
//

#import "PintorView.h"
#import "UIColor+Ramdom.h"

@implementation PintorView

-(void)drawRect:(CGRect)rect
{
    CGContextRef  contexto = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(contexto, 1.0f);
    
    CGContextSetStrokeColorWithColor(contexto, _currentColor.CGColor);
    CGContextSetFillColorWithColor(contexto, _currentColor.CGColor);
    
    switch (_colorType) {
        case kBlueType:
            _currentColor = [UIColor blueColor];
            _useRandom = NO;
            break;
            
        case kGreenType:
            _currentColor = [UIColor greenColor];
            _useRandom = NO;
            break;
            
        case kRedtype:
            _currentColor = [UIColor redColor];
            _useRandom = NO;
            break;
            
        case kYellowType:
            _currentColor = [UIColor yellowColor];
            _useRandom = NO;
            break;
        
        case kRamdomType:
            _useRandom = YES;
            
        default:
            break;
    }
    
    switch(_shapeType) {
        case kLineShape:
            CGContextMoveToPoint(contexto, _firstTouch.x, _firstTouch.y);
            CGContextAddLineToPoint(contexto, _lastTouch.x, _lastTouch.y);
            CGContextStrokePath(contexto);
            break;
            
        case kEllipseShape:
            CGContextAddEllipseInRect(contexto, self.currentRect);
            CGContextDrawPath(contexto, kCGPathFillStroke);
            break;
            
        case kRectShape:
            CGContextAddRect(contexto, self.currentRect);
            CGContextDrawPath(contexto, kCGPathFillStroke);
            break;
            
        case kImageShape:
        {
            CGFloat horizontal = _image.size.width/2;
            CGFloat vertical = _image.size.height/2;
            CGPoint puntoDibujo = CGPointMake(_lastTouch.x-horizontal, _lastTouch.y-vertical);
            [_image drawAtPoint:puntoDibujo];
        }
            break;
    }
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:(NSCoder *) aDecoder];
    if (self) {
        _image = [UIImage imageNamed:@"mico.png"];
    }
    
    return self;
}

-(CGRect) currentRect
{
    return CGRectMake(_firstTouch.x, _firstTouch.y, _lastTouch.x-_firstTouch.x, _lastTouch.y-_firstTouch.y);
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (_useRandom) {
        _currentColor = [UIColor randomColor];
    }
    
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
