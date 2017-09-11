//
//  ZLCustomPhoneVerifyView.h
//  AIProduct
//
//  Created by mac on 2017/8/1.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZLCustomPhoneVerifyView : UIView
// 验证码点击按钮
@property (nonatomic, strong) UIButton *verificationCodeButton;
// 下一步
@property (nonatomic, strong) UIButton *stepButton;

// 手机号
@property (nonatomic, strong) UITextField *userPhoneTF;


// 请输入验证码
@property (nonatomic, strong) UITextField *verificationCodeTF;
@end
