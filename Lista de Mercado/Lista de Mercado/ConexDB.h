//
//  ConexDB.h
//  Lista de Mercado
//
//  Created by Juan C Salazar on 12/10/14.
//  Copyright (c) 2014 Juan C Salazar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface ConexDB : NSObject
{
    sqlite3 * conexDB;
}

-(void) searchPathOfDatabase;
-(void) createDatabaseInDocuments;

@end
