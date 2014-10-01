//
//  ConfigViewController.h
//  Convertidor Dolares
//
//  Created by Juan C Salazar on 29/09/14.
//  Copyright (c) 2014 Juan C Salazar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ConfigViewControllerDelegate.h"

@interface ConfigViewController : UIViewController <UIAlertViewDelegate>
{
    UIAlertView * mensa;
}

@property id <ConfigViewControllerDelegate> delegate;

@property (strong, nonatomic) IBOutlet UITextField *minValueDolarText;
@property (strong, nonatomic) IBOutlet UITextField *maxValueDolarText;
- (IBAction)saveValuesButton:(id)sender;

@end
