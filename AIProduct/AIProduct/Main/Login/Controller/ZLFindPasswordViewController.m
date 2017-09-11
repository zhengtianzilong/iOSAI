//
//  ZLFindPasswordViewController.m
//  AIProduct
//
//  Created by mac on 2017/8/1.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ZLFindPasswordViewController.h"
#import "ZLPagerView.h"
#import "ZLPhoneVerifyViewController.h"
#import "ZLPeopleFaceViewController.h"
@interface ZLFindPasswordViewController ()

@end

@implementation ZLFindPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    ZLPhoneVerifyViewController *phoneVC = [[ZLPhoneVerifyViewController alloc]init];
    UINavigationController *phoneNav = [[UINavigationController alloc]initWithRootViewController:phoneVC];
    
    ZLPeopleFaceViewController *faceVC = [[ZLPeopleFaceViewController alloc]init];
    UINavigationController *faceNav = [[UINavigationController alloc]initWithRootViewController:faceVC];
    
//    @property (strong, nonatomic) UIColor *selectColor; /**<  选中时的颜色   **/
//    @property (strong, nonatomic) UIColor *unselectColor; /**<  未选中时的颜色   **/
//    @property (strong, nonatomic) UIColor *underlineColor; /**<  下划线的颜色   **/
//    @property (strong, nonatomic) UIColor *topTabColor; /**<  顶部菜单栏的背景颜色   **/
    
    NSArray *titleArr=@[@"手机验证",@"人脸识别验证"];
    NSArray *colorArr=@[HEXCOLOR(KNavBarBG_color_blue),HEXCOLOR(0xaeb8ba),HEXCOLOR(KNavBarBG_color_blue)];

    
    ZLPagerView *pageView = [[ZLPagerView alloc]initWithPagerStyle:0 WithTitles:titleArr WithVCs:@[phoneVC,faceVC] WithColorArrays:colorArr];
    pageView.backgroundColor = HEXCOLOR(KStand_bkg_color);
    pageView.pushEnabled = YES;
    [self.view addSubview:pageView];
    
    
}


- (NSMutableAttributedString *)setTitle{
    
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc]initWithString:@"找回密码"];
    
    [title addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, title.length)];
    
    [title addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:18] range:NSMakeRange(0, title.length)];
    
    return title;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
