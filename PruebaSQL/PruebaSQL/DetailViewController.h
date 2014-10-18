//
//  DetailViewController.h
//  PruebaSQL
//
//  Created by Juan C Salazar on 16/10/14.
//  Copyright (c) 2014 Juan C Salazar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property NSString * nameUserDetail;
@property NSString * docUserDetail;
@property NSString * ageUserDetail;
@property NSString * dateUserDetail;

@property (strong, nonatomic) IBOutlet UILabel *nameUserDetailLabel;
@property (strong, nonatomic) IBOutlet UILabel *docUserDetailLabel;
@property (strong, nonatomic) IBOutlet UILabel *ageDetailUserLabel;
@property (strong, nonatomic) IBOutlet UILabel *dateDetailLabel;



@end
