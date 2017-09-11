//
//  ZLBaseCustomNavViewController.m
//  AIProduct
//
//  Created by mac on 2017/8/9.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ZLBaseCustomNavViewController.h"

@interface ZLBaseCustomNavViewController ()

@end

@implementation ZLBaseCustomNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}



- (UIColor *)set_colorBackground{
    return HEXCOLOR(KNavBarBG_color_blue);
}

- (UIButton *)set_leftButton{
    
    UIImage* backItemImage = [[UIImage imageNamed:@"login_nav_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    UIImage* backItemHlImage = [[UIImage imageNamed:@"login_nav_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIButton* backButton = [[UIButton alloc] init];
    [backButton setImage:backItemImage forState:UIControlStateNormal];
//    [backButton setImage:backItemHlImage forState:UIControlStateHighlighted];
    [backButton sizeToFit];
    return backButton;
}

- (void)left_button_event:(UIButton *)sender{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

@end
