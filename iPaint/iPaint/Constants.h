//
//  Constants.h
//  iPaint
//
//  Created by Juan C Salazar on 3/10/14.
//  Copyright (c) 2014 Juan C Salazar. All rights reserved.
//

#ifndef iPaint_Constants_h
#define iPaint_Constants_h

typedef enum
{
    //No es necesario definir la secuencia, solo basta con definir el punto inicial
    kLineShape = 0,
    kEllipseShape,
    kRectShape,
    kImageShape
} ShapeType;

typedef enum
{
    kRedtype = 0,
    kBlueType,
    kYellowType,
    kGreenType,
    kRamdomType
};ColorType;

#endif
