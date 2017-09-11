//
//  ZLPersonWaitVertifyViewController.m
//  AIProduct
//
//  Created by mac on 2017/8/3.
//  Copyright © 2017年 mac. All rights reserved.
//

// 等待验证码
#import "ZLPersonWaitVertifyViewController.h"
#import "ZLPersonwaitVerfiyView.h"
@interface ZLPersonWaitVertifyViewController ()
@property (nonatomic, strong) ZLPersonwaitVerfiyView *personWaitView;
@end

@implementation ZLPersonWaitVertifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    self.personWaitView = [[ZLPersonwaitVerfiyView alloc]initWithFrame:CGRectMake(0, 64, App_Frame_Width, App_Frame_Height - 64)];
    [self.view addSubview:self.personWaitView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

    
}

- (NSMutableAttributedString *)setTitle{
    
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc]initWithString:@"更换手机号"];
    
    [title addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, title.length)];
    
    [title addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:20] range:NSMakeRange(0, title.length)];
    
    return title;
    
}


@end
