//
//  ZLCustomRegistView.m
//  AIProduct
//
//  Created by mac on 2017/8/1.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ZLCustomRegistView.h"
#import "WLCaptcheButton.h"
@interface ZLCustomRegistView ()
@property (nonatomic, strong) UIView *rightView;
@end
@implementation ZLCustomRegistView
- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    
    }
    return self;
    
}

// 设置UI界面
- (void)setupUI{
    
    UIView *textFiedBgView = [[UIView alloc]init];
    
    [self addSubview:textFiedBgView];
    textFiedBgView.layer.shadowColor = HEXCOLOR(KShadow_color_blue).CGColor;
    textFiedBgView.layer.shadowOffset = CGSizeMake(0, 3);
    textFiedBgView.layer.shadowOpacity = 0.17;
    textFiedBgView.layer.cornerRadius = 5;
    textFiedBgView.layer.masksToBounds = false;
    textFiedBgView.backgroundColor = [UIColor whiteColor];
    
    [textFiedBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self);
        make.top.equalTo(self).offset(AdaptedHeight(28));
        make.left.equalTo(self).offset(AdaptedWidth(28));
        make.right.equalTo(self.mas_right).offset(AdaptedWidth(-28));
        make.height.mas_equalTo(AdaptedHeight(445));
//        make.width.mas_equalTo(694/2);
        
    }];
    
    
    // 用户手机号
    self.userPhoneTF = [self customTextFieldOn:textFiedBgView placeholder:@"请输入手机号" placeholderColor:nil textColor:nil keyboardType:UIKeyboardTypeNumberPad];
    [self.userPhoneTF mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(textFiedBgView);
        make.top.equalTo(textFiedBgView).offset(0);
        make.height.mas_equalTo(KUITEXTFIELD_HEIGHT);
        make.left.equalTo(textFiedBgView).offset(AdaptedWidth(30));
        make.right.equalTo(textFiedBgView.mas_right);
        
    }];
    
    UIView *lineView0 = [[UIView alloc]init];
    
    [textFiedBgView addSubview:lineView0];
    lineView0.backgroundColor = HEXCOLOR(KStand_bkg_color);
    
    [lineView0 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(textFiedBgView).offset(0);
        make.right.equalTo(textFiedBgView.mas_right);
        make.top.equalTo(self.userPhoneTF.mas_bottom).offset(0);
        make.height.mas_equalTo(1);
    }];
    
    
    // 判断密码正确与否的图片显示
    self.trueOrFalseBtnFirst = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.trueOrFalseBtnFirst setImage:[UIImage imageNamed:@"login_true"] forState:(UIControlStateSelected)];
    [self.trueOrFalseBtnFirst setImage:[UIImage imageNamed:@"login_fault"] forState:(UIControlStateNormal)];
    self.trueOrFalseBtnFirst.hidden = YES;
    self.trueOrFalseBtnFirst.frame = CGRectMake(0, 0, AdaptedWidth(100), AdaptedHeight(100));
    
    // 用户密码
    self.userPasswordTF = [self customTextFieldOn:textFiedBgView placeholder:@"请输入8至16位密码, 包含数字与英文" placeholderColor:nil textColor:nil keyboardType:UIKeyboardTypeDefault];
    [self.userPasswordTF mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(textFiedBgView);
        make.top.equalTo(lineView0.mas_bottom).offset(0);
        make.height.mas_equalTo(self.userPhoneTF);
        make.left.equalTo(self.userPhoneTF.mas_left);
        make.right.equalTo(textFiedBgView.mas_right);
        
    }];
 
    UIView *lineView1 = [[UIView alloc]init];
    
    [textFiedBgView addSubview:lineView1];
    lineView1.backgroundColor = HEXCOLOR(KStand_bkg_color);
    
    [lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(textFiedBgView).offset(0);
        make.right.equalTo(textFiedBgView.mas_right);
        make.top.equalTo(self.userPasswordTF.mas_bottom).offset(0);
        make.height.mas_equalTo(1);
    }];
 
    
    // 判断确认密码的正确与否显示
    self.trueOrFalseBtnSecond = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.trueOrFalseBtnSecond setImage:[UIImage imageNamed:@"login_true"] forState:(UIControlStateSelected)];
    
    [self.trueOrFalseBtnSecond setImage:[UIImage imageNamed:@"login_fault"] forState:(UIControlStateNormal)];
    self.trueOrFalseBtnSecond.hidden = YES;
    
    self.trueOrFalseBtnSecond.frame = CGRectMake(0, 0, AdaptedWidth(100), AdaptedHeight(100));
    // 确认密码
    self.conFirmUserPasswordTF = [self customTextFieldOn:textFiedBgView placeholder:@"确认密码" placeholderColor:nil textColor:nil keyboardType:UIKeyboardTypeDefault];
    [self.conFirmUserPasswordTF mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(textFiedBgView);
        make.top.equalTo(lineView1.mas_bottom).offset(0);
        make.height.mas_equalTo(self.userPhoneTF);
        make.left.equalTo(self.userPhoneTF.mas_left);
        make.right.equalTo(textFiedBgView.mas_right);
        
    }];
    
    UIView *lineView2 = [[UIView alloc]init];
    
    [textFiedBgView addSubview:lineView2];
    lineView2.backgroundColor = HEXCOLOR(KStand_bkg_color);
    
    [lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(textFiedBgView).offset(0);
        make.right.equalTo(textFiedBgView.mas_right);
        make.top.equalTo(self.conFirmUserPasswordTF.mas_bottom).offset(0);
        make.height.mas_equalTo(1);
    }];
    
    // 请输入验证码
    self.verificationCodeTF = [self customTextFieldOn:textFiedBgView placeholder:@"请输入手机收到的验证码" placeholderColor:nil textColor:nil keyboardType:UIKeyboardTypeDefault];
    [self.verificationCodeTF mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(textFiedBgView);
        make.top.equalTo(lineView2.mas_bottom).offset(0);
        make.height.mas_equalTo(self.userPhoneTF);
        make.left.equalTo(self.userPhoneTF.mas_left);
        make.right.equalTo(textFiedBgView.mas_right);
        
    }];
    
    _rightView = [[UIView alloc]initWithFrame:CGRectMake(0, AdaptedHeight(25), AdaptedWidth(167), AdaptedHeight(64))];
    
    // 验证码按钮
    self.verificationCodeButton = [[WLCaptcheButton alloc]init];
    self.verificationCodeButton.backgroundColor = HEXCOLOR(KVerificationCode);
    self.verificationCodeButton.frame = CGRectMake(0, 0, AdaptedWidth(167 - 12), AdaptedHeight(64));
    self.verificationCodeButton.layer.cornerRadius = 3.0;
    self.verificationCodeButton.clipsToBounds = YES;
    [self.verificationCodeButton setTitle:@"获取验证码" forState:(UIControlStateNormal)];
    [self.verificationCodeButton setTitleColor:HEXCOLOR(0xfbfcfc) forState:(UIControlStateNormal)];
    self.verificationCodeButton.titleLabel.font = [UIFont systemFontOfSize:14];

    [_rightView addSubview:self.verificationCodeButton];
    
    UIView *lineView3 = [[UIView alloc]init];
    
    [textFiedBgView addSubview:lineView3];
    lineView3.backgroundColor = HEXCOLOR(KStand_bkg_color);
    
    [lineView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(textFiedBgView).offset(0);
        make.right.equalTo(textFiedBgView.mas_right);
        make.top.equalTo(self.verificationCodeTF.mas_bottom).offset(0);
        make.height.mas_equalTo(1);
    }];
    
    // 请输入机器人ID
    self.aiIdTF = [self customTextFieldOn:textFiedBgView placeholder:@"绑定小智机器人id" placeholderColor:nil textColor:nil keyboardType:UIKeyboardTypeDefault];
    [self.aiIdTF mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(textFiedBgView);
        make.top.equalTo(lineView3.mas_bottom).offset(0);
        make.height.mas_equalTo(self.userPhoneTF);
        make.left.equalTo(self.userPhoneTF.mas_left);
        make.right.equalTo(textFiedBgView.mas_right);
        
    }];
    // 二维码按钮
    self.scanAiCodeButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    self.scanAiCodeButton.frame = CGRectMake(0, 0, 40, 89/2);
    [self.scanAiCodeButton setImage:[UIImage imageNamed:@"login_id"] forState:(UIControlStateNormal)];

    // 同意并接受用户协议
    self.agreeAndAccept = [[ZLAgreeAndAcceptView alloc]init];
    [self addSubview:self.agreeAndAccept];
    [self.agreeAndAccept mas_makeConstraints:^(MASConstraintMaker *make) {
     
        make.left.equalTo(textFiedBgView.mas_left).offset(AdaptedWidth(10));
        make.right.equalTo(self.aiIdTF.mas_right);
        make.top.equalTo(self.aiIdTF.mas_bottom).offset(AdaptedHeight(62));
        make.height.mas_equalTo(AdaptedHeight(26));
        
    }];
    
    // 下一步
    self.stepButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.stepButton setBackgroundImage:[UIImage imageWithColor:HEXCOLOR(KNormal_button_unpressed)] forState:(UIControlStateNormal)];
    self.stepButton.layer.cornerRadius = 3;
    self.stepButton.clipsToBounds = YES;
    self.stepButton.enabled = NO;
    self.stepButton.adjustsImageWhenHighlighted = NO;
    [self.stepButton setBackgroundImage:[UIImage imageWithColor:HEXCOLOR(KNormal_button_pressed)] forState:(UIControlStateSelected)];
    [self.stepButton setTitle:@"下一步" forState:(UIControlStateNormal)];
    self.stepButton.titleLabel.font = [UIFont systemFontOfSize:18];
    [self addSubview:self.stepButton];
    
    [self.stepButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self);
        make.top.equalTo(self.agreeAndAccept.mas_bottom).offset(AdaptedHeight(62));
        make.height.equalTo(KStepButtonORSureButton_HEIGHT);
        make.width.equalTo(textFiedBgView);
        
    }];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.aiIdTF.rightView = self.scanAiCodeButton;
    self.aiIdTF.rightViewMode = UITextFieldViewModeAlways;
    
    self.userPasswordTF.rightViewMode = UITextFieldViewModeAlways;
    self.userPasswordTF.rightView = self.trueOrFalseBtnFirst;
    
    self.conFirmUserPasswordTF.rightViewMode = UITextFieldViewModeAlways;
    self.conFirmUserPasswordTF.rightView = self.trueOrFalseBtnSecond;
    
    self.verificationCodeTF.rightView = _rightView;
    self.verificationCodeTF.rightViewMode = UITextFieldViewModeAlways;
}

// 创建textField的可配置方式
- (UITextField *)customTextFieldOn:(UIView *)bgview placeholder:(NSString *)placeholder placeholderColor:(UIColor *)placeholderColor textColor:(UIColor *)textColor keyboardType:(UIKeyboardType)keyboardType {
    
    UITextField *textField = [[UITextField alloc]init];
    
    [bgview addSubview:textField];
    textField.borderStyle = UITextBorderStyleNone;
    textField.placeholder = placeholder;
    [textField setTextColor:textColor?textColor :HEXCOLOR(KText_color_blue)];
    [textField setValue:placeholderColor?placeholderColor:HEXCOLOR(KEdittext_hint_text_color) forKeyPath:@"_placeholderLabel.textColor"];
    textField.keyboardType = keyboardType;
    return textField;
    
}

@end
