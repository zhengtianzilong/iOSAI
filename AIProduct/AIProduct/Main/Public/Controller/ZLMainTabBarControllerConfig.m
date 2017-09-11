//
//  ZLMainTabBarControllerConfig.m
//  AIProduct
//
//  Created by mac on 2017/8/2.
//  Copyright © 2017年 mac. All rights reserved.
//


#import "ZLMainTabBarControllerConfig.h"
#import "ZLBaseNavViewController.h"
//@interface CYLBaseNavigationController : UINavigationController
//@end
//
//@implementation CYLBaseNavigationController
//
//- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
//    
//    if (self.viewControllers.count > 0) {
//        viewController.hidesBottomBarWhenPushed = YES;
//    }
//    [super pushViewController:viewController animated:animated];
//}
//
//@end

#import "ZLHomeViewController.h"
#import "ZLChartViewController.h"
#import "ZLVideoViewController.h"
#import "ZLPersonViewController.h"

@interface ZLMainTabBarControllerConfig ()

@property (nonatomic, strong,readwrite)CYLTabBarController *tabBarController;

@end

@implementation ZLMainTabBarControllerConfig

- (CYLTabBarController *)tabBarController{
    
    if (_tabBarController == nil) {
        
        CYLTabBarController *tabBarController = [CYLTabBarController tabBarControllerWithViewControllers:self.viewControllers tabBarItemsAttributes:self.tabBarItemsAttributesForController];
        

        _tabBarController = tabBarController;
        
               
        _tabBarController.delegate = self;
    }
    return _tabBarController;
}

- (NSArray *)viewControllers{
    ZLHomeViewController *firstViewController = [[ZLHomeViewController alloc] init];
    UIViewController *firstNavigationController = [[ZLBaseNavViewController alloc]
                                                   initWithRootViewController:firstViewController];
    
    ZLChartViewController *secondViewController = [[ZLChartViewController alloc] init];
    UIViewController *secondNavigationController = [[ZLBaseNavViewController alloc]
                                                    initWithRootViewController:secondViewController];
    
    
    ZLVideoViewController *thirdViewController = [[ZLVideoViewController alloc] init];
    UIViewController *thirdNavigationController = [[ZLBaseNavViewController alloc]
                                                   initWithRootViewController:thirdViewController];
    
    ZLPersonViewController *forthViewController = [[ZLPersonViewController alloc] init];
    UIViewController *forthNavigationController = [[ZLBaseNavViewController alloc]
                                                   initWithRootViewController:forthViewController];
    
    NSArray *viewControllers = @[firstNavigationController,
                                 secondNavigationController,
                                 thirdNavigationController,
                                 forthNavigationController];
    
    return viewControllers;
    
}

- (NSArray *)tabBarItemsAttributesForController{
    
    NSDictionary *firstTabBarItemsAttributes = @{
                                                 CYLTabBarItemTitle : @"首页",
                                                 CYLTabBarItemImage : @"icon_main", 
                                                 CYLTabBarItemSelectedImage : @"icon_main_hover",
                                                 };
    NSDictionary *secondTabBarItemsAttributes = @{
                                                  CYLTabBarItemTitle : @"聊天",
                                                  CYLTabBarItemImage : @"icon_chat",
                                                  CYLTabBarItemSelectedImage : @"icon_chat_hover",
                                                  };
    NSDictionary *thirdTabBarItemsAttributes = @{
                                                 CYLTabBarItemTitle : @"视频",
                                                 CYLTabBarItemImage : @"icon_viedeo",
                                                 CYLTabBarItemSelectedImage : @"icon_viedeo_hover",
                                                 };
    NSDictionary *fourthTabBarItemsAttributes = @{
                                                  CYLTabBarItemTitle : @"个人",
                                                  CYLTabBarItemImage : @"icon_mine",
                                                  CYLTabBarItemSelectedImage : @"icon_mine_hover"
                                                  };
    NSArray *tabBarItemsAttributes = @[
                                       firstTabBarItemsAttributes,
                                       secondTabBarItemsAttributes,
                                       thirdTabBarItemsAttributes,
                                       fourthTabBarItemsAttributes
                                       ];
    return tabBarItemsAttributes;


}


@end
