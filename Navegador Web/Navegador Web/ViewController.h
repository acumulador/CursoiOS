//
//  ViewController.h
//  Navegador Web
//
//  Created by Juan C Salazar on 3/10/14.
//  Copyright (c) 2014 Juan C Salazar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIWebViewDelegate>


@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *animationActivity;
@property (strong, nonatomic) IBOutlet UIWebView *navegate;
- (IBAction)htmlButton:(id)sender;
- (IBAction)jsButton:(id)sender;
- (IBAction)urlButton:(id)sender;
- (IBAction)pdfButton:(id)sender;

@end

