//
//  ZLAgreeAndAcceptView.m
//  AIProduct
//
//  Created by mac on 2017/8/1.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ZLAgreeAndAcceptView.h"

@implementation ZLAgreeAndAcceptView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.checkButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [self addSubview:self.checkButton];
        [self.checkButton setImage:[UIImage imageNamed:@"login_selectlink"] forState:(UIControlStateNormal)];
        [self.checkButton setImage:[UIImage imageNamed:@"login_select"] forState:(UIControlStateSelected)];
        self.checkButton.selected = YES;
        self.checkButton.adjustsImageWhenHighlighted = NO;
        [self.checkButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
            make.left.equalTo(self.mas_left).offset(0);
            make.top.equalTo(self.mas_top).offset(0);
            make.height.mas_equalTo(AdaptedHeight(26));
            make.width.mas_equalTo(AdaptedWidth(26));
            
        }];
        
        self.agreeAndAcceptLabel = [[UILabel alloc]init];
        self.agreeAndAcceptLabel.text = @"同意并接受用户协议";
        self.agreeAndAcceptLabel.textColor = HEXCOLOR(0x6c6c6c);
        self.agreeAndAcceptLabel.font = [UIFont systemFontOfSize:11];
        [self addSubview:self.agreeAndAcceptLabel];
        [self.agreeAndAcceptLabel mas_makeConstraints:^(MASConstraintMaker *make) {
         
            make.left.equalTo(self.checkButton.mas_right).offset(AdaptedWidth(10));
            make.top.equalTo(self.checkButton);
            make.bottom.equalTo(self.checkButton.mas_bottom);
            
        }];
        
        
    }
    return self;
    
}


@end
