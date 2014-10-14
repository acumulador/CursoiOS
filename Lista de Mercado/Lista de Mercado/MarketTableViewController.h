//
//  MarketTableViewController.h
//  Lista de Mercado
//
//  Created by Juan C Salazar on 13/10/14.
//  Copyright (c) 2014 Juan C Salazar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Market.h"
#import "ListMarketTableViewController.h"

@interface MarketTableViewController : UITableViewController
{
    Market * allMarkets;
    ListMarketTableViewController * ListMarketVC;
}

@end
