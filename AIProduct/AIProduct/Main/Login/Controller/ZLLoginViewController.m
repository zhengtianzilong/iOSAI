//
//  ZLLoginViewController.m
//  AIProduct
//
//  Created by mac on 2017/8/1.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ZLLoginViewController.h"
#import "ZLCustomLoginView.h"
#import "ZLRegisterViewController.h"
#import "ZLFindPasswordViewController.h"
#import "ZLMainTabBarControllerConfig.h"
@interface ZLLoginViewController ()<UITextFieldDelegate>

@property (nonatomic, strong) ZLCustomLoginView *loginV;

@end

@implementation ZLLoginViewController

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    
//    [[NSNotificationCenter defaultCenter]removeObserver:self name:UITextFieldTextDidChangeNotification object:nil];
    
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:animated];
//    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(loginChangeTextField:) name:UITextFieldTextDidChangeNotification object:nil];
}


- (void)viewDidLoad {
    [super viewDidLoad];

    self.loginV = [[ZLCustomLoginView alloc]initWithFrame:self.view.bounds];
    
    [self.loginV.eyeButton addTarget:self action:@selector(showAndHidePassword:) forControlEvents:(UIControlEventTouchUpInside)];
    self.loginV.userPasswordTF.delegate = self;
    [self.view addSubview:self.loginV];
    
    [self.loginV.gotoRegistButton addTarget:self action:@selector(gotoRegistEvent) forControlEvents:(UIControlEventTouchUpInside)];
    
    [self.loginV.forgetpasswordButton addTarget:self action:@selector(forgetpasswordEvent) forControlEvents:(UIControlEventTouchUpInside)];
    
    [self.loginV.loginButton addTarget:self action:@selector(loginEvent) forControlEvents:(UIControlEventTouchUpInside)];
}


// 密码明文密文切换
-(void)showAndHidePassword:(UIButton *)sender{
    
    //避免明文/密文切换后光标位置偏移
    self.loginV.userPasswordTF.enabled = NO;    // the first one;
    self.loginV.userPasswordTF.secureTextEntry = sender.selected;
    sender.selected = !sender.selected;
    self.loginV.userPasswordTF.enabled = YES;  // the second one;
    [self.loginV.userPasswordTF becomeFirstResponder]; // the third one
}

/**
 去注册
 */
- (void)gotoRegistEvent{
    
    ZLRegisterViewController *registVC = [[ZLRegisterViewController alloc]init];
    [self.navigationController pushViewController:registVC animated:YES];
    
}

/**
 忘记密码
 */
- (void)forgetpasswordEvent{
    
    NSLog(@"%@",self.navigationController);
    
    ZLFindPasswordViewController *findVC = [[ZLFindPasswordViewController alloc]init];
    [self.navigationController pushViewController:findVC animated:YES];
    
}
/**
 登录
 */
- (void)loginEvent{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
//    ZLMainTabBarControllerConfig *tabBarVCConfig = [[ZLMainTabBarControllerConfig alloc]init];
//
//    CYLTabBarController *tabBarVC = tabBarVCConfig.tabBarController;
////    tabBarVC.delegate = self;
//    
//    UIApplication.sharedApplication.keyWindow.rootViewController = tabBarVC;
//    
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    [self loginChangeTextField:nil];
    //明文切换密文后避免被清空
    NSString *toBeString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    if (textField == self.loginV.userPasswordTF && textField.isSecureTextEntry) {
        textField.text = toBeString;
        return NO;
    }
    
    return YES;
}

/**
 通知调用的文本框值变化的方法
 */
- (void)loginChangeTextField:(NSNotification *)notification{
    
    if (self.loginV.userPhoneTF.text.length == 11 && self.loginV.userPasswordTF.text.length>=8) {
        
        self.loginV.loginButton.enabled = YES;
        
        self.loginV.loginButton.selected = YES;
        
    }else{
         self.loginV.loginButton.enabled = NO;
        
         self.loginV.loginButton.selected = NO;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
    
    
}



@end
