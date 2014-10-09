//
//  UpdateViewController.m
//  BDSqlite
//
//  Created by Juan C Salazar on 8/10/14.
//  Copyright (c) 2014 Juan C Salazar. All rights reserved.
//

#import "UpdateViewController.h"

@interface UpdateViewController ()

@end

@implementation UpdateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UpdateEmpleado = [[Empleados alloc]init];
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

- (IBAction)UpdateEmpButton:(id)sender {
    UpdateEmpleado.empCedula = _docEmpText.text;
    UpdateEmpleado.empName = _nomEmpText.text;
    UpdateEmpleado.empJob = _jobEmpText.text;
    UpdateEmpleado.empPhone = _phoneEmpText.text;
    UpdateEmpleado.empAdress = _adressEmpText.text;
    
    [UpdateEmpleado updateEmployedInDataBase];
    _responseLabel.text = UpdateEmpleado.status;

    _nomEmpText.text = _docEmpText.text = _jobEmpText.text = _phoneEmpText.text = _adressEmpText.text = nil;
    [self.view endEditing:YES];
}

- (IBAction)consultarEmpButton:(id)sender {
    UpdateEmpleado.empCedula = _searchDocText.text;
    [UpdateEmpleado searchEmployed];
    
    _nomEmpText.text = UpdateEmpleado.empName;
    _docEmpText.text = UpdateEmpleado.empCedula;
    _adressEmpText.text = UpdateEmpleado.empAdress;
    _phoneEmpText.text = UpdateEmpleado.empPhone;
    _jobEmpText.text = UpdateEmpleado.empJob;
    
    _responseLabel.text = UpdateEmpleado.status;
    [self.view endEditing:YES];
}

@end
