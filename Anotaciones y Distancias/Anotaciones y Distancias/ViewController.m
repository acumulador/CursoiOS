#import "ViewController.h"

@interface ViewController ()

@property MKPolyline * linea;
@property CLLocationManager * ubicacion;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   _ubicacion = [[CLLocationManager alloc] init];
    
    [_ubicacion setDesiredAccuracy:kCLLocationAccuracyBest];
    _ubicacion.delegate = self;
    
    [_ubicacion requestAlwaysAuthorization];

    
    [_ubicacion startUpdatingLocation];
//  [_ubicacion stopUpdatingLocation];
    
    [_mapView setShowsUserLocation:YES];
    
   
    //Medellin
    
    MiPunto * mdePunto = [[MiPunto alloc] init];
    
    MiPunto * bgtPunto = [[MiPunto alloc] initWithCoordinate:CLLocationCoordinate2DMake(4.60971, -74.08175) andTitle:@"Bogota"];
    
    MiPunto * mzePunto = [[MiPunto alloc] initWithCoordinate:CLLocationCoordinate2DMake(5.07, -75.52056) andTitle:@"Manizales"];
    
    _mapView.delegate = self;
    
    [_mapView addAnnotations:[NSArray arrayWithObjects:mdePunto,bgtPunto, mzePunto, nil]];
    
    //CALCULAR DISTANCIA ENTRE MEDELLIN Y BOGOTA
    
    CLLocation * punto1 = [[CLLocation alloc] initWithLatitude:bgtPunto.coordinate.latitude longitude:bgtPunto.coordinate.longitude];
    
    CLLocation * punto2 = [[CLLocation alloc] initWithLatitude:mdePunto.coordinate.latitude longitude:mdePunto.coordinate.longitude];

    CLLocationDistance distancia = [punto1 distanceFromLocation:punto2];
    
    UIAlertView * alerta = [[UIAlertView alloc] initWithTitle:@"Distancia" message:[NSString stringWithFormat:@"La distancia entre medellin y bogota es de %f km", distancia/1000] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];

    [alerta show];
    
    ///Linea entre Bogota y Medellin
    MKMapPoint * pointArray = malloc(sizeof(CLLocationCoordinate2D)*2);
    pointArray[0] = MKMapPointForCoordinate(bgtPunto.coordinate);
    pointArray[1] = MKMapPointForCoordinate(mdePunto.coordinate);
    _linea = [MKPolyline polylineWithPoints:pointArray count:2];
    [_mapView addOverlay:_linea];
}
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    CLLocation * newLocation = [locations lastObject];
    NSLog(@"La coordenada en latitud es: %f y longitud es: %f", newLocation.coordinate.latitude, newLocation.coordinate.longitude);

}

-(MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay{
    MKPolyline * ruta = overlay;
    MKPolylineRenderer * rutaRender = [[MKPolylineRenderer alloc] initWithPolyline:ruta];
    rutaRender.strokeColor = [UIColor redColor];
    return rutaRender;
}

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    
    IconAnnotationView * icon = [[[NSBundle mainBundle] loadNibNamed:@"IconView" owner:self options:nil] objectAtIndex:0];
    return icon;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
