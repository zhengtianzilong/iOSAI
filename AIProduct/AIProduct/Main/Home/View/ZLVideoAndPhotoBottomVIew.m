//
//  ZLVideoAndPhotoBottomVIew.m
//  AIProduct
//
//  Created by mac on 2017/8/21.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ZLVideoAndPhotoBottomVIew.h"
#import "UIButton+JKImagePosition.h"
@interface ZLVideoAndPhotoBottomVIew ()



@end

@implementation ZLVideoAndPhotoBottomVIew


- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = HEXCOLOR(KStand_bkg_color);
        
        [self setUpUI];
        
    }
    
    return self;
}

- (void)setUpUI{
    
    _videoBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [_videoBtn setImage:[UIImage imageNamed:@"index_monitor_video_1"] forState:(UIControlStateNormal)];
    [_videoBtn setImage:[UIImage imageNamed:@"index_monitor_video_2"] forState:(UIControlStateSelected)];
    [_videoBtn setTitle:@"录像" forState:(UIControlStateNormal)];
    _videoBtn.titleLabel.font = AdaptedFontSize(22);
    [_videoBtn setTitleColor:HEXCOLOR(0x9fb4ba) forState:(UIControlStateNormal)];
    
    [self addSubview:_videoBtn];
    [_videoBtn setImagePosition:(LXMImagePositionTop) spacing:AdaptedHeight(15)];
    [_videoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(self).offset(AdaptedWidth(201));
        make.centerY.equalTo(self);
        make.width.mas_equalTo(AdaptedWidth(70));
        make.height.mas_equalTo(AdaptedHeight(85));
    }];
    
    
    _photoBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [_photoBtn setImage:[UIImage imageNamed:@"index_monitor_photo"] forState:(UIControlStateNormal)];
    
    [_photoBtn setImage:[UIImage imageNamed:@"index_monitor_photo_2"] forState:(UIControlStateSelected)];
    [_photoBtn setTitle:@"拍照" forState:(UIControlStateNormal)];
    _photoBtn.titleLabel.font = AdaptedFontSize(22);
    [_photoBtn setTitleColor:HEXCOLOR(0x9fb4ba) forState:(UIControlStateNormal)];

    [self addSubview:_photoBtn];
    [_photoBtn setImagePosition:(LXMImagePositionTop) spacing:AdaptedHeight(15)];
   
    [_photoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(self.mas_right).offset(AdaptedWidth(-201));
        make.centerY.equalTo(self);
        make.width.mas_equalTo(AdaptedWidth(70));
        make.height.mas_equalTo(AdaptedHeight(85));
    }];

    [self startVideoConfig];
    
}

- (void)startVideoConfig{
    
    _startVideoBgView = [[UIView alloc]init];
    _startVideoBgView.backgroundColor = HEXCOLOR(KStand_bkg_color);
    _startVideoBgView.hidden = YES;
    [self addSubview:_startVideoBgView];
    [_startVideoBgView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.edges.equalTo(self);
        
    }];
    
    
    _startVideoBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [_startVideoBtn setImage:[UIImage imageNamed:@"index_monitor_capture"] forState:(UIControlStateNormal)];
    [_startVideoBtn setImage:[UIImage imageNamed:@"index_monitor_capture_stop"] forState:(UIControlStateSelected)];
    [_startVideoBgView addSubview:_startVideoBtn];
    
    [_startVideoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.center.equalTo(_startVideoBgView);
        make.width.mas_equalTo(AdaptedWidth(112));
        make.height.mas_equalTo(AdaptedHeight(112));
    }];

    _timeLabel = [[UILabel alloc]init];
    _timeLabel.text = @"00:00:00";
    _timeLabel.font = AdaptedFontSize(36);
    _timeLabel.textColor = HEXCOLOR(0x9fb4ba);
    [_startVideoBgView addSubview:_timeLabel];
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerX.equalTo(_startVideoBgView);
        make.top.equalTo(_startVideoBgView).offset(AdaptedHeight(34));
        make.bottom.equalTo(_startVideoBtn.mas_top).offset(-AdaptedHeight(41));
        
    }];
    
    
}


@end
