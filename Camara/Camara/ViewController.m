//
//  ViewController.m
//  Camara
//
//  Created by Juan C Salazar on 17/10/14.
//  Copyright (c) 2014 Juan C Salazar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Primero detecto si el usuario tiene camara
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIAlertView * error = [[UIAlertView alloc]initWithTitle:@"Camara" message:@"Error, usted no tienes acceso a camara, por favor verifique" delegate:self cancelButtonTitle:@"Aceptar" otherButtonTitles: nil];
        [error show];
        _takePhotoBarButton.enabled = NO;
    }
}
- (IBAction)takePhotoGaleryBarButton:(id)sender{
    UIImagePickerController * camara = [[UIImagePickerController alloc] init];
    camara.delegate = self;
    camara.sourceType = UIImagePickerControllerSourceTypeCamera;
    [camara setCameraDevice:UIImagePickerControllerCameraDeviceRear];
    
    [self presentViewController:camara animated:YES completion:nil];
}
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    UIImage * imagenCapturada = info[UIImagePickerControllerOriginalImage];
    _imageView.image = imagenCapturada;
    if (picker.sourceType == UIImagePickerControllerSourceTypeCamera) {
       UIImageWriteToSavedPhotosAlbum(imagenCapturada, nil, nil, nil);
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];

}
- (IBAction)tkePhotoGaleryButton:(id)sender{
    UIImagePickerController * galeria = [[UIImagePickerController alloc] init];
    galeria.delegate = self;
    galeria.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:galeria animated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
