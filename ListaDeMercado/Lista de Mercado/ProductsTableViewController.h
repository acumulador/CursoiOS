//
//  ProductsTableViewController.h
//  Lista de Mercado
//
//  Created by Jhon Wilfer Orrego on 12/10/14.
//  Copyright (c) 2014 Juan C Salazar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListMarketTableViewController.h"
#import "Market.h"

@interface ProductsTableViewController : UITableViewController<UIAlertViewDelegate>
{
    Market * productsOfCategory;
    ListMarketTableViewController * listMarketVC;
    UIAlertView * messageCantProduct;
}

@property NSString * dataTransfer;

@end
