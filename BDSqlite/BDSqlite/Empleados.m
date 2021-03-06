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

-(void)deleteEmployedInDataBase
{
    [self searchPathOfDatabase];
    sqlite3_stmt * queryDel;
    
    if (sqlite3_open(dbPath, &conexDb)==SQLITE_OK) {
        
        NSString * stringDel = [NSString stringWithFormat:@"DELETE FROM tbl_empleados WHERE emp_cedula = \"%@\"", _empCedula];
        
        const char * delSql = [stringDel UTF8String];
        sqlite3_prepare_v2(conexDb, delSql, -1, &queryDel, NULL);
        
        if (sqlite3_step(queryDel)==SQLITE_DONE) {
            _status = @"Empleado Eliminado correctamente!!";
        } else {
            NSLog(@"Error Eliminando el empleado!!");
        }
        
        sqlite3_finalize(queryDel);
        sqlite3_close(conexDb);
        
    } else {
        NSLog(@"Error al abrir la base de datos");
    }
}


-(void)updateEmployedInDataBase
{
    [self searchPathOfDatabase];
    sqlite3_stmt * queryUpdate;
    
    if (sqlite3_open(dbPath, &conexDb)==SQLITE_OK) {
        
        NSString * stringUpdate = [NSString stringWithFormat:@"UPDATE tbl_empleados SET emp_name = \"%@\", emp_job = \"%@\", emp_phone = \"%@\", emp_adress = \"%@\"  WHERE emp_cedula = \"%@\"",_empName, _empJob, _empPhone, _empAdress, _empCedula];
        
        const char * updateSql = [stringUpdate UTF8String];
        sqlite3_prepare_v2(conexDb, updateSql, -1, &queryUpdate, NULL);
        
        if (sqlite3_step(queryUpdate)==SQLITE_DONE) {
            _status = @"Empleado Actualizado con Exito!!";
        } else {
            NSLog(@"Error actualizando el empleado!!");
        }
        
        sqlite3_finalize(queryUpdate);
        sqlite3_close(conexDb);
        
    } else {
        NSLog(@"Error al abrir la base de datos");
    }
}

-(void)searchEmployedInDataBase
{
    [self searchEmployed];
}

-(void) searchEmployed
{
    [self searchPathOfDatabase];
    sqlite3_stmt * querySearch;
    NSString * stringSearch;
    _arrayEmployesNames = [[NSMutableArray alloc]init];
    _arrayEmployesCedula = [[NSMutableArray alloc]init];
    
    if (_empCedula==nil) {
        //Consulto todos los empleados
        stringSearch = [NSString stringWithFormat:@"SELECT * FROM tbl_empleados ORDER BY emp_name"];
        if (sqlite3_open(dbPath, &conexDb)==SQLITE_OK) {
            const char * searchSql = [stringSearch UTF8String];
            if (sqlite3_prepare_v2(conexDb, searchSql, -1, &querySearch, NULL)==SQLITE_OK) {
                
                //Ciclo para todos los registro
                while (sqlite3_step(querySearch)==SQLITE_ROW) {
                    
                    [_arrayEmployesNames addObject:[NSString stringWithFormat:@"%s", sqlite3_column_text(querySearch, 1)]];
                    
                    [_arrayEmployesCedula addObject:[NSString stringWithFormat:@"%s", sqlite3_column_text(querySearch, 2)]];
                }
                
                _status = @"Usuarios Listados!!";
            }
            sqlite3_finalize(querySearch);
            sqlite3_close(conexDb);
            
        } else {
            NSLog(@"Error abriendo la base de datos!!");
        }
    } else {
        //Consulto por parametro un empleado
        stringSearch = [NSString stringWithFormat:@"SELECT * FROM tbl_empleados WHERE emp_cedula = \"%@\"", _empCedula];
        if (sqlite3_open(dbPath, &conexDb)==SQLITE_OK) {
            const char * searchSql = [stringSearch UTF8String];
            if (sqlite3_prepare_v2(conexDb, searchSql, -1, &querySearch, NULL)==SQLITE_OK) {
                if (sqlite3_step(querySearch)==SQLITE_ROW) {
                    _status = @"Usuario Encontrado";
                    _empId = [NSString stringWithFormat:@"%s", sqlite3_column_text(querySearch, 0)];
                    _empName = [NSString stringWithFormat:@"%s", sqlite3_column_text(querySearch, 1)];
                    _empCedula = [NSString stringWithFormat:@"%s", sqlite3_column_text(querySearch, 2)];
                    _empJob = [NSString stringWithFormat:@"%s", sqlite3_column_text(querySearch, 3)];
                    _empPhone = [NSString stringWithFormat:@"%s", sqlite3_column_text(querySearch, 4)];
                    _empAdress = [NSString stringWithFormat:@"%s", sqlite3_column_text(querySearch, 5)];
                } else {
                    NSLog(@"Error en la consulta!!");
                }
            }
            
            sqlite3_finalize(querySearch);
            sqlite3_close(conexDb);
            
        } else {
            NSLog(@"Error abriendo la base de datos!!");
        }
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
