//
//  ZLMoreViewBtn.m
//  AIProduct
//
//  Created by mac on 2017/8/18.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ZLMoreViewBtn.h"
#import "ZLKeyBoardHeader.h"
#define KMargin 2
#define KBtnWidth 60


@implementation ZLMoreViewBtn 


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        
    }
    return self;
}


- (void)layoutSubviews
{
    
    [super layoutSubviews];
    
    
    self.imageView.frame = CGRectMake(self.width/2-KBtnWidth/2, 0, KBtnWidth, KBtnWidth);
    self.titleLabel.frame = CGRectMake(0, CGRectGetMaxY(self.imageView.frame), self.width, 30);
    
    
}
@end
