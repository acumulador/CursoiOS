//
//  ViewController.h
//  Segues y Alertas
//
//  Created by Juan C Salazar on 24/09/14.
//  Copyright (c) 2014 Juan C Salazar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuViewController.h"

@interface ViewController : UIViewController
{
    MenuViewController * secondVista;
}

@property (strong, nonatomic) IBOutlet UITextField *userNameLoginText;
@property (strong, nonatomic) IBOutlet UITextField *paswordLoginText;


@end

