//
//  ZLHomeBottomView.m
//  AIProduct
//
//  Created by mac on 2017/8/3.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ZLHomeBottomView.h"
#import "ZLMonitorView.h"

@interface ZLHomeBottomView ()

// 天气等区块
@property (nonatomic, strong) ZLMonitorView *monitorView;
@property (nonatomic, strong) NSArray *bottomArray;
@end
@implementation ZLHomeBottomView

- (instancetype)initWithFrame:(CGRect)frame bottomArray:(NSArray *)bottomArray{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        self.bottomArray = bottomArray;
        
        [self setupUI];
        
    }
    return self;
    
}
// 设置UI界面
- (void)setupUI{
    
    CGFloat width = AdaptedWidth(110);
    CGFloat height = AdaptedHeight(170);
    
    CGFloat marginX = (App_Frame_Width - width * 3 - AdaptedWidth(100) * 2)/2 ;
    CGFloat y = AdaptedHeight(84);
    [self addSubview:self.monitorView];
    
    for (int i = 0; i < self.bottomArray.count; i++) {
        CGFloat x = (i % self.bottomArray.count) * (width + marginX) + AdaptedWidth(100) ;
        self.monitorView = [[ZLMonitorView alloc]initWithFrame:CGRectMake(x, y, width, height)model:self.bottomArray[i]];
        
        [self addSubview:self.monitorView];
        
    }
}

@end
