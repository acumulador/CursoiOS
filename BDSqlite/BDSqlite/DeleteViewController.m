//
//  DeleteViewController.m
//  BDSqlite
//
//  Created by Juan C Salazar on 9/10/14.
//  Copyright (c) 2014 Juan C Salazar. All rights reserved.
//

#import "DeleteViewController.h"

@interface DeleteViewController ()

@end

@implementation DeleteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    delEmpleado = [[Empleados alloc]init];
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

- (IBAction)deleteEmpButton:(id)sender {
    mensa = [[UIAlertView alloc] initWithTitle:@"Empleados" message:@"Esta seguro de eliminar el Empleado?" delegate:self cancelButtonTitle:@"Eliminar" otherButtonTitles:@"Cancelar", nil];
    
    [mensa show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex==0) {
        delEmpleado.empCedula = _searchDocText.text;
        [delEmpleado deleteEmployedInDataBase];
        
        _respondeLabel.text = delEmpleado.status;
        
        [self.view endEditing:YES];
        _searchDocText.text = _nomEmpLabel.text = _docEmpLabel.text = _jobEmpLabel.text = _phoneEmpLabel.text = _adressEmpLabel.text = nil;
    }
}

- (IBAction)searchButton:(id)sender {
    delEmpleado.empCedula = _searchDocText.text;
    [delEmpleado searchEmployed];
    
    _nomEmpLabel.text = delEmpleado.empName;
    _docEmpLabel.text = delEmpleado.empCedula;
    _jobEmpLabel.text = delEmpleado.empJob;
    _adressEmpLabel.text = delEmpleado.empAdress;
    _phoneEmpLabel.text = delEmpleado.empPhone;
    
    [self.view endEditing:YES];
}





@end
