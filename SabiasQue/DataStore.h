//
//  DataStore.h
//  SabiasQue
//
//  Contiene el catálogo de categorías y datos curiosos de la app.
//

#import <Foundation/Foundation.h>

@interface DataStore : NSObject

/// Regresa el arreglo de nombres de categorías disponibles, en orden fijo.
+ (NSArray<NSString *> *)categoryNames;

/// Regresa el arreglo de datos curiosos (NSString) para la categoría indicada.
+ (NSArray<NSString *> *)factsForCategory:(NSString *)categoryName;

@end
