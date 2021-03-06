//
//  SearchViewController.h
//  BDSqlite
//
//  Created by Juan C Salazar on 8/10/14.
//  Copyright (c) 2014 Juan C Salazar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Empleados.h"

@interface SearchViewController : UIViewController
{
    Empleados * searchEmpleado;
}

@property (strong, nonatomic) IBOutlet UITextField *searchDocText;
- (IBAction)searchEmpButton:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *nomEmpLabel;
@property (strong, nonatomic) IBOutlet UILabel *cedEmpLabel;
@property (strong, nonatomic) IBOutlet UILabel *jobEmpLabel;
@property (strong, nonatomic) IBOutlet UILabel *phoneEmpLabel;
@property (strong, nonatomic) IBOutlet UILabel *adressEmpLabel;
@property (strong, nonatomic) IBOutlet UILabel *responseLabel;

@end
