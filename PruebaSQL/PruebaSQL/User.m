//
//  User.m
//  PruebaSQL
//
//  Created by Juan C Salazar on 16/10/14.
//  Copyright (c) 2014 Juan C Salazar. All rights reserved.
//

#import "User.h"

@interface User()
@property NSString * dataBasePath;
@end

const char * dbPath;

@implementation User

-(void)moveDataBaseAtLibrary
{
    BOOL goodDB;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSError * error;
    
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    
    NSString * libraryDirectory = [paths objectAtIndex:0];
    
    NSString * writableDBPath = [libraryDirectory stringByAppendingPathComponent:@"PruebaSQLite.db"];
    
    goodDB = [fileManager fileExistsAtPath:writableDBPath];
    
    if (goodDB) return;
    
    // Si no existe en Library, la copio desde el original.
    NSString * defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"PruebaSQLite.db"];
    
    goodDB = [fileManager copyItemAtPath:defaultDBPath toPath:writableDBPath error:&error];
    
    if (!goodDB) {
        NSAssert1(0, @"Error al cargar la base de datos, error = '%@'.", [error localizedDescription]);
    }
    else{
        NSLog(@"La base de datos se movio correctamente!!");
    }
}

-(void)searchPathOfDatabase
{
    //NSString * rutaFolderDoc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0 ];
    NSString * rutaFolderDoc = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    
    NSLog(@"Ruta BD %@",rutaFolderDoc);
    _dataBasePath = [rutaFolderDoc stringByAppendingPathComponent:@"PruebaSQLite.db"];
    dbPath = [_dataBasePath UTF8String];
}

-(void)loadAllUsersOfDataBase
{
    _arrayUsers = [[NSMutableArray alloc]init];
    
    //Cargar lista de mercado con parametro para ultima lista
    [self searchPathOfDatabase];
    sqlite3_stmt * querySearch;
    NSString * stringSearch;
    
    stringSearch = [NSString stringWithFormat:@"SELECT * FROM tbl_usuarios"];
    
    if (sqlite3_open(dbPath, &conexDB)==SQLITE_OK) {
        const char * searchSql = [stringSearch UTF8String];
        if (sqlite3_prepare_v2(conexDB, searchSql, -1, &querySearch, NULL)==SQLITE_OK) {
            //Ciclo para todos los registro
            while (sqlite3_step(querySearch)==SQLITE_ROW) {
                
                tempUser = [[RepoUser alloc]init];
                
                tempUser.docUser = [NSString stringWithFormat:@"%s", sqlite3_column_text(querySearch, 0)];
                tempUser.nameUser = [NSString stringWithFormat:@"%s", sqlite3_column_text(querySearch, 1)];
                tempUser.ageUser = [NSString stringWithFormat:@"%s", sqlite3_column_text(querySearch, 2)];
                
                tempUser.dateUser = [NSString stringWithFormat:@"%s", sqlite3_column_text(querySearch, 3)];
                
                [_arrayUsers addObject:tempUser];
            }
        }
        
        sqlite3_finalize(querySearch);
        sqlite3_close(conexDB);
        
    }else{
        NSLog(@"Error al abrir la base de datos");
    }
}

-(void)addUserAtDataBase
{
    [self searchPathOfDatabase];
    sqlite3_stmt * queryInsert;
    
    if (sqlite3_open(dbPath, &conexDB)==SQLITE_OK) {
        NSString * stringInsert = [NSString stringWithFormat:@"INSERT INTO tbl_usuarios (doc, nom, edad, fecha_in) VALUES (%i, \"%@\", %i, \"%@\")", [_docUser intValue],_nomUser, [_ageUser intValue], _dateInUser];
        
        const char * insertSql = [stringInsert UTF8String];
        sqlite3_prepare_v2(conexDB, insertSql, -1, &queryInsert, NULL);
        
        if (sqlite3_step(queryInsert)==SQLITE_DONE) {
            _status = @"Usuario Agregado con Exito!!";
        } else {
            _status = @"Error almacenando el Usuario de Mercado!!";
            //Obtengo la descripcion del error
            NSLog(@"Error al agregar el producto. %s ", sqlite3_errmsg(conexDB));
            // Indica el numero del error.
            //int intInsert = sqlite3_step(queryInsert);
            //NSLog(@"%i",intInsert);
        }
        
        sqlite3_finalize(queryInsert);
        sqlite3_close(conexDB);
        
    } else {
        NSLog(@"Error al abrir la base de datos");
    }
}

@end
