//
//  ZLChartRemindTextView.m
//  AIProduct
//
//  Created by mac on 2017/8/29.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ZLChartRemindTextView.h"

@interface ZLChartRemindTextView()



@end

@implementation ZLChartRemindTextView
- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        _placeholderLable = [[UILabel alloc]init];
        [self addSubview:_placeholderLable];
        
        _placeholderLable.font = AdaptedFontSize(28);
        
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textViewDidChange) name:UITextViewTextDidChangeNotification object:nil];
        
        
    }
    return self;
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.placeholderLable.frame = CGRectMake(AdaptedWidth(52), 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
    
}

- (void)textViewDidChange{
    
    if (self.text.length == 0) {
        self.placeholderLable.hidden = NO;
    }else
    {
        self.placeholderLable.hidden = YES;
    }
    
}

- (void)setText:(NSString *)text{
    
    [super setText:text];
    if (text == nil) {
        
        self.placeholderLable.hidden = NO;
        
    }else{
        self.placeholderLable.hidden = YES;
    }
    
    
}

- (void)setPlaceholder:(NSString *)placeholder{
    
    _placeholder = placeholder;
    _placeholderLable.text = placeholder;
    
}

- (void)setPlaceholderTextColor:(UIColor *)placeholderTextColor{
    
    _placeholderTextColor = placeholderTextColor;
    
    _placeholderLable.textColor = placeholderTextColor;
}



@end
