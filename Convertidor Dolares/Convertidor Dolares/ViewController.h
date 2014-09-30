//
//  ViewController.h
//  Convertidor Dolares
//
//  Created by Juan C Salazar on 29/09/14.
//  Copyright (c) 2014 Juan C Salazar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
#import "ConverterViewController.h"

@interface ViewController : UIViewController <UIAlertViewDelegate, UIActionSheetDelegate>
{
    ConverterViewController * converterView;
    UIAlertView * mensa;
}

@property (strong, nonatomic) IBOutlet UITextField *usuarioLoginText;
@property (strong, nonatomic) IBOutlet UITextField *passwordUserText;
- (IBAction)loginButton:(id)sender;

@end

