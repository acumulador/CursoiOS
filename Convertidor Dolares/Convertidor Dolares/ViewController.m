//
//  ViewController.m
//  Convertidor Dolares
//
//  Created by Juan C Salazar on 29/09/14.
//  Copyright (c) 2014 Juan C Salazar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSString * validateUserMessage;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Metodo que se implementa para preparar el segue
//Este metodo SIEMPRE se ejecuta
-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    converterView = [segue destinationViewController];
    converterView.dataTransfer =  _usuarioLoginText.text;
}

- (IBAction)loginButton:(id)sender {
   
}

//Metodo que implementa al pasar de vista con el segue
//Este metodo pregunta si se ejecuta o no
-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    
    User * validateUser = [[User alloc] init];
    [validateUser setUser:_usuarioLoginText.text];
    [validateUser setPass:_passwordUserText.text];
    
    if (![validateUser verifyUserValue]) {
        validateUserMessage = @"Usuario o clave inconrrecta";
        
        mensa = [[UIAlertView alloc] initWithTitle:@"Login Usuario" message:validateUserMessage delegate:self cancelButtonTitle:@"Aceptar" otherButtonTitles: nil];
        
        [mensa show];
        //Es mejor hacer esto en el metodo del boton del alertView
        //_usuarioLoginText.text = nil;
        //_passwordUserText.text = nil;
        
        return NO;
    }
    else
    {
        return YES;
    }

}

-(void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    _usuarioLoginText.text = nil;
    _passwordUserText.text = nil;
}
@end
