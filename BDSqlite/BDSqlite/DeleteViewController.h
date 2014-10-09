//
//  DeleteViewController.h
//  BDSqlite
//
//  Created by Juan C Salazar on 9/10/14.
//  Copyright (c) 2014 Juan C Salazar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Empleados.h"

@interface DeleteViewController : UIViewController<UIAlertViewDelegate>
{
    Empleados * delEmpleado;
    UIAlertView * mensa;
}

- (IBAction)deleteEmpButton:(id)sender;
- (IBAction)searchButton:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *searchDocText;
@property (strong, nonatomic) IBOutlet UILabel *nomEmpLabel;
@property (strong, nonatomic) IBOutlet UILabel *docEmpLabel;
@property (strong, nonatomic) IBOutlet UILabel *jobEmpLabel;
@property (strong, nonatomic) IBOutlet UILabel *phoneEmpLabel;
@property (strong, nonatomic) IBOutlet UILabel *adressEmpLabel;
@property (strong, nonatomic) IBOutlet UILabel *respondeLabel;

@end
