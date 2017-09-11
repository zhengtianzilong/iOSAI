//
//  ZLPersonAccountInfoView.m
//  AIProduct
//
//  Created by mac on 2017/8/10.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ZLPersonAccountInfoView.h"


@implementation ZLPersonAccountInfoView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = HEXCOLOR(KStand_bkg_color);
        [self setupUI];
        
    }
    return self;
    
}

// 设置UI界面
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

    
    // 上传头像
    self.uploadImageButton = [[UIButton alloc]init];
    [topView addSubview:self.uploadImageButton];
    [self.uploadImageButton setBackgroundImage:[UIImage imageNamed:@"my_addhead"] forState:(UIControlStateNormal)];
    self.uploadImageButton.backgroundColor = [UIColor redColor];
    
    self.uploadImageButton.layer.cornerRadius = AdaptedWidth(76);
    
    self.uploadImageButton.clipsToBounds = YES;
    
    [self.uploadImageButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(topView.mas_top).offset(AdaptedHeight(70));
        make.centerX.equalTo(topView);
        make.height.mas_equalTo(AdaptedHeight(152));
        make.width.mas_equalTo(AdaptedWidth(152));
    }];
    
    
    UIView *textFiedBgView = [[UIView alloc]init];
    
    [self addSubview:textFiedBgView];
    textFiedBgView.layer.shadowColor = HEXCOLOR(KShadow_color_blue).CGColor;
    textFiedBgView.layer.shadowOffset = CGSizeMake(0, 3);
    textFiedBgView.layer.shadowOpacity = 0.17;
    textFiedBgView.layer.cornerRadius = 4;
    textFiedBgView.layer.masksToBounds = false;
    textFiedBgView.backgroundColor = [UIColor whiteColor];
    
    [textFiedBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self);
        make.top.equalTo(topView.mas_bottom).offset(1);
        make.height.mas_equalTo(AdaptedHeight(88));
        make.width.mas_equalTo(App_Frame_Width);
        
    }];
    
    
    // 用户姓名
    
    self.userNameTF = [self customTextFieldOn:textFiedBgView placeholder:@"姓名" placeholderColor:nil textColor:nil keyboardType:UIKeyboardTypeNumberPad];
    
    [self.userNameTF mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(textFiedBgView);
        make.top.equalTo(textFiedBgView).offset(0);
        make.height.mas_equalTo(50);
        make.left.equalTo(textFiedBgView).offset(15);
        make.right.equalTo(textFiedBgView.mas_right);
        
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

    
}


@end
