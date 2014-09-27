//
//  Converter.h
//  Conversor Temperatura
//
//  Created by Juan C Salazar on 19/09/14.
//  Copyright (c) 2014 Juan C Salazar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Converter : NSObject
{
    float celsius;
    float farenheit;
    float kelvin;
}

//metodos de instancia
-(NSString *)convertCtoF:(float)value;
-(NSString *)convertFtoC:(float)value;

-(NSString *)convertCtoK:(float)value;
-(NSString *)convertKtoC:(float)value;

-(NSString *)convertKtoF:(float)value;
-(NSString *)convertFtoK:(float)value;

@end
