//
//  ViewController.m
//  Valida Edad
//
//  Created by Juan C Salazar on 17/09/14.
//  Copyright (c) 2014 Juan C Salazar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)validateAge:(id)sender {
    NSString * mess;
    //Instancio el objeto en momoria cuando cargue la aplicación
	user = [[Person alloc] init];
    [user setName:_userNameText.text];
    [user setCity:_userCityText.text];
    [user setAge: [_userAgeText.text intValue]];
    
    if ([user userIsAdult]) {
        //mess = [NSString stringWithFormat:@"%@ es adulto!!",[user name]];
        mess = [NSString stringWithFormat:@"%@ es adulto y vive en %@!!",[user name], [user city]];
    } else {
        mess = [NSString stringWithFormat:@"%@ NO es adulto y vive en %@!!",[user name], [user city]];
    }
    
    UIAlertView * messageUser = [[UIAlertView alloc] initWithTitle:@"Valida Edad" message:mess delegate:self cancelButtonTitle:@"Aceptar" otherButtonTitles:nil, nil];
    
    [messageUser show];
    
    _resultText.text = mess;
    
    //Ocultar el teclado
    [self.view endEditing:YES];
}
@end
