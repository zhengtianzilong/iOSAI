//
//  ZLCalendarCustomView.m
//  AIProduct
//
//  Created by mac on 2017/8/16.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ZLCalendarCustomView.h"

@interface ZLCalendarCustomView ()

@property (nonatomic, strong) UILabel *yearAndMonthLabel;

@property (nonatomic, strong) UIView *lineView;

@property (nonatomic, strong) UILabel *dayLabel;

@property (nonatomic, strong) UILabel *sunLabel;

@end

@implementation ZLCalendarCustomView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = HEXCOLOR(0x2fdf95);
        [self setUpUI];
        
        self.layer.cornerRadius = 4;
        self.clipsToBounds = YES;
        
    }
    
    return  self;
}

- (void)setUpUI{
    
    _yearAndMonthLabel = [[UILabel alloc]init];
//    _yearAndMonthLabel.text = @"2017.8";
    _yearAndMonthLabel.font = AdaptedFontSize(20);
    _yearAndMonthLabel.textColor = HEXCOLOR(0xfeffff);
    [self addSubview:_yearAndMonthLabel];
    [_yearAndMonthLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerX.equalTo(self);
        make.top.equalTo(self).offset(AdaptedHeight(18));
        make.width.mas_equalTo(AdaptedWidth(65));
        make.height.mas_equalTo(AdaptedHeight(16));
        
    }];
    
    _lineView = [[UIView alloc]init];
    _lineView.backgroundColor = HEXCOLOR(0xfeffff);
    [self addSubview:_lineView];
    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerX.equalTo(self);
        make.width.equalTo(_yearAndMonthLabel);
        make.height.mas_equalTo(1);
        make.top.equalTo(_yearAndMonthLabel.mas_bottom).offset(AdaptedHeight(8));
        
    }];
    
    
    _dayLabel = [[UILabel alloc]init];
//    _dayLabel.text = @"03";
    _dayLabel.textColor = HEXCOLOR(0xfeffff);
    _dayLabel.font = AdaptedFontBoldSize(40);
    [self addSubview:_dayLabel];
    [_dayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(_lineView).offset(AdaptedWidth(4));
        make.width.mas_equalTo(AdaptedWidth(50));
        make.height.mas_equalTo(AdaptedHeight(35));
        make.top.equalTo(_lineView.mas_bottom).offset(AdaptedHeight(8));
        
    }];
    
    _sunLabel = [[UILabel alloc]init];
    _sunLabel.text = @"日";
    _sunLabel.textColor = HEXCOLOR(0xfeffff);
    _sunLabel.font = AdaptedFontSize(16);
    [self addSubview:_sunLabel];
    [_sunLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(_dayLabel.mas_right).offset(-3);
        make.right.equalTo(_lineView.mas_right);
        make.height.mas_equalTo(AdaptedHeight(12));
        make.bottom.equalTo(_dayLabel.mas_bottom).offset(-AdaptedHeight(6));
        
    }];
    
}

- (void)setCalendarModel:(ZLCalendarModel *)calendarModel{
    
    _yearAndMonthLabel.text = [NSString stringWithFormat:@"%@.%@",calendarModel.year,calendarModel.month];
    _dayLabel.text = calendarModel.day;
    
}


@end
