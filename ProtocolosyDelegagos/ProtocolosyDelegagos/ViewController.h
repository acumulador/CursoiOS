//
//  ViewController.h
//  ProtocolosyDelegagos
//
//  Created by Jhon Wilfer Orrego on 26/09/14.
//  Copyright (c) 2014 Jhon Wilfer Orrego. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FileDownload.h"

@interface ViewController : UIViewController <FileDownloadDelegate>
@property (strong, nonatomic) IBOutlet UITextField *urlText;
@property (strong, nonatomic) IBOutlet UITextField *fileText;

- (IBAction)downloadFileButton:(id)sender;
@property (strong, nonatomic) IBOutlet UIProgressView *progressView;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@end

