//
//  ZLCustomLoginView.m
//  AIProduct
//
//  Created by mac on 2017/8/1.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ZLCustomLoginView.h"



@interface ZLCustomLoginView ()
// ai小智头像
@property (nonatomic, strong) UIImageView *aiImageV;

@property (nonatomic, strong) UIImageView *leftLine;
@property (nonatomic, strong) UIImageView *rightLine;
@end

@implementation ZLCustomLoginView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = HEXCOLOR(KStand_bkg_color);
        [self setupUI];
        
    }
    return self;
    
}

// 设置UI界面
- (void)setupUI{
    
    _leftLine = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"login_logolineleft"]];
    [self addSubview:_leftLine];
    
    [_leftLine mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(self).offset(AdaptedWidth(28));
        make.top.equalTo(self).offset(AdaptedHeight(223));
        make.width.mas_equalTo(AdaptedWidth(200));
        make.height.mas_equalTo(1);
    }];
    // AI头像
    self.aiImageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"login_logo"]];;
    [self addSubview:self.aiImageV];
//    self.aiImageV.backgroundColor = [UIColor redColor];
    [self.aiImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self).offset(AdaptedHeight(198));
        make.height.mas_equalTo(AdaptedHeight(42));
        make.width.mas_equalTo(AdaptedWidth(146));
    }];
    
    _rightLine = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"login_logolineright"]];
    [self addSubview:_rightLine];
    
    [_rightLine mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(self.mas_right).offset(AdaptedWidth(-28));
        make.top.equalTo(self).offset(AdaptedHeight(223));
        make.width.mas_equalTo(AdaptedWidth(200));
        make.height.mas_equalTo(1);
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
        make.top.equalTo(self.aiImageV.mas_bottom).offset(AdaptedHeight(56));
        make.height.mas_equalTo(AdaptedHeight(178));
        make.left.equalTo(self).offset(AdaptedWidth(28));
        make.right.equalTo(self).offset(AdaptedWidth(-28));
//        make.width.mas_equalTo(App_Frame_Width - 40);
        
    }];

    
    // 用户手机号
    
    self.userPhoneTF = [self customTextFieldOn:textFiedBgView placeholder:@"手机号" placeholderColor:nil textColor:nil keyboardType:UIKeyboardTypeNumberPad];
    
    [self.userPhoneTF mas_makeConstraints:^(MASConstraintMaker *make) {
        
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
        make.top.equalTo(self.userPhoneTF.mas_bottom).offset(0);
        make.height.mas_equalTo(1);
    }];

    
    // 用户密码
    
    self.userPasswordTF = [self customTextFieldOn:textFiedBgView placeholder:@"密码" placeholderColor:nil textColor:nil keyboardType:UIKeyboardTypeDefault];
    
    self.userPasswordTF.secureTextEntry = YES;
    [self.userPasswordTF mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(textFiedBgView);
        make.top.equalTo(lineView.mas_bottom).offset(0);
        make.height.equalTo(self.userPhoneTF);
        make.left.equalTo(textFiedBgView).offset(AdaptedWidth(30));
        make.right.equalTo(textFiedBgView.mas_right);
        
    }];
    // 明文密文切换
    self.eyeButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    self.eyeButton.frame = CGRectMake(0, 0, 40, 89/2);
    [self.eyeButton setImage:[UIImage imageNamed:@"login_passwordhover-"] forState:(UIControlStateSelected)];
    [self.eyeButton setImage:[UIImage imageNamed:@"login_password"] forState:(UIControlStateNormal)];
    self.eyeButton.adjustsImageWhenHighlighted = NO;

    // 登录
    self.loginButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.loginButton setBackgroundImage:[UIImage imageWithColor:HEXCOLOR(KNormal_button_unpressed)] forState:(UIControlStateNormal)];
    self.loginButton.layer.cornerRadius = 5;
    self.loginButton.clipsToBounds = YES;
    self.loginButton.enabled = NO;
    self.loginButton.selected = NO;
    self.loginButton.adjustsImageWhenHighlighted = NO;
    [self.loginButton setBackgroundImage:[UIImage imageWithColor:HEXCOLOR(KNormal_button_pressed)] forState:(UIControlStateSelected)];
    [self.loginButton setTitle:@"登录" forState:(UIControlStateNormal)];
    self.loginButton.titleLabel.font = [UIFont systemFontOfSize:18];
    [self addSubview:self.loginButton];
    
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self);
        make.top.equalTo(textFiedBgView.mas_bottom).offset(AdaptedHeight(92));
        make.height.equalTo(KStepButtonORSureButton_HEIGHT);
        make.width.equalTo(textFiedBgView);
        
    }];
    
    
    
    // 忘记密码
    self.forgetpasswordButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.forgetpasswordButton setTitleColor:HEXCOLOR(KEdittext_hint_text_color) forState:(UIControlStateNormal)];
    self.forgetpasswordButton.titleLabel.font =AdaptedFontSize(22);
    [self addSubview:self.forgetpasswordButton];
    [self.forgetpasswordButton setTitle:@"忘记密码?" forState:(UIControlStateNormal)];
    [self.forgetpasswordButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(AdaptedWidth(44));
        make.top.equalTo(self.loginButton.mas_bottom).offset(AdaptedHeight(34));
        make.height.equalTo(AdaptedHeight(40));
        
    }];
    
    self.gotoRegistButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self addSubview:self.gotoRegistButton];
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:@"注册"];
    NSRange titleRange = {0,[title length]};
    [title addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:titleRange];
    [self.gotoRegistButton setAttributedTitle:title
                                     forState:UIControlStateNormal];
    
    //此时如果设置字体颜色要这样
    [title addAttribute:NSForegroundColorAttributeName value:HEXCOLOR(KText_hint_underline_blue)  range:NSMakeRange(0,[title length])];
    
    //设置下划线颜色...
    [title addAttribute:NSUnderlineColorAttributeName value:HEXCOLOR(KText_hint_underline_blue) range:(NSRange){0,[title length]}];
    [title addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:13.0] range:NSMakeRange(0,[title length])];
    [self.gotoRegistButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(self.mas_right).offset(AdaptedWidth(-48));
        make.top.equalTo(self.loginButton.mas_bottom).offset(AdaptedHeight(34));
        make.height.equalTo(AdaptedHeight(40));
        
    }];

    // 还没有账号?去
    UILabel *registLabel = [[UILabel alloc]init];
    registLabel.text = @"还没有账号?去";
    registLabel.textColor = HEXCOLOR(KEdittext_hint_text_color);
    registLabel.font = AdaptedFontSize(22);
    [self addSubview:registLabel];
    [registLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(self.gotoRegistButton.mas_left).offset(0);
        make.top.equalTo(self.loginButton.mas_bottom).offset(AdaptedHeight(34));
        make.height.equalTo(AdaptedHeight(40));
        //            make.width.equalTo(self.userPhoneTF);
        
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
    
    self.userPasswordTF.rightView = self.eyeButton;
    self.userPasswordTF.rightViewMode = UITextFieldViewModeAlways;

    
}



@end
