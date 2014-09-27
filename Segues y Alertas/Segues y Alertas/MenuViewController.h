//
//  MenuViewController.h
//  Segues y Alertas
//
//  Created by Juan C Salazar on 24/09/14.
//  Copyright (c) 2014 Juan C Salazar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuViewController : UIViewController
- (IBAction)exitButton:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *userNameLabel;

//crea propiedad propia para recibir la información de la vista anterior por medio del segue
@property NSString * dataTransfer;

@end
