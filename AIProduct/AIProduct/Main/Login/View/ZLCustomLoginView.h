//
//  ZLCustomLoginView.h
//  AIProduct
//
//  Created by mac on 2017/8/1.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZLCustomLoginView : UIView


// 明文密文切换按钮
@property (nonatomic, strong) UIButton *eyeButton;

// 忘记密码按钮
@property (nonatomic, strong) UIButton *forgetpasswordButton;

// 登录按钮
@property (nonatomic, strong) UIButton *loginButton;

// 没有账号 去注册
@property (nonatomic, strong) UIButton *gotoRegistButton;

// 手机号
@property (nonatomic, strong) UITextField *userPhoneTF;

// 密码
@property (nonatomic, strong) UITextField *userPasswordTF;
@end
