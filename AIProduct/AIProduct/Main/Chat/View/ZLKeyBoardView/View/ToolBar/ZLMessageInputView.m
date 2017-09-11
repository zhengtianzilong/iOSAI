//
//  ZLMessageInputView.m
//  AIProduct
//
//  Created by mac on 2017/8/18.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ZLMessageInputView.h"
#define kMargin 6

@interface ZLMessageInputView ()

@property(nonatomic,strong)UILabel *placeholderLabel;

@end
@implementation ZLMessageInputView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        
        self.placeholderLabel = [[UILabel alloc]init];
        
        [self addSubview:self.placeholderLabel];
        
        self.placeholderLabel.textColor = [UIColor lightGrayColor];
        self.placeholderLabel.font = [UIFont systemFontOfSize:14];
        
        //        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textViewDidBeginEdit) name:UITextViewTextDidBeginEditingNotification object:nil];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textViewDidChange) name:UITextViewTextDidChangeNotification object:nil];
        
    }
    
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.placeholderLabel.frame = CGRectMake(kMargin, 0,CGRectGetWidth(self.frame)-2*kMargin,CGRectGetHeight(self.frame));
}



- (void)textViewDidBeginEdit
{
    self.placeholderLabel.hidden = YES;
}

- (void)textViewDidChange
{
    if (self.text.length == 0) {
        self.placeholderLabel.hidden = NO;
    }else
    {
        self.placeholderLabel.hidden = YES;
    }
}


//用于手动赋值改变placeHolder状态
- (void)setText:(NSString *)text
{
    [super setText:text];
    if (text == nil) {
        self.placeholderLabel.hidden = NO;
    }else{
        self.placeholderLabel.hidden = YES;
    }
}


- (void)setPlaceholder:(NSString *)placeholder
{
    _placeholder = placeholder;
    self.placeholderLabel.text = placeholder;
}

- (void)setPlaceholderTextColor:(UIColor *)placeholderTextColor
{
    _placeholderTextColor = placeholderTextColor;
    self.placeholderTextColor = self.placeholderLabel.textColor;
    
}
@end
