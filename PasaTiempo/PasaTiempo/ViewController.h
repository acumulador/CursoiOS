//
//  ViewController.h
//  PasaTiempo
//
//  Created by Juan C Salazar on 26/09/14.
//  Copyright (c) 2014 Juan C Salazar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *timeLabel;
- (IBAction)iniciarTimeButton:(id)sender;
- (IBAction)reiniciarTimeButton:(id)sender;


@end

