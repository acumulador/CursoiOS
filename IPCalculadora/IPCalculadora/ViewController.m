//
//  ViewController.m
//  IPCalculadora
//
//  Created by Juan C Salazar on 24/09/14.
//  Copyright (c) 2014 Juan C Salazar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _resultLabel.text = @"";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sumaButton:(id)sender {
    Operator * obOperator = [[Operator alloc] init];
    [obOperator setNumberTwo:[_numberTwoText.text floatValue]];
    [obOperator setNumberOne:[_numberOneText.text floatValue]];
    [obOperator suma2Numbers];
    _resultLabel.text = [NSString stringWithFormat:@"%.1f",[obOperator result]];
}

- (IBAction)multiplicarButton:(id)sender {
    Operator * multiplicador = [[Operator alloc] init];
    [multiplicador setNumberOne:[_numberOneText.text floatValue]];
    [multiplicador setNumberTwo:[_numberTwoText.text floatValue]];
    [multiplicador Multiplica2Numbers];
    _resultLabel.text = [NSString stringWithFormat:@"%.1f",[multiplicador result]];
}
@end
