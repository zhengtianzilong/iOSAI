//
//  ZLVideoWaitView.m
//  AIProduct
//
//  Created by mac on 2017/8/30.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ZLVideoWaitView.h"
#import "UIButton+JKImagePosition.h"

@interface ZLVideoWaitView ()



@end
@implementation ZLVideoWaitView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {

        [self setupUI];
        
        self.backgroundColor = HEXCOLORAndAlpha(0x000000, 0.75);
    }
    return self;
    
}


// 设置UI界面
- (void)setupUI{
    [self setUpTipsLabel];

    [self setUpBottomButton];
    
    
}
- (void)setUpTipsLabel{
    _tipsLabel = [[UILabel alloc]init];
    _tipsLabel.text = @"正在等待对方接受邀请";
    _tipsLabel.font = AdaptedFontSize(32);
    _tipsLabel.textColor = [UIColor whiteColor];
    [self addSubview:_tipsLabel];
    [_tipsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self).offset(AdaptedHeight(580));
        make.centerX.equalTo(self);
        
    }];
    
    
    
}


- (void)setUpBottomButton{
    
//    _tipsBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
//    
//    [_tipsBtn setImage:[UIImage imageNamed:@"index_monitor_novideo"] forState:(UIControlStateNormal)];
//    [_tipsBtn setTitle:@"对方监控没有打开哦" forState:(UIControlStateNormal)];
//    _tipsBtn.titleLabel.font = AdaptedFontSize(24);
//    [_tipsBtn setTitleColor:HEXCOLORAndAlpha(0x11ccf9, 0.65) forState:(UIControlStateNormal)];
//    [self addSubview:_tipsBtn];
//    [_tipsBtn setImagePosition:(LXMImagePositionTop) spacing:(AdaptedHeight(22))];
//    _tipsBtn.adjustsImageWhenHighlighted = NO;
//    [_tipsBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        
//        make.centerX.equalTo(self);
//        make.top.equalTo(self).offset(AdaptedHeight(124));
//        make.height.mas_equalTo(AdaptedHeight(116));
//        make.width.mas_equalTo(AdaptedWidth(250));
//        
//    }];

    
    
    
    _cancelBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [_cancelBtn setImage:[UIImage imageNamed:@"video_endcall"] forState:(UIControlStateNormal)];
    [_cancelBtn setImage:[UIImage imageNamed:@"video_endcall_hover"] forState:(UIControlStateHighlighted)];

    [_cancelBtn setTitle:@"取消" forState:(UIControlStateNormal)];
    _cancelBtn.titleLabel.font = AdaptedFontSize(26);
    [_cancelBtn setTitleColor:HEXCOLORAndAlpha(0xffffff, 1) forState:(UIControlStateNormal)];
    [self addSubview:_cancelBtn];
    
    [_cancelBtn setImagePosition:(LXMImagePositionTop) spacing:AdaptedHeight(26)];
    
    [_cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self);
        make.bottom.equalTo(self.mas_bottom).offset(-AdaptedHeight(220));
        make.height.mas_equalTo(AdaptedHeight(178));
    }];
    

    
}


@end
