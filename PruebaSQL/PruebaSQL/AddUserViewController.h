//
//  AddUserViewController.h
//  PruebaSQL
//
//  Created by Juan C Salazar on 16/10/14.
//  Copyright (c) 2014 Juan C Salazar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"

@interface AddUserViewController : UIViewController<UIAlertViewDelegate>
{
    User * addUser;
    UIAlertView * message;
}

@property (strong, nonatomic) IBOutlet UITextField *nameUserText;
@property (strong, nonatomic) IBOutlet UITextField *docUserText;
@property (strong, nonatomic) IBOutlet UITextField *ageText;
- (IBAction)saveUserButton:(id)sender;

@end
