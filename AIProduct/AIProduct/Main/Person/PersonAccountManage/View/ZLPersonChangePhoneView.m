//
//  ZLPersonChangePhoneView.m
//  AIProduct
//
//  Created by mac on 2017/8/3.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ZLPersonChangePhoneView.h"

@interface ZLPersonChangePhoneView ()

// 手机号
@property (nonatomic, strong) UILabel *phoneLabel;
// 已绑定图标
@property (nonatomic, strong) UIButton *didSelectBtn;

// 提示文本
@property (nonatomic, strong) UILabel *tipsLabel;



@property (nonatomic, strong) UITextField *phoneTF;


@end

@implementation ZLPersonChangePhoneView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = HEXCOLOR(KStand_bkg_color);
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
    [self.tipsLabel setText:@"*绑定新手机号码需要通过短信验证"];
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
    
    self.phoneTF = [self customTextFieldOn:textFiedBgView placeholder:@"请输入新手机号码" placeholderColor:nil textColor:nil keyboardType:UIKeyboardTypeNumberPad];
    self.phoneTF.leftViewMode = UITextFieldViewModeAlways;
    [self addSubview:self.phoneTF];
    [self.phoneTF mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerX.equalTo(textFiedBgView);
        make.top.equalTo(textFiedBgView).offset(0);
        make.height.mas_equalTo(AdaptedHeight(88));
        make.left.equalTo(textFiedBgView).offset(0);
        make.right.equalTo(textFiedBgView.mas_right);
        
    }];
    
    // 手机区域选择
    self.leftButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.leftButton setTitle:@"+86" forState:(UIControlStateNormal)];
    [self.leftButton setTitleColor:HEXCOLORAndAlpha(0x191919, 0.5) forState:(UIControlStateNormal)];

    self.leftButton.titleLabel.font = AdaptedFontSize(32);
    self.leftButton.frame = CGRectMake(0, 0, AdaptedWidth(160), AdaptedHeight(88));

    // 下一步
    self.stepButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.stepButton setBackgroundImage:[UIImage imageWithColor:HEXCOLOR(KNormal_button_unpressed)] forState:(UIControlStateNormal)];
    self.stepButton.layer.cornerRadius = 4;
    self.stepButton.clipsToBounds = YES;
    [self.stepButton setBackgroundImage:[UIImage imageWithColor:HEXCOLOR(KNormal_button_pressed)] forState:(UIControlStateHighlighted)];
    [self.stepButton setTitle:@"下一步" forState:(UIControlStateNormal)];
    self.stepButton.titleLabel.font = AdaptedFontSize(36);
    [self addSubview:self.stepButton];
    
    [self.stepButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self);
        make.top.equalTo(self.phoneTF.mas_bottom).offset(AdaptedHeight(92));
        make.height.mas_equalTo(AdaptedHeight(90));
        make.width.mas_equalTo(AdaptedWidth(694));
        
    }];
}


- (void)layoutSubviews{
    [super layoutSubviews];

    self.phoneTF.leftView = self.leftButton;
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
