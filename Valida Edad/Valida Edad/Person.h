//
//  Person.h
//  Valida Edad
//
//  Created by Juan C Salazar on 17/09/14.
//  Copyright (c) 2014 Juan C Salazar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    NSString * name;
    int age;
    NSString * city;
}

//set-get de atributos
-(NSString * ) name; //get
-(void) setName:(NSString *) nameValue; //set

-(int) age; //get
-(void) setAge:(int) ageValue; //set

-(NSString * ) city; //get
-(void) setCity:(NSString *) cityValue; //set

//metodo de instancia
-(BOOL) userIsAdult;

@end
