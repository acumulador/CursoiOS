//
//  FirstViewController.m
//  Conversor Temperatura
//
//  Created by Juan C Salazar on 19/09/14.
//  Copyright (c) 2014 Juan C Salazar. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSURL        *url       = [NSURL URLWithString:@"http://edusoftglobal.com/pruebas/prueba.html"];
    NSURLRequest *loadURL   = [[NSURLRequest alloc] initWithURL:url];
    
    [_webPage loadRequest:loadURL];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
