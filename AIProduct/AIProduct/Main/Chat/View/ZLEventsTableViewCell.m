//
//  ZLEventsTableViewCell.m
//  AIProduct
//
//  Created by mac on 2017/8/16.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ZLEventsTableViewCell.h"
#import "ZLCalendarCustomView.h"

@interface ZLEventsTableViewCell ()
@property (nonatomic, strong) ZLCalendarCustomView *calendar;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *detailLabel;

@property (nonatomic, strong) UIButton *isOpenBtn;

@end

@implementation ZLEventsTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setUpUI];
        
    }
    return self;
    
}

- (void)setUpUI{
    
    _calendar = [[ZLCalendarCustomView alloc]init];
    [self.contentView addSubview:_calendar];

    
    _titleLabel = [[UILabel alloc]init];
    _titleLabel.font = AdaptedFontSize(30);
//    _titleLabel.text = @"09:00";
    _titleLabel.textColor = HEXCOLOR(0x191919);
    [self.contentView addSubview:_titleLabel];

    
    _detailLabel = [[UILabel alloc]init];
    [self addSubview:_detailLabel];
    _detailLabel.textColor = HEXCOLORAndAlpha(0x6c6c6c, 0.5);
    _detailLabel.font = AdaptedFontSize(24);

    _isOpenBtn = [[UIButton alloc]init];
    
    UIImage *rowImage = [UIImage imageNamed:@"my_next"];
    
   
    
    [_isOpenBtn setImage:rowImage forState:(UIControlStateNormal)];
    
    CGAffineTransform transform = CGAffineTransformMakeRotation(M_PI_2);
    _isOpenBtn.transform = transform;
    
    [_isOpenBtn addTarget:self action:@selector(openBtn:) forControlEvents:(UIControlEventTouchUpInside)];
    
    [self.contentView addSubview:_isOpenBtn];
    
    
    

}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    [_calendar mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.contentView).offset(AdaptedWidth(32));
        make.top.equalTo(self.contentView).offset(AdaptedHeight(30));
        make.width.height.mas_equalTo(AdaptedHeight(98));
//        make.bottom.equalTo(self.contentView.mas_bottom).offset(-AdaptedHeight(33));
//        make.width.mas_equalTo(AdaptedWidth(98));
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(_calendar.mas_right).offset(AdaptedWidth(32));
        make.top.equalTo(self.contentView).offset(AdaptedHeight(40));
        make.height.mas_equalTo(AdaptedHeight(30));
//        make.bottom.equalTo(self.contentView.mas_bottom).offset(-AdaptedHeight(90));
    }];
    
    
    
    [_isOpenBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(self.contentView.mas_right).offset(-AdaptedWidth(44));
        make.top.equalTo(self.contentView).offset(AdaptedHeight(60));
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-20);
        
    }];
    
    [_detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(_titleLabel);
        
        make.top.equalTo(_titleLabel.mas_bottom).offset(AdaptedHeight(10));
        make.right.equalTo(self.contentView.mas_right).offset(-AdaptedHeight(100));

    }];
    
    
}

- (void)openBtn:(UIButton *)sender{
    
    self.openClickBlock(sender);
    
}

- (void)setModel:(ZLEventsModel *)model{
    
    _detailLabel.text = model.detial;
    
    if (model.detial.length > 18) {
        
        _isOpenBtn.hidden = NO;
        if (model.is_Open) {
            _detailLabel.numberOfLines = 0;
        }else{
            _detailLabel.numberOfLines = 1;
        }
    }else{
        self.isOpenBtn.hidden = YES;
        _detailLabel.numberOfLines = 1;
    }
    
    
    _titleLabel.text = model.title;
    
    _calendar.calendarModel = model.calendarModel;

}


@end
