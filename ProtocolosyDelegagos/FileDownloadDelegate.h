//
//  FileDownloadDelegate.h
//  ProtocolosyDelegagos
//
//  Created by Jhon Wilfer Orrego on 26/09/14.
//  Copyright (c) 2014 Jhon Wilfer Orrego. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FileDownloadDelegate <NSObject>

//Definir metodos del estado de la conexion
// 1. Recibe la respuesta del servidor
-(void)fileDownload:(NSURLConnection*)connection didReceiveResponse:(NSURLResponse*)response;
// 2. Comienza a descargar el archivo
-(void)fileChangeDownloading:(NSURLConnection*)connection didReceiveDada:(NSData*) data andProgress:(float)progress;
// 3. El archivo se descarga en memoria
-(void)FileFinishDownload:(NSString*)name;
// 4. El archivo se almacena en el dispositivo
-(void)FileFinishDownload:(NSString*)filePath andName:(NSString*)name;
// 5. Descarga con error
-(void)fileDownload:(NSURLConnection*)connection didFailWithError:(NSError*)error andName:(NSString*)name;


@end
