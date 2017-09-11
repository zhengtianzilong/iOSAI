//
//  ZLChartBottomRemindView.m
//  AIProduct
//
//  Created by mac on 2017/8/16.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ZLChartBottomRemindView.h"
#import "UIButton+JKImagePosition.h"
@interface ZLChartBottomRemindView ()<UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIImageView *aiImageV;

@property (nonatomic, strong) UILabel *descripLabel;

@property (nonatomic, strong) UIButton *remindBtn;

@property (nonatomic, strong) UIButton *eventBtn;

@property (nonatomic, strong) UIView *bottomView;

@end

@implementation ZLChartBottomRemindView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = HEXCOLORAndAlpha(0x0000, 0.25);
        [self setUpUI];
        
    }
    return self;
}

- (void)setUpUI{
    
//    self.frame = CGRectMake(0, 0, App_Frame_Width, App_Frame_Height);
    
    _bottomView = [[UIView alloc]init];
    _bottomView.backgroundColor = HEXCOLORAndAlpha(0xffffff, 0.95);
    [self addSubview:_bottomView];
    [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(self);
        make.right.equalTo(self.mas_right);
        make.bottom.equalTo(self.mas_bottom);
        make.height.mas_equalTo(AdaptedHeight(408));
        
    }];
    
    
    
    _remindBtn = [[UIButton alloc]init];
    [_remindBtn setImage:[UIImage imageNamed:@"chat_add_clock"] forState:(UIControlStateNormal)];
    [_remindBtn setTitle:@"添加提醒" forState:(UIControlStateNormal)];
    _remindBtn.titleLabel.font = AdaptedFontSize(28);
    [_remindBtn setTitleColor:HEXCOLOR(0xa5a5a5) forState:(UIControlStateNormal)];
    
    [_remindBtn addTarget:self action:@selector(remindClick:) forControlEvents:(UIControlEventTouchUpInside)];
    
    [_bottomView addSubview:_remindBtn];
    
    [_remindBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(_bottomView).offset(AdaptedWidth(201));
        make.top.equalTo(_bottomView.mas_top).offset(AdaptedHeight(52));
        make.width.mas_equalTo(AdaptedWidth(120));
        make.height.mas_equalTo(AdaptedHeight(155));
        
    }];
    
    
    [_remindBtn setImagePosition:(LXMImagePositionTop) spacing:5];
    
    
    _eventBtn = [[UIButton alloc]init];
    [_eventBtn setImage:[UIImage imageNamed:@"chat_add_diary"] forState:(UIControlStateNormal)];
    [_eventBtn setTitle:@"事件薄" forState:(UIControlStateNormal)];
    _eventBtn.titleLabel.font = AdaptedFontSize(28);
    [_eventBtn setTitleColor:HEXCOLOR(0xa5a5a5) forState:(UIControlStateNormal)];
    [_bottomView addSubview:_eventBtn];
    
    [_eventBtn addTarget:self action:@selector(eventClick:) forControlEvents:(UIControlEventTouchUpInside)];
    
    [_eventBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(_bottomView.mas_right).offset(AdaptedWidth(-201));
        make.top.equalTo(_remindBtn);
        make.width.mas_equalTo(AdaptedWidth(120));
        make.height.mas_equalTo(AdaptedHeight(155));
        
    }];
    
    
    [_eventBtn setImagePosition:(LXMImagePositionTop) spacing:5];
    
    
    //点击手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(removeView)];
    tap.delegate = self;
    [self addGestureRecognizer:tap];
    
    
}

- (void)remindClick:(UIButton *)sender{
    
    if (_remindBlock) {
        
        [self removeView];
        
        _remindBlock();
        
    }
    
}

- (void)eventClick:(UIButton *)sender{
    
    if (_eventBlock) {
        [self removeView];
        _eventBlock();
    }
    
}

- (void)removeView{
    [UIView animateWithDuration:0.25 animations:^{
        
        self.alpha = 0.0;
        
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

@end
