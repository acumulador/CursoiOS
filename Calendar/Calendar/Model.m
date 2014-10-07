//
//  Model.m
//  Calendar
//
//  Created by Juan C Salazar on 6/10/14.
//  Copyright (c) 2014 Juan C Salazar. All rights reserved.
//

#import "Model.h"
#import "CalendarViewController.h"

@interface Model()
@property NSArray * pageData;
@end

@implementation Model

-(id) init
{
    self = [super init];
    if (self) {
        _pageData = @[@"Enero",@"Febrero",@"Marzo",@"Abril",@"Mayo",@"Junio",@"Julio",@"Agosto",@"Septiembre",@"Octubre",@"Noviembre",@"Diciembre"];
    }
    return self;
}

//Metodos del modelo
-(CalendarViewController *)viewControllerAtIndex:(NSInteger)index storyBoard:(UIStoryboard *)storyboard
{
    if (index>=[_pageData count]) {
        return nil;
    }
    
    CalendarViewController * calendar = [storyboard instantiateViewControllerWithIdentifier:@"Calendar"];
    calendar.dataObject = [_pageData objectAtIndex:index];
    return calendar;
}

-(NSUInteger) indexOfViewController:(CalendarViewController *)viewController
{
    return [_pageData indexOfObject:viewController.dataObject];
}

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:(CalendarViewController *)viewController];
    if (index==0) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index storyBoard:viewController.storyboard];
}

-(UIViewController * )pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:(CalendarViewController *)viewController];
    if (index==[_pageData count]-1) {
        return nil;
    }
    
    index++;
    return [self viewControllerAtIndex:index storyBoard:viewController.storyboard];
}

@end
