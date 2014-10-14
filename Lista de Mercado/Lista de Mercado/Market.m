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

-(void)sumValuesMarketList:(int)idListMarket
{
    [self searchPathOfDatabase];
    sqlite3_stmt * querySearch;
    NSString * stringSearch;
    
    _totalValuesMarket = [[NSString alloc]init];
    
    stringSearch = [NSString stringWithFormat:@"select sum(valor_sub) as total_mercado from tbl_mercado where idmercado = %i", idListMarket];
    
    if (sqlite3_open(dbPath, &conexDB)==SQLITE_OK) {
        const char * searchSql = [stringSearch UTF8String];
        if (sqlite3_prepare_v2(conexDB, searchSql, -1, &querySearch, NULL)==SQLITE_OK) {
            if (sqlite3_step(querySearch)==SQLITE_ROW) {
                _totalValuesMarket = [NSString stringWithFormat:@"%s", sqlite3_column_text(querySearch, 0)];
            }else{
                NSLog(@"Error en la consulta!!");
            }
        }
    }else{
        NSLog(@"Error abriendo la base de datos!!");
    }
}

-(void)searchListMarket
{
    //Cargar lista de mercado con parametro para ultima lista
    [self searchPathOfDatabase];
    sqlite3_stmt * querySearch;
    NSString * stringSearch;
    
    _arrayNameSuperMarketList = [[NSMutableArray alloc]init];
    _arrayFechaSuperMarketList = [[NSMutableArray alloc]init];
    
    stringSearch = [NSString stringWithFormat:@"SELECT * FROM tbl_listamercado ORDER BY id_listamercado ASC"];
    
    if (sqlite3_open(dbPath, &conexDB)==SQLITE_OK) {
        const char * searchSql = [stringSearch UTF8String];
        if (sqlite3_prepare_v2(conexDB, searchSql, -1, &querySearch, NULL)==SQLITE_OK) {
            //Ciclo para todos los registro
            while (sqlite3_step(querySearch)==SQLITE_ROW) {
                
                [_arrayNameSuperMarketList addObject:[NSString stringWithFormat:@"%s", sqlite3_column_text(querySearch, 3)]];
                
                [_arrayFechaSuperMarketList addObject:[NSString stringWithFormat:@"%s", sqlite3_column_text(querySearch, 1)]];
            }
        }
        
        sqlite3_finalize(querySearch);
        sqlite3_close(conexDB);
        
    }else{
        NSLog(@"Error al abrir la base de datos");
    }
}

-(void)addListMarket:(NSString *)market
{
    [self searchPathOfDatabase];
    sqlite3_stmt * queryInsert;
    
    if (sqlite3_open(dbPath, &conexDB)==SQLITE_OK) {
        
        //Tomo y formato la fecha del dispositivo
        NSDateFormatter * dateFormat = [[NSDateFormatter alloc]init];
        [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        NSString *dateString=[dateFormat stringFromDate:[NSDate date]];
        
        NSString * stringInsert = [NSString stringWithFormat:@"INSERT INTO tbl_listamercado (fecha_mercado, valor, supermercado) VALUES (\"%@\", \"%@\", \"%@\")", dateString, @"0", market];
        
        const char * insertSql = [stringInsert UTF8String];
        sqlite3_prepare_v2(conexDB, insertSql, -1, &queryInsert, NULL);
        
        if (sqlite3_step(queryInsert)==SQLITE_DONE) {
            _status = @"Super Mercado creado con Exito!!";
        } else {
            _status = @"Error almacenando el Super Mercado!!";
        }
        
        sqlite3_finalize(queryInsert);
        sqlite3_close(conexDB);
        
    } else {
        NSLog(@"Error al abrir la base de datos");
    }
}

-(void)loadMarketWithIdListMarket:(int) idListMarket
{
    //Cargar lista de mercado con parametro para ultima lista
    [self searchPathOfDatabase];
    sqlite3_stmt * querySearch;
    NSString * stringSearch;
    
    _arrayProduct = [[NSMutableArray alloc]init];
    _arrayCantProduct = [[NSMutableArray alloc]init];
    _arrayValProduct = [[NSMutableArray alloc]init];
    _arraySubTotal = [[NSMutableArray alloc]init];
    
    stringSearch = [NSString stringWithFormat:@"select tbl_listamercado.supermercado, tbl_productos.ds_producto, tbl_productos.valor_un, tbl_mercado.cantidad, tbl_mercado.valor_sub from tbl_listamercado inner join tbl_mercado on tbl_listamercado.id_listamercado = tbl_mercado.idmercado inner join tbl_productos on tbl_mercado.idproducto = tbl_productos.id_producto where tbl_listamercado.id_listamercado = %i", idListMarket];
    
    if (sqlite3_open(dbPath, &conexDB)==SQLITE_OK) {
        const char * searchSql = [stringSearch UTF8String];
        if (sqlite3_prepare_v2(conexDB, searchSql, -1, &querySearch, NULL)==SQLITE_OK) {
            //Ciclo para todos los registro
            while (sqlite3_step(querySearch)==SQLITE_ROW) {
                
                [_arrayProduct addObject:[NSString stringWithFormat:@"%s", sqlite3_column_text(querySearch, 1)]];
                
                [_arrayCantProduct addObject:[NSString stringWithFormat:@"%s", sqlite3_column_text(querySearch, 0)]];
                
                [_arrayValProduct addObject:[NSString stringWithFormat:@"%s", sqlite3_column_text(querySearch, 3)]];
                
                [_arraySubTotal addObject:[NSString stringWithFormat:@"%s", sqlite3_column_text(querySearch, 4)]];
            }
        }
        
        sqlite3_finalize(querySearch);
        sqlite3_close(conexDB);
        
    }else{
        NSLog(@"Error abriendo la base de datos!!");
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
    
    stringSearch = [NSString stringWithFormat:@"SELECT * FROM tbl_categorias ORDER BY id_categoria ASC"];
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
