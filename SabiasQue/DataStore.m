//
//  DataStore.m
//  SabiasQue
//

#import "DataStore.h"

@implementation DataStore

+ (NSArray<NSString *> *)categoryNames {
    return @[@"Ciencia", @"Historia", @"Animales"];
}

+ (NSArray<NSString *> *)factsForCategory:(NSString *)categoryName {

    NSDictionary<NSString *, NSArray<NSString *> *> *catalog = @{

        @"Ciencia": @[
            @"El corazón de un camarón está ubicado en su cabeza.",
            @"Un rayo es cinco veces más caliente que la superficie del sol.",
            @"La miel nunca se echa a perder si se almacena correctamente.",
            @"El cuerpo humano tiene suficiente hierro para fabricar un clavo de 7 cm."
        ],

        @"Historia": @[
            @"La Gran Muralla China tardó más de 2000 años en construirse.",
            @"Cleopatra vivió más cerca de la llegada del hombre a la Luna que de la construcción de las pirámides de Guiza.",
            @"El primer mensaje enviado por internet, en 1969, provocó que el sistema se colapsara tras dos letras.",
            @"La Torre Eiffel puede crecer más de 15 cm en verano por la dilatación del metal."
        ],

        @"Animales": @[
            @"Los pulpos tienen tres corazones y sangre azul.",
            @"Las jirafas solo duermen entre 30 minutos y 2 horas al día.",
            @"Los delfines tienen nombres propios: un silbido único para cada individuo.",
            @"Las mariposas saborean con las patas."
        ]
    };

    NSArray<NSString *> *facts = catalog[categoryName];
    return facts ?: @[];
}

@end
