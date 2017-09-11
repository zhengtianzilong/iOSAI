//
//  ZLPersonChangePhoneView.m
//  AIProduct
//
//  Created by mac on 2017/8/3.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ZLPersonwaitVerfiyView.h"

@interface ZLPersonwaitVerfiyView ()

// 手机号
@property (nonatomic, strong) UILabel *phoneLabel;
// 已绑定图标
@property (nonatomic, strong) UIButton *didSelectBtn;

// 提示文本
@property (nonatomic, strong) UILabel *tipsLabel;

@property (nonatomic, strong) UITextField *phoneCodeTF;


@end

@implementation ZLPersonwaitVerfiyView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        [self setupUI];
        
    }
    return self;
}

- (void)setupUI{
    UIView *topView = [[UIView alloc]init];
    
    [self addSubview:topView];
    topView.backgroundColor = [UIColor whiteColor];
    
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self);
        make.top.equalTo(self).offset(0);
        make.height.mas_equalTo(AdaptedHeight(300));
        make.width.mas_equalTo(App_Frame_Width);
        
    }];
    
    
    self.phoneLabel = [[UILabel alloc]init];
    [self.phoneLabel setText:@"15112319630"];
    self.phoneLabel.font = AdaptedFontSize(40);
    self.phoneLabel.textColor = HEXCOLOR(0x969696);
    self.phoneLabel.textAlignment = NSTextAlignmentCenter;
    [topView addSubview:self.phoneLabel];
    [self.phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self);
        make.top.equalTo(topView.mas_top).offset(AdaptedHeight(90));
        make.width.mas_equalTo(App_Frame_Width / 2);
        make.height.mas_equalTo(25);
        
    }];
    
    self.didSelectBtn = [[UIButton alloc]init];
    [self.didSelectBtn setBackgroundColor:HEXCOLOR(0xCDD3D4)];
    self.didSelectBtn.titleLabel.font = AdaptedFontSize(24);
    [self.didSelectBtn setTitle:@"已绑定" forState:(UIControlStateNormal)];
    self.didSelectBtn.layer.cornerRadius = 2;
    self.didSelectBtn.clipsToBounds = YES;
    [topView addSubview:self.didSelectBtn];
    [self.didSelectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self.phoneLabel);
        make.top.equalTo(self.phoneLabel.mas_bottom).offset(AdaptedHeight(26));
        make.width.mas_equalTo(AdaptedWidth(104));
        make.height.mas_equalTo(AdaptedHeight(36));
        
    }];
    
    self.tipsLabel = [[UILabel alloc]init];
    [self.tipsLabel setText:@"*短信验证码已发送"];
    [self.tipsLabel setTextColor:HEXCOLOR(0xF93D11)];
    self.tipsLabel.font = AdaptedFontSize(22);
    [topView addSubview:self.tipsLabel];
    [self.tipsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(topView).offset(AdaptedWidth(30));
        make.bottom.equalTo(topView.mas_bottom).offset(-AdaptedHeight(12));
        make.width.mas_equalTo(App_Frame_Width - 40);
        make.height.mas_equalTo(20);
        
    }];
    
    
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
        make.top.equalTo(topView.mas_bottom).offset(1);
        make.height.mas_equalTo(AdaptedHeight(88));
        make.width.mas_equalTo(App_Frame_Width);
        
    }];
    
    self.phoneCodeTF = [self customTextFieldOn:textFiedBgView placeholder:@"请输入手机收到的验证码" placeholderColor:nil textColor:nil keyboardType:UIKeyboardTypeNumberPad];
    self.phoneCodeTF.rightViewMode = UITextFieldViewModeAlways;
    [self addSubview:self.phoneCodeTF];
    [self.phoneCodeTF mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(textFiedBgView);
        make.top.equalTo(textFiedBgView).offset(0);
        make.height.mas_equalTo(AdaptedHeight(88));
        make.left.equalTo(textFiedBgView).offset(0);
        make.right.equalTo(textFiedBgView.mas_right);
        
    }];
    
    // 验证码按钮
    self.timeButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    self.timeButton.backgroundColor = HEXCOLOR(KNormal_button_pressed);
    self.timeButton.frame = CGRectMake(0, 5, 100, 40);
    self.timeButton.layer.cornerRadius = 5.0;
    self.timeButton.clipsToBounds = YES;
    [self.timeButton setTitle:@"获取验证码" forState:(UIControlStateNormal)];
    [self.timeButton setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    
    // 确定按钮
    self.sureButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.sureButton setBackgroundImage:[UIImage imageWithColor:HEXCOLOR(KNormal_button_unpressed)] forState:(UIControlStateNormal)];
    self.sureButton.layer.cornerRadius = 4;
    self.sureButton.clipsToBounds = YES;
    [self.sureButton setBackgroundImage:[UIImage imageWithColor:HEXCOLOR(KNormal_button_pressed)] forState:(UIControlStateHighlighted)];
    [self.sureButton setTitle:@"确定" forState:(UIControlStateNormal)];
    self.sureButton.titleLabel.font = AdaptedFontSize(36);
    [self addSubview:self.sureButton];
    
    [self.sureButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self);
        make.top.equalTo(self.phoneCodeTF.mas_bottom).offset(AdaptedHeight(92));
        make.height.mas_equalTo(AdaptedHeight(90));
        make.width.mas_equalTo(AdaptedWidth(694));
        
    }];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.phoneCodeTF.rightView = self.timeButton;
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
