//
//  ListMarketTableViewController.h
//  Lista de Mercado
//
//  Created by Jhon Wilfer Orrego on 12/10/14.
//  Copyright (c) 2014 Juan C Salazar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Market.h"

@interface ListMarketTableViewController : UITableViewController
{
    Market * listMarket;
}

@property (strong, nonatomic) IBOutlet UILabel *totalMarketLabel;

@end
