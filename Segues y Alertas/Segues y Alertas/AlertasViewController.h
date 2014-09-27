//
//  AlertasViewController.h
//  Segues y Alertas
//
//  Created by Juan C Salazar on 24/09/14.
//  Copyright (c) 2014 Juan C Salazar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlertasViewController : UIViewController<UIAlertViewDelegate, UIActionSheetDelegate>
{
    UIAlertView * alert;
}


- (IBAction)alertSimple:(id)sender;
- (IBAction)alertFields:(id)sender;
- (IBAction)seetActions:(id)sender;

@end
