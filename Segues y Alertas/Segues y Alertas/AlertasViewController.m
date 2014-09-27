//
//  AlertasViewController.m
//  Segues y Alertas
//
//  Created by Juan C Salazar on 24/09/14.
//  Copyright (c) 2014 Juan C Salazar. All rights reserved.
//

#import "AlertasViewController.h"

@interface AlertasViewController ()

@end

@implementation AlertasViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)alertSimple:(id)sender {
    alert = [[UIAlertView alloc] initWithTitle:@"Titulo"
                                       message:@"Mensaje de Alerta simple!!"
                                      delegate:self
                             cancelButtonTitle:@"Aceptar"
                             otherButtonTitles:@"Cancelar", @"Otro Boton",nil];
    alert.tag = 1;
    [alert show];
}

-(void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag == 1)
    {
        switch (buttonIndex) {
            case 0:
                NSLog(@"Clic en boton Aceptar!!");
                break;
            case 1:
                NSLog(@"Clic en boton Cancelar!!");
                break;
            case 2:
                NSLog(@"Clic en boton Otro Boton!!");
                break;
                
            default:
                break;
        }
    }else if(alertView.tag == 2)
    {
        NSLog(@"El usuario ingresado es: %@ con su clave: %@!!",[alertView textFieldAtIndex:0].text, [alertView textFieldAtIndex:1].text);
    }
    
}

- (IBAction)alertFields:(id)sender {
    alert = [[UIAlertView alloc]initWithTitle:@"Confirmar"
                                      message:@"Ingresa tu Usuario y Clave"
                                     delegate:self
                            cancelButtonTitle:@"Cancelar"
                            otherButtonTitles:@"Pagar", nil];
    alert.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput;
    alert.tag = 2;
    [alert show];
    
}

- (IBAction)seetActions:(id)sender {
    UIActionSheet * hojaMenuOpciones = [[UIActionSheet alloc]initWithTitle:@"Titulo" delegate:self cancelButtonTitle:@"Cerrar" destructiveButtonTitle:@"Eliminar" otherButtonTitles:@"Enviar", @"Omitir", @"Compartir", @"Ofrecer", @"Convertir",nil];
    
    [hojaMenuOpciones showInView:self.view];
}

-(void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
            NSLog(@"Clic en Borrar!!");
            break;
        case 1:
            NSLog(@"Clic en Enviar!!");
            break;
        case 2:
            NSLog(@"Clic en Omitir!!");
            break;
        case 3:
            NSLog(@"Clic en Compartir!!");
            break;
        case 4:
            NSLog(@"Clic en Ofrecer!!");
            break;
        case 5:
            NSLog(@"Clic en Convertir!!");
            break;
        case 6:
            NSLog(@"Clic en Cerrar!!");
            break;
            
        default:
            break;
    }
}

@end
