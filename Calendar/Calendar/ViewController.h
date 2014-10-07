//
//  ViewController.h
//  Calendar
//
//  Created by Juan C Salazar on 6/10/14.
//  Copyright (c) 2014 Juan C Salazar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"

@interface ViewController : UIViewController <UIPageViewControllerDelegate>
@property UIPageViewController * page;

@property Model * modelo;

@end

