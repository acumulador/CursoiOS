//
//  ViewController.m
//  Navegador Web
//
//  Created by Juan C Salazar on 3/10/14.
//  Copyright (c) 2014 Juan C Salazar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _navegate.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)urlButton:(id)sender {
    NSURL * url = [NSURL URLWithString:@"http://edusoftglobal.com/academia"];
    NSURLRequest * request = [[NSURLRequest alloc] initWithURL:url];
    [_navegate loadRequest:request];
}

- (IBAction)pdfButton:(id)sender {
    NSString * rutaPdf = [[NSBundle mainBundle] pathForResource:@"comfenalco" ofType:@"pdf"];
    
    NSData * dataPdf = [[NSData alloc] initWithContentsOfFile:rutaPdf];
    [_navegate loadData:dataPdf MIMEType:@"application/pdf" textEncodingName:nil baseURL:nil];
    [_navegate setScalesPageToFit:YES];
}

- (IBAction)htmlButton:(id)sender {
    NSString * htmlString = @"<h1>Hola Página</h1><p style='color:green;'>Este parrafo lo monte yo!!</p>";
    [_navegate loadHTMLString:htmlString baseURL:nil];
}

- (IBAction)jsButton:(id)sender {
    NSString * jsString = @"alert('Hola con JS');";
    [_navegate stringByEvaluatingJavaScriptFromString:jsString];
}

-(void) webViewDidStartLoad:(UIWebView *)webView
{
    _animationActivity.hidden=NO;
    [_animationActivity startAnimating];
}

-(void) webViewDidFinishLoad:(UIWebView *)webView
{
    _animationActivity.hidden = YES;
    [_animationActivity stopAnimating];
}

@end
