//
//  AppDelegate.m
//  SabiasQue
//
//  Reto 3 - Diseño y desarrollo de aplicación iOS
//

#import "AppDelegate.h"
#import "CategoryViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    CategoryViewController *rootVC = [[CategoryViewController alloc] init];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:rootVC];

    self.window.rootViewController = navController;
    [self.window makeKeyAndVisible];

    return YES;
}

@end
