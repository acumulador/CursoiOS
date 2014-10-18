//
//  ListUsersTableViewController.h
//  PruebaSQL
//
//  Created by Juan C Salazar on 16/10/14.
//  Copyright (c) 2014 Juan C Salazar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
#import "RepoUser.h"
#import "DetailViewController.h"

@interface ListUsersTableViewController : UITableViewController
{
    User * userList;
    DetailViewController * viewDetail;
}


@end
