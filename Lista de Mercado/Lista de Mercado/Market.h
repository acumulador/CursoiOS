//
//  Market.h
//  Lista de Mercado
//
//  Created by Juan C Salazar on 12/10/14.
//  Copyright (c) 2014 Juan C Salazar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "ConexDB.h"

@interface Market : NSObject

-(void) loadCategorys;
//Carga productos por categoria seleccionada
-(void) loadProductsOfCategory:(NSString *) idCategory;
//Cargar la lista de mercado de la ultima lista
-(void) loadMarketWithIdListMarket:(NSString *) idListMarket;
//Cargar listas de mercado
-(void) loadListMarket;

//Agrega producto seleccionada a la lista actual
-(void) addProductAtMarket:(NSString *) idProduct;
-(void) delProductAtMarket:(NSString *) idProduct;
-(void) updateProductAtMarket:(NSString *) idProduct;
-(void) compareProducts:(NSString *) idProduct;
//Crear lista de mercado
-(void) addListMarketWithDate:(NSString *) dateList AndMarket:(NSString *) market;

@end
