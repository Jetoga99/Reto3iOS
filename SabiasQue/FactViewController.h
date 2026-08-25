//
//  FactViewController.h
//  SabiasQue
//
//  Pantalla 2: muestra un dato curioso de la categoría seleccionada.
//  Cada vez que se toca el botón se muestra un dato distinto.
//

#import <UIKit/UIKit.h>

@interface FactViewController : UIViewController

- (instancetype)initWithCategory:(NSString *)categoryName;

@end
