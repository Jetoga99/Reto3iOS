//
//  CategoryViewController.m
//  SabiasQue
//

#import "CategoryViewController.h"
#import "FactViewController.h"
#import "DataStore.h"

@interface CategoryViewController ()
@property (nonatomic, strong) NSArray<NSString *> *categories;
@end

@implementation CategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"¿Sabías qué?";
    self.view.backgroundColor = [UIColor systemBackgroundColor];
    self.categories = [DataStore categoryNames];

    UILabel *subtitle = [[UILabel alloc] init];
    subtitle.text = @"Elige una categoría";
    subtitle.font = [UIFont systemFontOfSize:17.0];
    subtitle.textColor = [UIColor secondaryLabelColor];
    subtitle.textAlignment = NSTextAlignmentCenter;
    subtitle.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:subtitle];

    [NSLayoutConstraint activateConstraints:@[
        [subtitle.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:24],
        [subtitle.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor]
    ]];

    UIView *previousAnchorView = subtitle;
    CGFloat topSpacing = 24;

    for (NSInteger i = 0; i < self.categories.count; i++) {
        NSString *categoryName = self.categories[i];

        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        [button setTitle:categoryName forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont boldSystemFontOfSize:20.0];
        button.backgroundColor = [UIColor secondarySystemBackgroundColor];
        button.layer.cornerRadius = 14.0;
        button.tag = i;
        button.translatesAutoresizingMaskIntoConstraints = NO;
        [button addTarget:self action:@selector(categoryTapped:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];

        [NSLayoutConstraint activateConstraints:@[
            [button.topAnchor constraintEqualToAnchor:previousAnchorView.bottomAnchor constant:topSpacing],
            [button.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:32],
            [button.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-32],
            [button.heightAnchor constraintEqualToConstant:64]
        ]];

        previousAnchorView = button;
        topSpacing = 20;
    }
}

- (void)categoryTapped:(UIButton *)sender {
    NSString *selectedCategory = self.categories[sender.tag];

    FactViewController *factVC = [[FactViewController alloc] initWithCategory:selectedCategory];
    [self.navigationController pushViewController:factVC animated:YES];
}

@end
