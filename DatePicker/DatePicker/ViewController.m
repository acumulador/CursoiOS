//
//  ViewController.m
//  DatePicker
//
//  Created by Juan C Salazar on 1/10/14.
//  Copyright (c) 2014 Juan C Salazar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _datePicker.hidden=YES;
    _dateText.delegate = self;
    
    _paisesPickerView.delegate = self;
    _paisesPickerView.dataSource = self;
    
    NSString * rutaPlist = [[NSBundle mainBundle] pathForResource:@"listaPaises" ofType:@"plist"];
    paisesArray = [[NSArray alloc] initWithContentsOfFile:rutaPlist];
    NSLog(@"%@", paisesArray);
}

-(NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [paisesArray count];
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [paisesArray objectAtIndex:row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    mensa = [[UIAlertView alloc] initWithTitle:@"Paises" message:[paisesArray objectAtIndex:row] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [mensa show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)userSelectedDate:(id)sender {
    UIDatePicker * controlDatePicker = sender;
    _dateText.text = [NSString stringWithFormat:@"%@",controlDatePicker.date];
}

- (IBAction)dateText:(id)sender {
    _datePicker.hidden=NO;
}
@end
