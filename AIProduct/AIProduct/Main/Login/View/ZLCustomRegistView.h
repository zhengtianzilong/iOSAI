//
//  ZLCustomRegistView.h
//  AIProduct
//
//  Created by mac on 2017/8/1.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZLAgreeAndAcceptView.h"
#import "WLCaptcheButton.h"
@interface ZLCustomRegistView : UIView

// 验证码点击按钮
@property (nonatomic, strong) WLCaptcheButton *verificationCodeButton;


// 扫描机器人二维码按钮
@property (nonatomic, strong) UIButton *scanAiCodeButton;

// 同意并接受用户协议
@property (nonatomic, strong) ZLAgreeAndAcceptView *agreeAndAccept;

// 下一步
@property (nonatomic, strong) UIButton *stepButton;

// 手机号
@property (nonatomic, strong) UITextField *userPhoneTF;

// 密码
@property (nonatomic, strong) UITextField *userPasswordTF;

// 确认密码
@property (nonatomic, strong) UITextField *conFirmUserPasswordTF;

// 请输入验证码
@property (nonatomic, strong) UITextField *verificationCodeTF;

// 请输入机器人ID
@property (nonatomic, strong) UITextField *aiIdTF;

// 密码正确与否
@property (nonatomic, strong) UIButton *trueOrFalseBtnFirst;
// 确认密码正确与否
@property (nonatomic, strong) UIButton *trueOrFalseBtnSecond;

@end
