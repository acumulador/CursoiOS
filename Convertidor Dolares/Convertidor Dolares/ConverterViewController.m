//
//  ConverterViewController.m
//  Convertidor Dolares
//
//  Created by Juan C Salazar on 29/09/14.
//  Copyright (c) 2014 Juan C Salazar. All rights reserved.
//

#import "ConverterViewController.h"

@implementation ConverterViewController

-(void)viewDidLoad{
    _greetUserLabel.text = _dataTransfer;
}

- (IBAction)valueDolarSlider:(id)sender {
    Converter * converterDolar = [[Converter alloc]init];
    _resultConvertLabel.text = [NSString stringWithFormat:@"%.01f",[converterDolar converter: ((UISlider *) sender).value  ToDolar: [_dolarValueText.text floatValue]]] ;
    _valueSliderLabel.text = [NSString stringWithFormat: @"%.f", ((UISlider *) sender).value];
}
- (IBAction)exitButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    for (UIView * view in self.view.subviews) {
        [view resignFirstResponder];
    }

}

//Se implementa el delegado


@end
