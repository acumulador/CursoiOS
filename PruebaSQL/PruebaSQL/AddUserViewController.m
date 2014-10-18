//
//  AddUserViewController.m
//  PruebaSQL
//
//  Created by Juan C Salazar on 16/10/14.
//  Copyright (c) 2014 Juan C Salazar. All rights reserved.
//

#import "AddUserViewController.h"

@interface AddUserViewController ()

@end

@implementation AddUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    addUser = [[User alloc]init];
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

- (IBAction)saveUserButton:(id)sender {
    //Tomo la fecha actual
    NSDate * dateNow = [NSDate date];
    
    addUser.nomUser = _nameUserText.text;
    addUser.ageUser = _ageText.text;
    addUser.docUser = _docUserText.text;
    addUser.dateInUser = dateNow;
    
    [addUser addUserAtDataBase];
    
    message = [[UIAlertView alloc]initWithTitle:@"Prueba SQLite" message:addUser.status delegate:self cancelButtonTitle:@"Aceptar" otherButtonTitles: nil];
    [message show];
    [self dismissViewControllerAnimated:YES completion:NULL];
    
}
@end
