//
//  Model.h
//  Calendar
//
//  Created by Juan C Salazar on 6/10/14.
//  Copyright (c) 2014 Juan C Salazar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
//Con esto hago referencia a la clase sin acceder a todos los metodos de la clase
@class CalendarViewController;

@interface Model : NSObject <UIPageViewControllerDataSource>

//Metodo que retorna el viewController dependiendo del mes
-(CalendarViewController *) viewControllerAtIndex:(NSInteger) index storyBoard:(UIStoryboard *) storyboard;

//Metodo que retorna el mes dependiendo del
-(NSUInteger) indexOfViewController:(CalendarViewController *)viewController;

@end
