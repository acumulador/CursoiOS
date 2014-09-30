//
//  FileDownload.m
//  ProtocolosyDelegagos
//
//  Created by Jhon Wilfer Orrego on 26/09/14.
//  Copyright (c) 2014 Jhon Wilfer Orrego. All rights reserved.
//

#import "FileDownload.h"

@interface FileDownload(){
    float progress;
}
@property long long expectedLength;
@property NSMutableData * fileData;
@property NSString * fileName;

@end


@implementation FileDownload

//Metodos de NSURLConnectionDataDelegate
-(void)connection:(NSURLConnection*)connection didReceiveResponse:(NSURLResponse *)response{
    _expectedLength = [response expectedContentLength];
    progress = 0;
    [_delegate fileDownload:connection didReceiveResponse:response];
}
-(void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    progress += [data length];
    [_fileData appendData:data];
    [_delegate fileChangeDownloading:connection didReceiveDada:data andProgress:progress/(float)_expectedLength];
}

-(void) connectionDidFinishLoading:(NSURLConnection *)connection{
    [_delegate FileFinishDownload:_fileName];
    //Metodo que guarda la imagen en el dispositivo
    [self saveFile:_fileData withname:_fileName];
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    [_delegate fileDownload:connection didFailWithError:error andName:_fileName];
}
-(void)saveFile:(NSData*)fileData withname:(NSString*)name{
    NSArray * rutas = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
    NSString * ruta = [rutas objectAtIndex:0];
    NSLog(@"%@", ruta);
    BOOL isDir = NO;
    NSFileManager * fm = [[NSFileManager alloc]init];
    NSString * carpetaFotos = [ruta stringByAppendingPathComponent:@"/imagenes"];
    if (![fm fileExistsAtPath:carpetaFotos isDirectory:&isDir]) {
        [fm createDirectoryAtPath:carpetaFotos withIntermediateDirectories:YES attributes:nil error:nil];
    }
    NSString * archivo = [carpetaFotos stringByAppendingPathComponent:name];
    NSError * error = nil;
    [_fileData writeToFile:archivo options:NSDataWritingAtomic error:&error];
    if (error) {
        NSLog(@"Error!!! %@", error);
        [_delegate fileDownload:nil didFailWithError:error andName:name];
    }else{
        [_delegate FileFinishDownload:archivo andName:name];
    }
    
}
-(void)initDownloadFile:(NSString *)url withName:(NSString *)name{
    _fileName = name;
    _fileData = [[NSMutableData alloc]init];
    NSURL * urlLoad = [NSURL URLWithString:url];
    NSURLRequest * urlRequest = [NSURLRequest requestWithURL:urlLoad];
    NSURLConnection * conexion = [[NSURLConnection alloc]initWithRequest:urlRequest delegate:self];
    [conexion start];
}
@end
