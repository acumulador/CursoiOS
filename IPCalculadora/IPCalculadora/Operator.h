//
//  Operator.h
//  IPCalculadora
//
//  Created by Juan C Salazar on 24/09/14.
//  Copyright (c) 2014 Juan C Salazar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Operator : NSObject
{
    float numberOne;
    float numberTwo;
    float result;
}

//Propiedades
-(float) numberOne; //get
-(float) numberTwo; //get
-(float) result; //get

-(void) setNumberOne:(float) numberOneValue; //set
-(void) setNumberTwo:(float) numberTwoValue; //set
-(void) setResult:(float) resultValue; //set

//Metodos
-(void) suma2Numbers;
-(void) Multiplica2Numbers;

@end
