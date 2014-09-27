//
//  SecondViewController.h
//  Conversor Temperatura
//
//  Created by Juan C Salazar on 19/09/14.
//  Copyright (c) 2014 Juan C Salazar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Converter.h"

@interface SecondViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *valueConverterText;

- (IBAction)convertTemperature:(id)sender;
- (IBAction)convertFtoC:(id)sender;

@property (strong, nonatomic) IBOutlet UILabel *resultConverterLabel;


@end
