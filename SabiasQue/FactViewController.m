//
//  FactViewController.m
//  SabiasQue
//

#import "FactViewController.h"
#import "DataStore.h"

@interface FactViewController ()

@property (nonatomic, copy) NSString *categoryName;
@property (nonatomic, strong) NSArray<NSString *> *facts;
@property (nonatomic, assign) NSInteger currentFactIndex;
@property (nonatomic, strong) UILabel *factLabel;

@end

@implementation FactViewController

- (instancetype)initWithCategory:(NSString *)categoryName {
    self = [super init];
    if (self) {
        _categoryName = [categoryName copy];
        _facts = [DataStore factsForCategory:categoryName];
        _currentFactIndex = -1;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = self.categoryName;
    self.view.backgroundColor = [UIColor systemBackgroundColor];

    UIView *card = [[UIView alloc] init];
    card.backgroundColor = [UIColor secondarySystemBackgroundColor];
    card.layer.cornerRadius = 16.0;
    card.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:card];

    UILabel *heading = [[UILabel alloc] init];
    heading.text = @"Dato curioso:";
    heading.font = [UIFont boldSystemFontOfSize:20.0];
    heading.translatesAutoresizingMaskIntoConstraints = NO;
    [card addSubview:heading];

    self.factLabel = [[UILabel alloc] init];
    self.factLabel.font = [UIFont systemFontOfSize:18.0];
    self.factLabel.numberOfLines = 0;
    self.factLabel.textAlignment = NSTextAlignmentCenter;
    self.factLabel.textColor = [UIColor secondaryLabelColor];
    self.factLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [card addSubview:self.factLabel];

    UIButton *nextButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [nextButton setTitle:@"Muéstrame otro dato" forState:UIControlStateNormal];
    nextButton.titleLabel.font = [UIFont boldSystemFontOfSize:18.0];
    [nextButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    nextButton.backgroundColor = [UIColor systemBlueColor];
    nextButton.layer.cornerRadius = 14.0;
    nextButton.translatesAutoresizingMaskIntoConstraints = NO;
    [nextButton addTarget:self action:@selector(showNextFact) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nextButton];

    [NSLayoutConstraint activateConstraints:@[
        [card.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:32],
        [card.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:24],
        [card.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-24],

        [heading.topAnchor constraintEqualToAnchor:card.topAnchor constant:20],
        [heading.centerXAnchor constraintEqualToAnchor:card.centerXAnchor],

        [self.factLabel.topAnchor constraintEqualToAnchor:heading.bottomAnchor constant:16],
        [self.factLabel.leadingAnchor constraintEqualToAnchor:card.leadingAnchor constant:20],
        [self.factLabel.trailingAnchor constraintEqualToAnchor:card.trailingAnchor constant:-20],
        [self.factLabel.bottomAnchor constraintEqualToAnchor:card.bottomAnchor constant:-24],

        [nextButton.topAnchor constraintEqualToAnchor:card.bottomAnchor constant:40],
        [nextButton.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:40],
        [nextButton.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-40],
        [nextButton.heightAnchor constraintEqualToConstant:56]
    ]];

    // Al entrar a la pantalla ya se muestra el primer dato curioso.
    [self showNextFact];
}

/// Avanza al siguiente dato curioso del arreglo, evitando repetir el que
/// se acaba de mostrar. Cada toque del botón despliega información distinta.
- (void)showNextFact {
    if (self.facts.count == 0) {
        self.factLabel.text = @"No hay datos disponibles para esta categoría.";
        return;
    }

    NSInteger newIndex;
    if (self.facts.count == 1) {
        newIndex = 0;
    } else {
        do {
            newIndex = arc4random_uniform((uint32_t)self.facts.count);
        } while (newIndex == self.currentFactIndex);
    }

    self.currentFactIndex = newIndex;
    self.factLabel.text = self.facts[newIndex];
}

@end
