//
//  ViewController.m
//  Variables
//
//  Created by Juan C Salazar on 17/09/14.
//  Copyright (c) 2014 Juan C Salazar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    int ed = 34;
    //NSString no puede variar en la aplicación
    NSString * mensa = [NSString stringWithFormat:@"Mi nombre es: Pepito y tengo %i años", ed];
    
    //NSMutableString --> el string es variable en la aplicación
    NSMutableString * mensa2 = [NSMutableString stringWithFormat:@"Mi nombre es: "];
    
    [mensa2 appendString:@"JuanC"];
    
    //Array: NSArray no cambia despues de concebido el arreglo, NSMutableArray puede variar
    NSArray * meses = @[@"Enero",@"Febrero", @"Marzo"];
    //Otra forma de llenar el array
    NSArray * meses2 = [[NSArray alloc] initWithObjects:@"Abril",@"Mayo",@"Junio", nil];
    //Obtener un elemento del array
    NSString * myMes = [meses2 objectAtIndex:2];
    
    //Array Mutable
    NSMutableArray * mesesAno = [[NSMutableArray alloc] initWithArray:meses];
    
    //Agrega objetos al array mutable
    [mesesAno addObject:@"Julio"];
    
    //Eliminar objetos del array
    [mesesAno removeObjectAtIndex:1];
    [mesesAno removeAllObjects];
    [mesesAno removeLastObject];
    
    //Diccionarios
    NSDictionary * diccionario = @{@"usuario": @"Juan", @"ciudad": @"Medellin"};
    NSDictionary * dicc = [[NSDictionary alloc]initWithObjectsAndKeys:@"Juan", @"usuario", @"20",@"edad", @"Medellin", @"ciudad", nil];
    
    NSString * usuarioEdad = [dicc objectForKey:@"ciudad"];
    
    //Mutable diccionario
    NSMutableDictionary * diccionarioMutable = [[NSMutableDictionary alloc] initWithDictionary:dicc];
    
    //acciones en diccionario
    [diccionarioMutable setValue:@"Paris" forKey:@"ciudad"];
    [diccionarioMutable removeObjectForKey:@"edad"];
    //setValue busca la llave y si existe la actualiza pero si no existe la creac
    [diccionarioMutable setValue:@"Futbol" forKey:@"deporte"];
    
    NSLog(@"%@",diccionarioMutable);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
