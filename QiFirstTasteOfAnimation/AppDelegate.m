//
//  AppDelegate.m
//  QiFirstTasteOfAnimation
//
//  Created by QiShare on 2018/8/22.
//  Copyright © 2018年 QiShare. All rights reserved.
//

#import "AppDelegate.h"
#import "QiAnimationViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[QiAnimationViewController new]];
    _window.backgroundColor = [UIColor whiteColor];
    [_window makeKeyAndVisible];
    
    return YES;
}

@end
