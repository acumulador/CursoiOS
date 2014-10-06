//
//  ViewController.m
//  iPaint
//
//  Created by Juan C Salazar on 3/10/14.
//  Copyright (c) 2014 Juan C Salazar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeShapeType:(id)sender {
    [(PintorView * ) self.view setShapeType:(int)[((UISegmentedControl *) sender) selectedSegmentIndex]];
}

- (IBAction)changeColorType:(id)sender {
    [(PintorView *) self.view setColorType:(int) [((UISegmentedControl *) sender) selectedSegmentIndex]];
}
@end
