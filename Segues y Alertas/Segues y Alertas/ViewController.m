//
//  ViewController.m
//  Segues y Alertas
//
//  Created by Juan C Salazar on 24/09/14.
//  Copyright (c) 2014 Juan C Salazar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_userNameLoginText becomeFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //Esta opcion en caso que el segue se conecte con el VC pero ya esta conectado a la barra de navegación
//    secondVista = [segue destinationViewController];
//    secondVista.dataTransfer = _userNameLoginText.text;
    
    //Se como el segue se conecta con la barra toca utilizar el metodo que trae todos los viweControllers que encuentra, y toma el primero por el objectAtIndex(0)
    secondVista = [[segue.destinationViewController viewControllers] objectAtIndex:0];
    secondVista.dataTransfer = _userNameLoginText.text;
    
    _userNameLoginText.text = @"";
    _paswordLoginText.text = @"";
}

-(BOOL) shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    if ([_paswordLoginText.text isEqualToString:@"123"]) {
        return YES;
    } else {
        return NO;
    }
}


@end
