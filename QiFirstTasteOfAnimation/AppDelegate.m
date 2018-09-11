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
    
    [self manualAddAutoreleasePooTest];
    
    return YES;
}


/**
 @brief 手动添加autoreleasepool测试
 */
- (void)manualAddAutoreleasePooTest {
    
    __weak NSObject *weakObj;
    NSObject *obj1 = [NSObject new];
    weakObj = obj1;
    NSLog(@"%@--%@", obj1, weakObj);
    obj1 = nil;
    NSLog(@"%@--%@", obj1, weakObj);
    
    @autoreleasepool{
        NSObject *obj2 = [NSObject new];
        weakObj = obj2;
        NSLog(@"%@--%@", obj2, weakObj);
    }
    NSLog(@"%@", weakObj);
}

/**
 Xcode9.4.1 在iPhoneX模拟器及真机12.0(16A5366a)都是这个结果
 manualAddAutoreleasePooTest输出结果：
 2018-09-11 22:20:07.323334+0800 QiFirstTasteOfAnimation[2285:483390] <NSObject: 0x28388b130>--<NSObject: 0x28388b130>
 2018-09-11 22:20:07.323421+0800 QiFirstTasteOfAnimation[2285:483390] (null)--(null)
 2018-09-11 22:20:07.323471+0800 QiFirstTasteOfAnimation[2285:483390] <NSObject: 0x28388b130>--<NSObject: 0x28388b130>
 2018-09-11 22:20:07.323488+0800 QiFirstTasteOfAnimation[2285:483390] (null)
 */

@end
