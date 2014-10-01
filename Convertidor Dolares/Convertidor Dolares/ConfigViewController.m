//
//  ConfigViewController.m
//  Convertidor Dolares
//
//  Created by Juan C Salazar on 29/09/14.
//  Copyright (c) 2014 Juan C Salazar. All rights reserved.
//

#import "ConfigViewController.h"

@implementation ConfigViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)saveValuesButton:(id)sender {
    //Se ejecuta el delegado
    if ([_minValueDolarText.text intValue] > [_maxValueDolarText.text intValue] ) {
        
        mensa = [[UIAlertView alloc]initWithTitle:@"Covertidor" message:@"Valor minimo NO debe ser mayor al valor Máximo" delegate:self cancelButtonTitle:@"Aceptar" otherButtonTitles: nil];
        [mensa show];
        
    } else {
        [_delegate updateValues:[_minValueDolarText.text intValue] And:[_maxValueDolarText.text intValue]];
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}
@end
