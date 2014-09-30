//
//  User.m
//  Convertidor Dolares
//
//  Created by Juan C Salazar on 29/09/14.
//  Copyright (c) 2014 Juan C Salazar. All rights reserved.
//

#import "User.h"

@implementation User
//Implementación de propiedades
//get
-(NSString *) user
{
    return user;
}

-(NSString *) pass
{
    return pass;
}

//Set
-(void) setUser:(NSString *)userValue
{
    user = userValue;
}

-(void) setPass:(NSString *)passValue
{
    pass = passValue;
}

-(BOOL) verifyUserValue
{
    if ([user isEqualToString:@"admin"] && [pass isEqualToString:@"1234"]) {
        return YES;
    } else {
        return NO;
    }
}

@end
