//
//  ConexDB.m
//  Lista de Mercado
//
//  Created by Juan C Salazar on 12/10/14.
//  Copyright (c) 2014 Juan C Salazar. All rights reserved.
//

#import "ConexDB.h"

@interface ConexDB()
@property NSString * dataBasePath;
@end

@implementation ConexDB

const char * dbPath;

-(void)searchPathOfDatabase
{
    NSString * rutaFolderDoc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0 ];
    NSLog(@"Ruta BD %@",rutaFolderDoc);
    _dataBasePath = [rutaFolderDoc stringByAppendingPathComponent:@"MarketList.db"];
    dbPath = [_dataBasePath UTF8String];
}

-(void)createDatabaseInDocuments
{
    [self searchPathOfDatabase];
    NSFileManager * fm = [[NSFileManager alloc] init];
    if ([fm fileExistsAtPath:_dataBasePath]==NO) {
        if (sqlite3_open(dbPath, &conexDb)==SQLITE_OK) {
            NSLog(@"La base de datos se creo con exito!!");
            
            char * error;
            const char * sql_tabla = "CREATE TABLE IF NOT EXISTS tbl_empleados (id INTEGER PRIMARY KEY AUTOINCREMENT, emp_name TEXT, emp_cedula TEXT, emp_job TEXT, emp_phone TEXT, emp_adress TEXT)";
            
            if (sqlite3_exec(conexDb, sql_tabla, NULL, NULL, &error)==SQLITE_OK) {
                NSLog(@"Tabla creada con exito!!");
            } else {
                NSLog(@"Error en SQL");
            }
            
            sqlite3_close(conexDb);
            
        } else {
            NSLog(@"Error al crear la base de datos!!");
        }
    } else {
        NSLog(@"La base de datos ya existe!!");
    }
}

@end
