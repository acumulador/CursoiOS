//
//  SearchViewController.m
//  BDSqlite
//
//  Created by Juan C Salazar on 8/10/14.
//  Copyright (c) 2014 Juan C Salazar. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    searchEmpleado = [[Empleados alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)searchEmpButton:(id)sender {
    searchEmpleado.empCedula = _searchDocText.text;
    [searchEmpleado searchEmployedInDataBase];
    
    _nomEmpLabel.text = searchEmpleado.empName;
    _cedEmpLabel.text = searchEmpleado.empCedula;
    _jobEmpLabel.text = searchEmpleado.empJob;
    _adressEmpLabel.text = searchEmpleado.empAdress;
    _phoneEmpLabel.text = searchEmpleado.empPhone;
    
    _responseLabel.text = searchEmpleado.status;
    
    [self.view endEditing:YES];
    _searchDocText.text = nil;
}
@end
