//
//  ViewController.h
//  Camara
//
//  Created by Juan C Salazar on 17/10/14.
//  Copyright (c) 2014 Juan C Salazar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (strong, nonatomic) IBOutlet UIBarButtonItem *takePhotoBarButton;
- (IBAction)takePhotoGaleryBarButton:(id)sender;


- (IBAction)tkePhotoGaleryButton:(id)sender;

@property (strong, nonatomic) IBOutlet UIImageView *imageView;


@end

