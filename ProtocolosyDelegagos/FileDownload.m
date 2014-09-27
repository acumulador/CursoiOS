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
    
}

@end
