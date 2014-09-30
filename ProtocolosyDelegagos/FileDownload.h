//
//  FileDownload.h
//  ProtocolosyDelegagos
//
//  Created by Jhon Wilfer Orrego on 26/09/14.
//  Copyright (c) 2014 Jhon Wilfer Orrego. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FileDownloadDelegate.h"

@interface FileDownload : NSObject <NSURLConnectionDataDelegate>

@property id <FileDownloadDelegate> delegate;

-(void)initDownloadFile:(NSString*)url withName: (NSString*)name;

@end
