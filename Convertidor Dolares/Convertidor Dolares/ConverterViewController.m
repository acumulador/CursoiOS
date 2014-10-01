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

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    configView = [segue destinationViewController];
    configView.delegate = self;
}

//Se implementa el delegado
-(void) updateValues:(int)Min And:(int)MaxDolar
{
    _initialValueDolarLabel.text = [NSString stringWithFormat:@"%.1i", Min];
    _finishValueDolarLabel.text = [NSString stringWithFormat:@"%.1i", MaxDolar];
    _valuesDolarSlider.minimumValue = Min;
    _valuesDolarSlider.maximumValue = MaxDolar;
}

@end
