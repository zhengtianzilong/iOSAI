//
//  ZLMonitorTipsOpenView.m
//  AIProduct
//
//  Created by mac on 2017/8/21.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ZLMonitorTipsOpenView.h"
#import "UIButton+JKImagePosition.h"
@interface ZLMonitorTipsOpenView ()

@property (nonatomic, strong) UIButton *tipsBtn;



@end

@implementation ZLMonitorTipsOpenView


- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = HEXCOLOR(0xdcf7fe);
        
        [self setUpUI];
        
    }
    
    return self;
}

- (void)setUpUI{
    _tipsBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];

    [_tipsBtn setImage:[UIImage imageNamed:@"index_monitor_novideo"] forState:(UIControlStateNormal)];
    [_tipsBtn setTitle:@"对方监控没有打开哦" forState:(UIControlStateNormal)];
    _tipsBtn.titleLabel.font = AdaptedFontSize(24);
    [_tipsBtn setTitleColor:HEXCOLORAndAlpha(0x11ccf9, 0.65) forState:(UIControlStateNormal)];
    [self addSubview:_tipsBtn];
    [_tipsBtn setImagePosition:(LXMImagePositionTop) spacing:(AdaptedHeight(22))];
    _tipsBtn.adjustsImageWhenHighlighted = NO;
    [_tipsBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerX.equalTo(self);
        make.top.equalTo(self).offset(AdaptedHeight(124));
        make.height.mas_equalTo(AdaptedHeight(116));
        make.width.mas_equalTo(AdaptedWidth(250));
        
    }];
    
    
}

@end
