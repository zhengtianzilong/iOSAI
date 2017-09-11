//
//  ZLPersonInfoViewController.m
//  AIProduct
//
//  Created by mac on 2017/8/10.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ZLPersonInfoViewController.h"
#import "ZLPersonAccountInfoView.h"
@interface ZLPersonInfoViewController ()

@end

@implementation ZLPersonInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ZLPersonAccountInfoView *infoView = [[ZLPersonAccountInfoView alloc]initWithFrame:CGRectMake(0, 64, App_Frame_Width, App_Frame_Height - 64)];
    [self.view addSubview:infoView];
    
    
    
}




- (UIButton *)set_rightButton{
    
    UIButton *rightButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    
    rightButton.frame = CGRectMake(0, 0, 40, 40);
    
    [rightButton setTitle:@"完成" forState:(UIControlStateNormal)];
    
    return rightButton;
    
}


- (NSMutableAttributedString *)setTitle{
    
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc]initWithString:@"个人资料"];
    
    [title addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, title.length)];
    
    [title addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:20] range:NSMakeRange(0, title.length)];
    
    return title;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
