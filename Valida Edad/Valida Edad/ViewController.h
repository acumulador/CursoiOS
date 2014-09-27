//
//  ViewController.h
//  Valida Edad
//
//  Created by Juan C Salazar on 17/09/14.
//  Copyright (c) 2014 Juan C Salazar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"

@interface ViewController : UIViewController
{
    Person * user;
}
@property (weak, nonatomic) IBOutlet UITextField *userNameText;
@property (weak, nonatomic) IBOutlet UITextField *userAgeText;
@property (weak, nonatomic) IBOutlet UITextField *userCityText;
@property (weak, nonatomic) IBOutlet UILabel *resultText;
- (IBAction)validateAge:(id)sender;

@end
