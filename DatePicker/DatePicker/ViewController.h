//
//  ViewController.h
//  DatePicker
//
//  Created by Juan C Salazar on 1/10/14.
//  Copyright (c) 2014 Juan C Salazar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate, UIAlertViewDelegate>
{
    NSArray * paisesArray;
    UIAlertView * mensa;
}

- (IBAction)userSelectedDate:(id)sender;
@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (strong, nonatomic) IBOutlet UITextField *dateText;
- (IBAction)dateText:(id)sender;
@property (strong, nonatomic) IBOutlet UIPickerView *paisesPickerView;
- (IBAction)controlViewPicker:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *containerView;


@end

