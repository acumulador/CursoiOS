//
//  Converter.m
//  Conversor Temperatura
//
//  Created by Juan C Salazar on 19/09/14.
//  Copyright (c) 2014 Juan C Salazar. All rights reserved.
//

#import "Converter.h"

@implementation Converter

-(NSString *) convertCtoF:(float)value
{
    farenheit = value*9/5+32;
    return [NSString stringWithFormat:@" %.f Cº =>  %.02f Fº", value, farenheit];
}

-(NSString *) convertFtoC:(float)value
{
    celsius = 5*(value-32)/9;
    return [NSString stringWithFormat:@" %.02f Fº =>  %.f Cº", value, celsius];
}

-(NSString *) convertCtoK:(float)value
{
    kelvin = value+273.15;
    return [NSString stringWithFormat:@" %.02f Cº =>  %.02f Fº", value, kelvin];
}

-(NSString *) convertKtoC:(float)value
{
    celsius = value-273.15;
    return [NSString stringWithFormat:@" %.02f Kº =>  %.02f Cº", value, celsius];
}

-(NSString *) convertKtoF:(float)value
{
    farenheit = (value - 273.15) * 1.8+32;
    return [NSString stringWithFormat:@" %.02f Kº =>  %.02f Fº", value, farenheit];
}

-(NSString *) convertFtoK:(float)value
{
    kelvin = 5*(value-32)/5+32;
    return [NSString stringWithFormat:@" %.02f Fº =>  %.02f Kº", value, kelvin];
}


@end