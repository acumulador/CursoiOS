//
//  ViewController.h
//  IPCalculadora
//
//  Created by Juan C Salazar on 24/09/14.
//  Copyright (c) 2014 Juan C Salazar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Operator.h"

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *numberOneText;
@property (strong, nonatomic) IBOutlet UITextField *numberTwoText;
@property (strong, nonatomic) IBOutlet UILabel *resultLabel;

- (IBAction)sumaButton:(id)sender;
- (IBAction)multiplicarButton:(id)sender;

@end

