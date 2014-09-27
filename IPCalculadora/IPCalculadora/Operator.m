//
//  Operator.m
//  IPCalculadora
//
//  Created by Juan C Salazar on 24/09/14.
//  Copyright (c) 2014 Juan C Salazar. All rights reserved.
//

#import "Operator.h"

@implementation Operator
//Implementación de propiedades
//get
-(float) numberOne
{
    return numberOne;
}
-(float) numberTwo
{
    return numberTwo;
}
-(float) result
{
    return result;
}

//set
-(void)setNumberOne:(float)numberOneValue
{
    numberOne = numberOneValue;
}
-(void) setNumberTwo:(float)numberTwoValue
{
    numberTwo = numberTwoValue;
}
-(void) setResult:(float)resultValue
{
    result = resultValue;
}

//Implementación de metodos
-(void) suma2Numbers
{
    result = numberOne + numberTwo;
}

-(void) Multiplica2Numbers
{
    result = numberOne * numberTwo;
}

@end
