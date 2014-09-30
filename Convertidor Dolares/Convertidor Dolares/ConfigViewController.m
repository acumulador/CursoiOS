//
//  ConfigViewController.m
//  Convertidor Dolares
//
//  Created by Juan C Salazar on 29/09/14.
//  Copyright (c) 2014 Juan C Salazar. All rights reserved.
//

#import "ConfigViewController.h"

@implementation ConfigViewController

- (IBAction)saveValuesButton:(id)sender {
    //Se ejecuta el delegado
    [_delegate updateValues:[_minValueDolarText.text intValue] And:[_maxValueDolarText.text intValue]];
}
@end
