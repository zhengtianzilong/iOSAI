//
//  ZLControlVideoView.m
//  AIProduct
//
//  Created by mac on 2017/8/21.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ZLControlVideoView.h"

@interface ZLControlVideoView ()
@property (nonatomic, strong) UIButton *letfBtn;
@property (nonatomic, strong) UIButton *rightBtn;
@property (nonatomic, strong) UIButton *topBtn;
@property (nonatomic, strong) UIButton *bottomBtn;

@end

@implementation ZLControlVideoView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor clearColor];
        
        [self setUpUI];
        
    }
    return self;
}


- (void)setUpUI{
    _letfBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    
    [_letfBtn setImage:[UIImage imageNamed:@"video_left"] forState:(UIControlStateNormal)];
    [_letfBtn setImage:[UIImage imageNamed:@"video_left_hover"] forState:(UIControlStateHighlighted)];
    [self addSubview:_letfBtn];
    [_letfBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(self);
        make.left.equalTo(self).offset(AdaptedHeight(24));
        make.height.mas_equalTo(AdaptedHeight(74));
        make.width.mas_equalTo(AdaptedWidth(74));
        
    }];
    
    _rightBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    
    [_rightBtn setImage:[UIImage imageNamed:@"video_right"] forState:(UIControlStateNormal)];
    [_rightBtn setImage:[UIImage imageNamed:@"video_right_hover"] forState:(UIControlStateHighlighted)];
    [self addSubview:_rightBtn];
    [_rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(self);
        make.right.equalTo(self.mas_right).offset(AdaptedHeight(-24));
        make.height.mas_equalTo(AdaptedHeight(74));
        make.width.mas_equalTo(AdaptedWidth(74));
        
    }];
    
    _topBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    
    [_topBtn setImage:[UIImage imageNamed:@"video_top"] forState:(UIControlStateNormal)];
    [_topBtn setImage:[UIImage imageNamed:@"video_top_hover"] forState:(UIControlStateHighlighted)];
    [self addSubview:_topBtn];
    [_topBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self);
        make.top.equalTo(self).offset(AdaptedHeight(47));
        make.height.mas_equalTo(AdaptedHeight(74));
        make.width.mas_equalTo(AdaptedWidth(74));
        
    }];
    
    _bottomBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    
    [_bottomBtn setImage:[UIImage imageNamed:@"video_bottom"] forState:(UIControlStateNormal)];
    [_bottomBtn setImage:[UIImage imageNamed:@"video_bottom_hover"] forState:(UIControlStateHighlighted)];
    [self addSubview:_bottomBtn];
    [_bottomBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self);
        make.bottom.equalTo(self.mas_bottom).offset(AdaptedHeight(-120));
        make.height.mas_equalTo(AdaptedHeight(74));
        make.width.mas_equalTo(AdaptedWidth(74));
        
    }];
}


@end
