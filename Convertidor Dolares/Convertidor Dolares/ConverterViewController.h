//
//  ConverterViewController.h
//  Convertidor Dolares
//
//  Created by Juan C Salazar on 29/09/14.
//  Copyright (c) 2014 Juan C Salazar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Converter.h"
#import "ConfigViewControllerDelegate.h"
#import "ConfigViewController.h"

@interface ConverterViewController : UIViewController<ConfigViewControllerDelegate, UIAlertViewDelegate>
{
    UIAlertView * mensa;
    ConfigViewController * configView;
}
@property NSString * dataTransfer;

@property (strong, nonatomic) IBOutlet UILabel *greetUserLabel;
@property (strong, nonatomic) IBOutlet UITextField *dolarValueText;
- (IBAction)valueDolarSlider:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *finishValueDolarLabel;
@property (strong, nonatomic) IBOutlet UILabel *initialValueDolarLabel;
@property (strong, nonatomic) IBOutlet UILabel *resultConvertLabel;
@property (strong, nonatomic) IBOutlet UILabel *valueSliderLabel;
- (IBAction)exitButton:(id)sender;
@property (strong, nonatomic) IBOutlet UISlider *valuesDolarSlider;



@end
