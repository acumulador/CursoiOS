//
//  ViewController.m
//  Calendar
//
//  Created by Juan C Salazar on 6/10/14.
//  Copyright (c) 2014 Juan C Salazar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _modelo = [[Model alloc] init];
    _page = [[UIPageViewController alloc]initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl navigationOrientation:UIPageViewControllerNavigationOrientationVertical options:nil];
    
    _page.delegate = self;
    _page.dataSource = _modelo;
    
    CalendarViewController * enero = [_modelo viewControllerAtIndex:0 storyBoard:self.storyboard];
    NSArray * mesesVCs = [NSArray arrayWithObject:enero];
    
    [_page setViewControllers:mesesVCs direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    
    [self addChildViewController:_page];
    [self.view addSubview:_page.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
