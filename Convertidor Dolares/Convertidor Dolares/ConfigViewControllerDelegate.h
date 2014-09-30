//
//  ConfigViewControllerDelegate.h
//  Convertidor Dolares
//
//  Created by Juan C Salazar on 29/09/14.
//  Copyright (c) 2014 Juan C Salazar. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ConfigViewControllerDelegate <NSObject>

-(void) updateValues:(int)Min And:(int)MaxDolar;

@end
