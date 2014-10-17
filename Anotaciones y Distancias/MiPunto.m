#import "MiPunto.h"

@implementation MiPunto
-(id)init{
    //Cord Medellin : 6.235925, -75.57513
    return [self initWithCoordinate:CLLocationCoordinate2DMake(6.235925, -75.57513) andTitle:@"Medellin"];
}

-(id)initWithCoordinate:(CLLocationCoordinate2D)coor andTitle:(NSString *)theTitle{
    self = [super init];
    if (self) {
        _coordinate = coor;
        _title = theTitle;
    }
    return self;
}

@end
