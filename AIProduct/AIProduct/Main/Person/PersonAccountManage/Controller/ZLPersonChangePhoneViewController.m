//
//  ZLPersonChangePhoneViewController.m
//  AIProduct
//
//  Created by mac on 2017/8/3.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ZLPersonChangePhoneViewController.h"
#import "ZLPersonChangePhoneView.h"
#import "ZLPersonWaitVertifyViewController.h"
@interface ZLPersonChangePhoneViewController ()

@property (nonatomic, strong) ZLPersonChangePhoneView *changePhoneView;

@end

@implementation ZLPersonChangePhoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    self.changePhoneView = [[ZLPersonChangePhoneView alloc]initWithFrame:CGRectMake(0, 64, App_Frame_Width, App_Frame_Height - 64)];
    [self.view addSubview:self.changePhoneView];
    
    [self.changePhoneView.stepButton addTarget:self action:@selector(stepButtonEvent) forControlEvents:(UIControlEventTouchUpInside)];

}

- (void)stepButtonEvent{

    ZLPersonWaitVertifyViewController *waitVC = [[ZLPersonWaitVertifyViewController alloc]init];
    
    [self.navigationController pushViewController:waitVC animated:YES];
    
}


- (NSMutableAttributedString *)setTitle{
    
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc]initWithString:@"更换手机号"];
    
    [title addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, title.length)];
    
    [title addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:20] range:NSMakeRange(0, title.length)];
    
    return title;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
