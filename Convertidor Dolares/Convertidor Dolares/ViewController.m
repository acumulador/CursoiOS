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

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    converterView = [segue destinationViewController];
    NSLog(@"%@", converterView.dataTransfer);
   // converterView.dataTransfer = _usuarioLoginText.text;
}

- (IBAction)loginButton:(id)sender {
   
}
-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    
    User * validateUser = [[User alloc] init];
    [validateUser setUser:_usuarioLoginText.text];
    [validateUser setPass:_passwordUserText.text];
    
    if (![validateUser verifyUserValue]) {
        validateUserMessage = @"Usuario o clave inconrrecta";
        
        mensa = [[UIAlertView alloc] initWithTitle:@"Login Usuario" message:validateUserMessage delegate:self cancelButtonTitle:@"Aceptar" otherButtonTitles: nil];
        
        [mensa show];
        return NO;
    }
    else
    {
        return YES;
    }

}
@end
