//
//  DetailViewController.m
//  PruebaSQL
//
//  Created by Juan C Salazar on 16/10/14.
//  Copyright (c) 2014 Juan C Salazar. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _nameUserDetailLabel.text = _nameUserDetail;
    _docUserDetailLabel.text = _docUserDetail;
    _ageDetailUserLabel.text = _ageUserDetail;
    _dateDetailLabel.text = _dateUserDetail;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
