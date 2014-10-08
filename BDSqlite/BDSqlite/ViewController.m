//
//  ViewController.m
//  BDSqlite
//
//  Created by Juan C Salazar on 8/10/14.
//  Copyright (c) 2014 Juan C Salazar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property Empleados * empleado;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _empleado = [[Empleados alloc] init];
    [_empleado createDatabaseInDocuments];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
