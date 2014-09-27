//
//  Person.m
//  Valida Edad
//
//  Created by Juan C Salazar on 17/09/14.
//  Copyright (c) 2014 Juan C Salazar. All rights reserved.
//

#import "Person.h"

@implementation Person

//implementaciones de propiedades
-(NSString *)name //get
{
    return name;
}

-(void)setName:(NSString *)nameValue //set
{
    name = nameValue;
}

-(int)age
{
    return age;
}

-(void)setAge:(int)ageValue
{
    age = ageValue;
}

-(NSString *)city
{
    return city;
}

-(void)setCity:(NSString *)cityValue
{
    city = cityValue;
}

-(BOOL) userIsAdult
{
    if (age > 17) {
        return YES;
    }
    else
    {
        return NO;
    }
}

@end
