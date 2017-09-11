//
//  ZLPersonTopView.m
//  AIProduct
//
//  Created by mac on 2017/8/2.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ZLPersonTopView.h"

@interface ZLPersonTopView ()

@property (nonatomic, strong) UIImageView *bgImageV;

@property (nonatomic, strong) UIImageView *userImageV;

@end

@implementation ZLPersonTopView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        [self setupUI];
        
    }
    return self;
}

- (void)setupUI{
    
    self.bgImageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"my_head"]];
    [self addSubview:self.bgImageV];
    [self.bgImageV mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(self);
        make.right.equalTo(self.mas_right);
        make.top.equalTo(self.mas_top);
        make.bottom.equalTo(self.mas_bottom);
        
    }];
    
//    self.userImageV = [UIButton buttonWithType:(UIButtonTypeCustom)];
//    [self.userImageV setBackgroundImage:[UIImage imageNamed:@"my_head_nologin"] forState:(UIControlStateNormal)];
    self.userImageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"my_head_nologin"]];
    [self addSubview:self.userImageV];
    
    self.userImageV.layer.shadowColor = HEXCOLOR(KShadow_color_blue).CGColor;
    self.userImageV.layer.shadowOffset = CGSizeMake(0, 3);
    self.userImageV.layer.shadowOpacity = 0.17;
//    self.userImageV.layer.cornerRadius = AdaptedWidth(76);
    self.userImageV.layer.masksToBounds = false;
    
    
    [self.userImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(AdaptedHeight(128));
        make.centerX.equalTo(self);
        make.width.mas_equalTo(AdaptedWidth(152));
        make.height.mas_equalTo(AdaptedHeight(152));
        
    }];
    
    self.loginButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
//    self.loginButton.backgroundColor = HEXCOLOR(0xFFFEFE);
    [self.loginButton setTitle:@"未登录" forState:(UIControlStateNormal)];
    self.loginButton.titleLabel.font = AdaptedFontSize(28);
    self.loginButton.titleLabel.textColor = HEXCOLOR(0xFFFEFE);
    self.loginButton.alpha = 0.5;
    self.loginButton.layer.cornerRadius = 2;
    self.loginButton.clipsToBounds = YES;
    [self.loginButton.layer setBorderColor:HEXCOLOR(0xF3FCFF).CGColor];
    [self.loginButton.layer setBorderWidth:1];
    [self.loginButton.layer setMasksToBounds:YES];
    [self addSubview:self.loginButton];
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.userImageV.mas_bottom).offset(AdaptedHeight(4));
        make.centerX.equalTo(self.userImageV);
        
        make.width.mas_equalTo(AdaptedWidth(120));
        make.height.mas_equalTo(AdaptedHeight(46));
        
    }];
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
//    // 性能最好的绘制圆形
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.userImageV.bounds byRoundingCorners:(UIRectCornerAllCorners) cornerRadii:(self.userImageV.bounds.size)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
    maskLayer.frame = self.userImageV.bounds;
    maskLayer.path = path.CGPath;
    self.userImageV.layer.mask = maskLayer;
    
    
}
@end
