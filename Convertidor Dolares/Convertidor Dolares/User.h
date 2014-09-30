//
//  User.h
//  Convertidor Dolares
//
//  Created by Juan C Salazar on 29/09/14.
//  Copyright (c) 2014 Juan C Salazar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject
{
    NSString * user;
    NSString * pass;
}

//Propiedades
-(NSString *) user; //get
-(NSString *) pass; //get

-(void) setUser:(NSString *) userValue; //set
-(void) setPass:(NSString *) passValue; //set

//Metodos
-(BOOL) verifyUserValue;

@end
