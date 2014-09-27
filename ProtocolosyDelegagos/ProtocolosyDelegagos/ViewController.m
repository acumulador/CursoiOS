//
//  ViewController.m
//  ProtocolosyDelegagos
//
//  Created by Jhon Wilfer Orrego on 26/09/14.
//  Copyright (c) 2014 Jhon Wilfer Orrego. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(void) fileDownload:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    NSLog(@"Inicio Descarga");
}
-(void) fileChangeDownloading:(NSURLConnection *)connection didReceiveDada:(NSData *)data andProgress:(float)progress{
    NSLog(@"%f", progress * 100);
}
-(void)FileFinishDownload:(NSString *)name{
    NSLog(@"Descarga Existosa en Memoria");
}
-(void)FileFinishDownload:(NSString *)filePath andName:(NSString *)name{
    NSLog(@"Descarga Exitosa en dispositivo");
}
-(void)fileDownload:(NSURLConnection *)connection didFailWithError:(NSError *)error andName:(NSString *)name{
    NSLog(@"Error %@", error);
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)downloadFileButton:(id)sender {
    FileDownload * descarga = [[FileDownload alloc]init];
    [descarga initDownloadFile:@"http://icdn7.digitaltrends.com/image/nowhereelse-iphone-6-concept-gold-1131x753.jpg" withName:@"foto2.jpg"];
    descarga.delegate = self;

}
@end
