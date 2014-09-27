//
//  SecondViewController.m
//  Conversor Temperatura
//
//  Created by Juan C Salazar on 19/09/14.
//  Copyright (c) 2014 Juan C Salazar. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    _resultConverterLabel.text = @"...";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)convertTemperature:(id)sender
{
    Converter * obConverter = [[Converter alloc] init];
    _resultConverterLabel.text = [obConverter convertCtoF:[_valueConverterText.text floatValue]];
    [self.view endEditing:YES];
}

- (IBAction)convertFtoC:(id)sender
{
    Converter * obConverter = [[Converter alloc] init];
    _resultConverterLabel.text = [obConverter convertFtoC:[_valueConverterText.text floatValue]];
    [self.view endEditing:YES];
}

@end
