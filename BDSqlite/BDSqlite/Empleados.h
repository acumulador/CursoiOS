//
//  Empleados.h
//  BDSqlite
//
//  Created by Juan C Salazar on 8/10/14.
//  Copyright (c) 2014 Juan C Salazar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface Empleados : NSObject
{
    sqlite3 * conexDb;
}

@property NSString * empId;
@property NSString * empName;
@property NSString * empCedula;
@property NSString * empJob;
@property NSString * empPhone;
@property NSString * empAdress;

@property NSMutableArray * arrayEmployesNames;
@property NSMutableArray * arrayEmployesCedula;

@property NSString * status;

@property NSString * prueba;

-(void) searchPathOfDatabase;
-(void) createDatabaseInDocuments;
-(void) insertEmployedInDatabases;
-(void) searchEmployedInDataBase;
-(void) updateEmployedInDataBase;
-(void) deleteEmployedInDataBase;

-(void) searchEmployed;


@end
