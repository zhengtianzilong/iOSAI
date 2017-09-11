//
//  ZLCustomPhoneVerifyView.m
//  AIProduct
//
//  Created by mac on 2017/8/1.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ZLCustomPhoneVerifyView.h"
@interface ZLCustomPhoneVerifyView ()
@property (nonatomic, strong) UIView *rightView;

@end
@implementation ZLCustomPhoneVerifyView

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
        make.top.equalTo(self).offset(AdaptedHeight(50));
        make.height.mas_equalTo(AdaptedHeight(178));
        make.left.equalTo(self).offset(AdaptedWidth(28));
        make.right.equalTo(self).offset(AdaptedWidth(-28));
        
    }];

    
    // 用户手机号
    self.userPhoneTF = [self customTextFieldOn:textFiedBgView placeholder:@"手机号" placeholderColor:nil textColor:nil keyboardType:UIKeyboardTypeNumberPad];
    [self.userPhoneTF mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(textFiedBgView);
        make.top.equalTo(textFiedBgView).offset(0);
        make.height.mas_equalTo(KUITEXTFIELD_HEIGHT);
        make.left.equalTo(textFiedBgView).offset(AdaptedWidth(35));
        make.right.equalTo(textFiedBgView.mas_right);
        
    }];
    
    UIView *lineView = [[UIView alloc]init];
    
    [textFiedBgView addSubview:lineView];
    lineView.backgroundColor = HEXCOLOR(KStand_bkg_color);
    
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(textFiedBgView).offset(0);
        make.right.equalTo(textFiedBgView.mas_right);
        make.top.equalTo(self.userPhoneTF.mas_bottom).offset(0);
        make.height.mas_equalTo(1);
    }];
    
       // 请输入验证码
    self.verificationCodeTF = [self customTextFieldOn:textFiedBgView placeholder:@"请输入手机接收到的验证码" placeholderColor:nil textColor:nil keyboardType:UIKeyboardTypeDefault];
    [self.verificationCodeTF mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(textFiedBgView);
        make.top.equalTo(lineView.mas_bottom).offset(0);
        make.height.mas_equalTo(self.userPhoneTF);
        make.left.equalTo(self.userPhoneTF.mas_left);
        make.right.equalTo(textFiedBgView.mas_right);
        
    }];
    
    
    _rightView = [[UIView alloc]init];
    _rightView.frame = CGRectMake(0, AdaptedHeight((89-64)), AdaptedWidth(170), AdaptedHeight(64));
    
    
    // 验证码按钮
    self.verificationCodeButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    self.verificationCodeButton.backgroundColor = HEXCOLOR(KVerificationCode);
    self.verificationCodeButton.frame = CGRectMake(0, 0, AdaptedWidth(170-12), AdaptedHeight(64));
    self.verificationCodeButton.layer.cornerRadius = 3.0;
    self.verificationCodeButton.clipsToBounds = YES;
    [self.verificationCodeButton setTitle:@"获取验证码" forState:(UIControlStateNormal)];
    [self.verificationCodeButton setTitleColor:HEXCOLOR(0xfbfcfc) forState:(UIControlStateNormal)];
    self.verificationCodeButton.titleLabel.font = [UIFont systemFontOfSize:14];

    [_rightView addSubview:self.verificationCodeButton];
    
    
    // 下一步
    self.stepButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.stepButton setBackgroundImage:[UIImage imageWithColor:HEXCOLOR(KNormal_button_unpressed)] forState:(UIControlStateNormal)];
    self.stepButton.layer.cornerRadius = 5;
    self.stepButton.clipsToBounds = YES;
    self.stepButton.enabled = NO;
    [self.stepButton setBackgroundImage:[UIImage imageWithColor:HEXCOLOR(KNormal_button_pressed)] forState:(UIControlStateSelected)];
    [self.stepButton setTitle:@"下一步" forState:(UIControlStateNormal)];
    self.stepButton.adjustsImageWhenHighlighted = NO;
    [self addSubview:self.stepButton];

    
    [self.stepButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self);
        make.top.equalTo(self.verificationCodeTF.mas_bottom).offset(AdaptedHeight(92));
        make.height.equalTo(KStepButtonORSureButton_HEIGHT);
        make.width.equalTo(textFiedBgView);
        
    }];
    
    
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

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.verificationCodeTF.rightView = _rightView;
    self.verificationCodeTF.rightViewMode = UITextFieldViewModeAlways;
    
}


@end
