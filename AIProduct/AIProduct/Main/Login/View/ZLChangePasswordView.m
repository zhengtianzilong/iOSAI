//
//  ZLChangePasswordView.m
//  AIProduct
//
//  Created by mac on 2017/8/1.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ZLChangePasswordView.h"

@interface ZLChangePasswordView ()

@end
@implementation ZLChangePasswordView

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
    
    // 判断确认密码的正确与否显示
    self.trueOrFalseBtnFirst = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.trueOrFalseBtnFirst setImage:[UIImage imageNamed:@"login_true"] forState:(UIControlStateSelected)];
    
    [self.trueOrFalseBtnFirst setImage:[UIImage imageNamed:@"login_fault"] forState:(UIControlStateNormal)];
    self.trueOrFalseBtnFirst.hidden = YES;
    
    self.trueOrFalseBtnFirst.frame = CGRectMake(0, 0, AdaptedWidth(100), AdaptedHeight(100));
    
    // 新密码
    self.newpasswordTF = [self customTextFieldOn:textFiedBgView placeholder:@"新密码8-16位,包含数字和英文" placeholderColor:nil textColor:nil keyboardType:UIKeyboardTypeDefault];
    [self.newpasswordTF mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(textFiedBgView);
        make.top.equalTo(textFiedBgView).offset(0);
        make.height.mas_equalTo(KUITEXTFIELD_HEIGHT);
        make.left.equalTo(textFiedBgView).offset(AdaptedWidth(30));
        make.right.equalTo(textFiedBgView.mas_right);
        
    }];
    
    UIView *lineView = [[UIView alloc]init];
    
    [textFiedBgView addSubview:lineView];
    lineView.backgroundColor = HEXCOLOR(KStand_bkg_color);
    
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(textFiedBgView).offset(0);
        make.right.equalTo(textFiedBgView.mas_right);
        make.top.equalTo(self.newpasswordTF.mas_bottom).offset(0);
        make.height.mas_equalTo(1);
    }];
    
    
    
    // 判断确认密码的正确与否显示
    self.trueOrFalseBtnSecond = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.trueOrFalseBtnSecond setImage:[UIImage imageNamed:@"login_true"] forState:(UIControlStateSelected)];
    
    [self.trueOrFalseBtnSecond setImage:[UIImage imageNamed:@"login_fault"] forState:(UIControlStateNormal)];
    self.trueOrFalseBtnSecond.hidden = YES;
    
    self.trueOrFalseBtnSecond.frame = CGRectMake(0, 0, AdaptedWidth(100), AdaptedHeight(100));
    
    // 重复新密码
    self.repeatPasswordTF = [self customTextFieldOn:textFiedBgView placeholder:@"重复新密码" placeholderColor:nil textColor:nil keyboardType:UIKeyboardTypeDefault];
    [self.repeatPasswordTF mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(textFiedBgView);
        make.top.equalTo(lineView.mas_bottom).offset(0);
        make.height.mas_equalTo(KUITEXTFIELD_HEIGHT);
        make.left.equalTo(self.newpasswordTF.mas_left);
        make.right.equalTo(textFiedBgView.mas_right);
        
    }];
    
    // 确定按钮
    self.sureButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.sureButton setBackgroundImage:[UIImage imageWithColor:HEXCOLOR(KNormal_button_unpressed)] forState:(UIControlStateNormal)];
    self.sureButton.layer.cornerRadius = 5;
    self.sureButton.clipsToBounds = YES;
    self.sureButton.adjustsImageWhenHighlighted = NO;
    self.sureButton.enabled = NO;
    [self.sureButton setBackgroundImage:[UIImage imageWithColor:HEXCOLOR(KNormal_button_pressed)] forState:(UIControlStateSelected)];
    [self.sureButton setTitle:@"确定" forState:(UIControlStateNormal)];
    [self addSubview:self.sureButton];
    
    [self.sureButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self);
        make.top.equalTo(self.repeatPasswordTF.mas_bottom).offset(AdaptedHeight(50));
        make.height.equalTo(KStepButtonORSureButton_HEIGHT);
        make.width.equalTo(textFiedBgView);
        
    }];
    
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.newpasswordTF.rightViewMode = UITextFieldViewModeAlways;
    self.newpasswordTF.rightView = self.trueOrFalseBtnFirst;
    
    self.repeatPasswordTF.rightViewMode = UITextFieldViewModeAlways;
    self.repeatPasswordTF.rightView = self.trueOrFalseBtnSecond;

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
