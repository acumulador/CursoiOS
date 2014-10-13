//
//  Market.m
//  Lista de Mercado
//
//  Created by Juan C Salazar on 12/10/14.
//  Copyright (c) 2014 Juan C Salazar. All rights reserved.
//

#import "Market.h"

@interface Market()
@property NSString * dataBasePath;
@end

@implementation Market

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
        if (sqlite3_open(dbPath, &conexDB)==SQLITE_OK) {
            NSLog(@"La base de datos se creo con exito!!");
            
            char * error;
            const char * sql_tabla = "CREATE TABLE IF NOT EXISTS tbl_empleados (id INTEGER PRIMARY KEY AUTOINCREMENT, emp_name TEXT, emp_cedula TEXT, emp_job TEXT, emp_phone TEXT, emp_adress TEXT)";
            
            if (sqlite3_exec(conexDB, sql_tabla, NULL, NULL, &error)==SQLITE_OK) {
                NSLog(@"Tabla creada con exito!!");
            } else {
                NSLog(@"Error en SQL");
            }
            
            sqlite3_close(conexDB);
            
        } else {
            NSLog(@"Error al crear la base de datos!!");
        }
    } else {
        NSLog(@"La base de datos ya existe!!");
    }
}

-(void)loadProductsOfCategory:(int)idCategory
{
    [self searchPathOfDatabase];
    sqlite3_stmt * querySearch;
    NSString * stringSearch;
    
    _arrayProduct = [[NSMutableArray alloc]init];
    _arrayValProduct = [[NSMutableArray alloc]init];
    
    stringSearch = [NSString stringWithFormat:@"SELECT * FROM tbl_productos WHERE idcategoria = %i ORDER BY ds_producto ASC", idCategory];
    
    if (sqlite3_open(dbPath, &conexDB)==SQLITE_OK) {
        const char * searchSql = [stringSearch UTF8String];
        if (sqlite3_prepare_v2(conexDB, searchSql, -1, &querySearch, NULL)==SQLITE_OK) {
            //Ciclo para todos los registro
            while (sqlite3_step(querySearch)==SQLITE_ROW) {
                
                [_arrayProduct addObject:[NSString stringWithFormat:@"%s", sqlite3_column_text(querySearch, 1)]];
                
                [_arrayValProduct addObject:[NSString stringWithFormat:@"%s", sqlite3_column_text(querySearch, 3)]];
            }
        }
    }else{
        NSLog(@"Error abriendo la base de datos!!");
    }
}


-(void)loadCategorys
{
    [self searchPathOfDatabase];
    sqlite3_stmt * querySearch;
    NSString * stringSearch;
    
    _arrayDsCategory = [[NSMutableArray alloc]init];
    
    stringSearch = [NSString stringWithFormat:@"SELECT * FROM tbl_categorias ORDER BY ds_categoria ASC"];
    if (sqlite3_open(dbPath, &conexDB)==SQLITE_OK) {
        const char * searchSql = [stringSearch UTF8String];
        if (sqlite3_prepare_v2(conexDB, searchSql, -1, &querySearch, NULL)==SQLITE_OK) {
            //Ciclo para todos los registro
            while (sqlite3_step(querySearch)==SQLITE_ROW) {
                
                [_arrayDsCategory addObject:[NSString stringWithFormat:@"%s", sqlite3_column_text(querySearch, 1)]];
            }
        }
    }else{
        NSLog(@"Error abriendo la base de datos!!");
    }
}

@end
