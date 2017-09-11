//
//  ZLPhoneVerifyViewController.m
//  AIProduct
//
//  Created by mac on 2017/8/1.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ZLPhoneVerifyViewController.h"
#import "ZLCustomPhoneVerifyView.h"
#import "ZLChangePasswordViewController.h"
#import "UIView+ViewController.h"
#import "ZLBaseNavViewController.h"
@interface ZLPhoneVerifyViewController ()
@property (nonatomic, strong) ZLCustomPhoneVerifyView *customPhoneV;
@end

@implementation ZLPhoneVerifyViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    //移除通知中心
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = HEXCOLOR(KStand_bkg_color);
    self.customPhoneV = [[ZLCustomPhoneVerifyView alloc]init];
    [self.view addSubview:self.customPhoneV];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(phoneVerifyChangeTextField:) name:UITextFieldTextDidChangeNotification object:nil];
    [self.customPhoneV mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(self.view);
        make.width.mas_equalTo(App_Frame_Width);
        make.top.equalTo(self.view);
        make.bottom.equalTo(self.view.mas_bottom);
        
    }];
    
    
    [self.customPhoneV.stepButton addTarget:self action:@selector(stepButtonEvent) forControlEvents:(UIControlEventTouchUpInside)];
    
    
    
}

// 点击下一步
- (void)stepButtonEvent{
    
    NSLog(@"%@",[UIApplication sharedApplication].keyWindow.currentViewController.navigationController);
    
    NSLog(@"%@",[self class]);
    ZLChangePasswordViewController *changePassVC = [[ZLChangePasswordViewController alloc]init];
    
    
    
    [[UIApplication sharedApplication].keyWindow.currentViewController.navigationController pushViewController:changePassVC animated:YES];
    
}



/**
 通知调用的文本框值变化的方法
 */
- (void)phoneVerifyChangeTextField:(NSNotification *)notification{
    
    if (self.customPhoneV.userPhoneTF.text.length >= 11 && self.customPhoneV.verificationCodeTF.text.length >= 3 ) {
        
        self.customPhoneV.stepButton.enabled = YES;
        
        self.customPhoneV.stepButton.selected = YES;
        
    }else{
        self.customPhoneV.stepButton.enabled = NO;
        
        self.customPhoneV.stepButton.selected = NO;
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
