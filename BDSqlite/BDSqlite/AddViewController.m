//
//  AddViewController.m
//  BDSqlite
//
//  Created by Juan C Salazar on 8/10/14.
//  Copyright (c) 2014 Juan C Salazar. All rights reserved.
//

#import "AddViewController.h"

@interface AddViewController ()

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    addEmpleado = [[Empleados alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)saveEmpButton:(id)sender {
    addEmpleado.empName = _nameEmpText.text;
    addEmpleado.empCedula = _docEmpText.text;
    addEmpleado.empJob = _jobEmpText.text;
    addEmpleado.empPhone = _phoneEmpText.text;
    addEmpleado.empAdress = _adressEmpText.text;
    
    [addEmpleado insertEmployedInDatabases];
    _responseLabel.text = addEmpleado.status;
    
    [self.view endEditing:YES];
    _nameEmpText.text = _docEmpText.text = _jobEmpText.text = _phoneEmpText.text = _adressEmpText.text = nil;
}

@end
