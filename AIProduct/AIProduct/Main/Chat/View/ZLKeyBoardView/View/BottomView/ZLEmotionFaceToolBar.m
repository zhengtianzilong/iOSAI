//
//  ZLEmotionFaceToolBar.m
//  AIProduct
//
//  Created by mac on 2017/8/18.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ZLEmotionFaceToolBar.h"
#define btnNum 10
@interface ZLEmotionFaceToolBar ()

@property(nonatomic,strong)  UIScrollView  *scrollview;
@property(nonatomic,strong)  UIButton      *sendBtn;


@end

@implementation ZLEmotionFaceToolBar
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setUpUi];
        self.backgroundColor = [[UIColor lightGrayColor]colorWithAlphaComponent:0.3];
    }
    
    return self;
}

- (void)setUpUi
{
    self.scrollview = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame)-80, self.frame.size.height)];
    [self addSubview:self.scrollview];
    self.scrollview.showsHorizontalScrollIndicator = NO;
    
    
    
    
    CGFloat width = 80;
    CGFloat height = CGRectGetHeight(self.frame);
    for (NSInteger i = 0; i<btnNum; i++) {
        
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(i*width, 0, width, height)];
        [btn setTitle:[NSString stringWithFormat:@"表情%ld",i] forState:UIControlStateNormal];
        //        [btn setBackgroundColor:[UIColor colorWithRed:0.1*arc4random_uniform(10) green:0.1*arc4random_uniform(10) blue:0.1*arc4random_uniform(10) alpha:1]];
        [self.scrollview addSubview:btn];
        [btn addTarget:self action:@selector(switchEmoijAction:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        btn.tag = i;
        btn.layer.borderColor = [UIColor lightGrayColor].CGColor;
        btn.layer.borderWidth = 0.8;
        
        
    }
    
    self.scrollview.contentSize = CGSizeMake(width*btnNum, 0);
    
    
    
    
    self.sendBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetWidth(self.frame)-80, 0, 80, self.frame.size.height)];
    [self.sendBtn setBackgroundColor:[UIColor blueColor]];
    [self.sendBtn setTitle:@"发送" forState:UIControlStateNormal];
    [self.sendBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.sendBtn addTarget:self action:@selector(sendClickAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.sendBtn];
    
}


- (void)switchEmoijAction:(UIButton *)btn
{
    
    if (btn.isSelected) {
        return;
    }
    for (UIView *subView in self.scrollview.subviews) {
        if ([subView isKindOfClass:[UIButton class]]) {
            
            UIButton *btn = (UIButton *)subView;
            btn.selected = NO;
            
        }
    }
    
    btn.selected = YES;
    
    self.switchEmoijBlock ? self.switchEmoijBlock(btn.tag):nil;
    
}

- (void)sendClickAction:(UIButton *)btn
{
    self.sendEmoijBlock ? self.sendEmoijBlock() :nil;
}



//默认选中第一个emoij工具选项
- (void)setBtnIndexSelect:(NSInteger)index
{
    
    for (UIView *subView in self.scrollview.subviews) {
        if ([subView isKindOfClass:[UIButton class]]) {
            
            UIButton *btn = (UIButton *)subView;
            if (btn.tag == index) {
                btn.selected = YES;
            }
            
        }
        
    }
}



@end
