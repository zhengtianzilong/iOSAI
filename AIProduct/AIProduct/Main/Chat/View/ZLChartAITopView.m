//
//  ZLChartAITopView.m
//  AIProduct
//
//  Created by mac on 2017/8/16.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ZLChartAITopView.h"

@interface ZLChartAITopView ()

@property (nonatomic, strong) UIImageView *aiImageV;

@property (nonatomic, strong) UILabel *descripLabel;

@end

@implementation ZLChartAITopView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self setUpUI];
        self.layer.shadowColor = HEXCOLOR(0x11ccf9).CGColor;
        self.layer.shadowOffset = CGSizeMake(0, 1);
        self.layer.shadowOpacity = 0.2;
//        self.layer.shadowRadius = 5;
        [self.layer setShadowPath:(__bridge CGPathRef _Nullable)([UIBezierPath bezierPathWithRect:self.bounds])];
        
        // 必须为no,不然出不来阴影
//        self.layer.masksToBounds = NO;
    }
    return self;
}

- (void)setUpUI{
    _aiImageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"chat_robot"]];
    [self addSubview:_aiImageV];
    [_aiImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self).offset(AdaptedWidth(38));
        make.top.equalTo(self).offset(AdaptedHeight(20));
        make.bottom.equalTo(self.mas_bottom).offset(AdaptedHeight(-20));
        
    }];

    
    _descripLabel = [[UILabel alloc]init];
    _descripLabel.text = @"小智在线哦,快来跟我聊聊天吧~~~";
    [self addSubview:_descripLabel];
    _descripLabel.font = AdaptedFontSize(20);
    [_descripLabel setTextColor:HEXCOLOR(0xa5a5a5)];
    [_descripLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(_aiImageV.mas_right).offset(AdaptedWidth(20));
        make.top.equalTo(self).offset(AdaptedHeight(28));
        //        make.bottom.equalTo(self.contentView.mas_bottom).offset(AdaptedHeight(-31));
        
    }];

}

@end
