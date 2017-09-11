//
//  AppDelegate.m
//  AIProduct
//
//  Created by mac on 2017/8/1.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "AppDelegate.h"
#import "ZLLoginViewController.h"
#import "ZLBaseNavViewController.h"
#import <FLEX.h>
#import "ZLMainTabBarControllerConfig.h"
@interface AppDelegate ()<UITabBarControllerDelegate, CYLTabBarControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self configureBoardManager];
    
    [self setupLoginViewController];
    
    [self customizeTabbarItem];
    
    [[FLEXManager sharedManager] showExplorer];

    
    
    
    return YES;
}


/**
 自定义tabbaritem的样式
 */
- (void)customizeTabbarItem{
    
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = HEXCOLOR(0x11ccf9);
    
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = HEXCOLOR(0xa5a5a5);

    UITabBarItem *tabBarItem = [UITabBarItem appearance];
    
    UITabBar *tabBar = [UITabBar appearance];
    
    [tabBar setBarTintColor:[UIColor whiteColor]];
    tabBar.translucent = NO;
    
    [tabBar setShadowImage:[self imageWithColor:HEXCOLORAndAlpha(0x11ccf9, 0.2) size:CGSizeMake(Main_Screen_Width,0.5)]];
    [tabBar setBackgroundImage:[[UIImage alloc]init]];
    
    [tabBarItem setTitleTextAttributes:selectedAttrs forState:(UIControlStateSelected)];
    
    
    [tabBarItem setTitleTextAttributes:normalAttrs forState:(UIControlStateNormal)];
}

- (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
        if (!color || size.width <=0 || size.height <=0) return nil;
        CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
        UIGraphicsBeginImageContextWithOptions(rect.size,NO, 0);
        CGContextRef context =UIGraphicsGetCurrentContext();
        CGContextSetFillColorWithColor(context, color.CGColor);
        CGContextFillRect(context, rect);
        UIImage *image =UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return image;
}

#pragma mark 键盘收回管理
-(void)configureBoardManager
{
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    manager.enable = YES;
    manager.shouldResignOnTouchOutside = YES;
    manager.shouldToolbarUsesTextFieldTintColor = YES;
    manager.keyboardDistanceFromTextField=60;
    manager.enableAutoToolbar = NO;
}

#pragma mark 自定义跳转不同的页面
//登录页面
-(void)setupLoginViewController
{
    ZLLoginViewController *logInVc = [[ZLLoginViewController alloc]init];
    
    ZLBaseNavViewController *loginNav = [[ZLBaseNavViewController alloc]initWithRootViewController:logInVc];
    
    ZLMainTabBarControllerConfig *tabBarVCConfig = [[ZLMainTabBarControllerConfig alloc]init];
    
    CYLTabBarController *tabBarVC = tabBarVCConfig.tabBarController;
    tabBarVC.delegate = self;
    self.window.rootViewController = tabBarVC;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
}


#pragma mark - TabBardelegate
// 点击TabBar的代理
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    
    NSLog(@"你点击了%lu",(unsigned long)tabBarController.selectedIndex);
    
}




- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
