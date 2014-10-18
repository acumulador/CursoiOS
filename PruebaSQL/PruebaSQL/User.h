//
//  User.h
//  PruebaSQL
//
//  Created by Juan C Salazar on 16/10/14.
//  Copyright (c) 2014 Juan C Salazar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "RepoUser.h"

@interface User : NSObject
{
    sqlite3 * conexDB;
    RepoUser * tempUser;
}

@property NSString * status;
@property NSString * nomUser;
@property NSString * docUser;
@property NSString * ageUser;
@property NSDate * dateInUser;

@property NSMutableArray * arrayUsers;

-(void) searchPathOfDatabase;
-(void) moveDataBaseAtLibrary;

-(void) loadAllUsersOfDataBase;
-(void) addUserAtDataBase;

@end
