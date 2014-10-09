//
//  Empleados.m
//  BDSqlite
//
//  Created by Juan C Salazar on 8/10/14.
//  Copyright (c) 2014 Juan C Salazar. All rights reserved.
//

#import "Empleados.h"

@interface Empleados()
@property NSString * dataBasePath;
@end


@implementation Empleados

const char * dbPath;

-(void)searchPathOfDatabase
{
    NSString * rutaFolderDoc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0 ];
    NSLog(@"Ruta BD %@",rutaFolderDoc);
    _dataBasePath = [rutaFolderDoc stringByAppendingPathComponent:@"empleados.db"];
    dbPath = [_dataBasePath UTF8String];
}

-(void)insertEmployedInDatabases
{
    [self searchPathOfDatabase];
    sqlite3_stmt * queryInsert;
    
    if (sqlite3_open(dbPath, &conexDb)==SQLITE_OK) {
        NSString * stringInsert = [NSString stringWithFormat:@"INSERT INTO tbl_empleados (emp_name, emp_cedula, emp_job, emp_phone, emp_adress) VALUES (\"%@\", \"%@\", \"%@\", \"%@\", \"%@\")", _empName, _empCedula, _empJob,_empPhone, _empAdress];
        
        const char * insertSql = [stringInsert UTF8String];
        sqlite3_prepare_v2(conexDb, insertSql, -1, &queryInsert, NULL);
        
        if (sqlite3_step(queryInsert)==SQLITE_DONE) {
            _status = @"Empleado creado con Exito!!";
        } else {
            NSLog(@"Error almacenando el empleado!!");
        }
        
        sqlite3_finalize(queryInsert);
        sqlite3_close(conexDb);
        
    } else {
        NSLog(@"Error al abrir la base de datos");
    }
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
