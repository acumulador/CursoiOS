//
//  AddViewController.h
//  BDSqlite
//
//  Created by Juan C Salazar on 8/10/14.
//  Copyright (c) 2014 Juan C Salazar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Empleados.h"

@interface AddViewController : UIViewController
{
    Empleados * addEmpleado;
}

@property (strong, nonatomic) IBOutlet UITextField *nameEmpText;
@property (strong, nonatomic) IBOutlet UITextField *docEmpText;
@property (strong, nonatomic) IBOutlet UITextField *jobEmpText;
@property (strong, nonatomic) IBOutlet UITextField *phoneEmpText;
@property (strong, nonatomic) IBOutlet UITextField *adressEmpText;
@property (strong, nonatomic) IBOutlet UILabel *responseLabel;
- (IBAction)saveEmpButton:(id)sender;

@end
