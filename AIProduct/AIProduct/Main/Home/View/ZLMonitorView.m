//
//  ZLMonitorView.m
//  AIProduct
//
//  Created by mac on 2017/8/3.
//  Copyright © 2017年 mac. All rights reserved.
//

// 创建天气块
#import "ZLMonitorView.h"
#import "ZLHomeBottomModel.h"
@interface ZLMonitorView ()

@property (nonatomic, strong) UIImageView *progressImageV;

@property (nonatomic, strong) UILabel *weatherLabel;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) ZLHomeBottomModel *bottomModel;

@end
@implementation ZLMonitorView
- (instancetype)initWithFrame:(CGRect)frame model:(ZLHomeBottomModel *)model{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor whiteColor];
        self.bottomModel = model;
        [self setupUI];
        
    }
    return self;
    
}
// 设置UI界面
- (void)setupUI{
    
    UIView *weatherView = [[UIView alloc]init];
    [self addSubview:weatherView];
    [weatherView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(self);
        make.right.equalTo(self.mas_right);
        make.top.equalTo(self);
        make.height.mas_equalTo(AdaptedHeight(70));
        
    }];
    
    
    self.weatherLabel = [[UILabel alloc]init];
    self.weatherLabel.text = self.bottomModel.weathValue;
    self.weatherLabel.font = AdaptedFontSize(60);
    self.weatherLabel.textColor = HEXCOLOR(0x010101);
    [weatherView addSubview:self.weatherLabel];
    
    [self.weatherLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(weatherView);
        make.left.equalTo(weatherView).offset(0);
        make.width.mas_equalTo(AdaptedWidth(75));
        make.bottom.equalTo(weatherView.mas_bottom);
        
    }];
    
    UILabel *duLabel  = [[UILabel alloc]init];
    duLabel.text = self.bottomModel.symbol;
    duLabel.font = AdaptedFontSize(22);
    duLabel.textColor = HEXCOLOR(0xAEB1B2);
    [weatherView addSubview:duLabel];
    
    [duLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.weatherLabel.mas_right).offset(0);
        make.right.equalTo(weatherView.mas_right);
        make.bottom.equalTo(weatherView.mas_bottom).offset(-AdaptedHeight(12));
        make.height.mas_equalTo(AdaptedHeight(20));
        
    }];
    
    self.titleLabel = [[UILabel alloc]init];
    self.titleLabel.text = self.bottomModel.title;
    self.titleLabel.font = AdaptedFontSize(23);
    self.titleLabel.textColor = HEXCOLOR(0xAEB1B2);
//    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [weatherView addSubview:self.titleLabel];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(weatherView.mas_bottom).offset(AdaptedHeight(28));
        make.left.equalTo(weatherView).offset(AdaptedWidth(14));
        make.width.mas_equalTo(AdaptedWidth(48));
        make.height.mas_equalTo(AdaptedHeight(25));
        
    }];

    self.progressImageV = [[UIImageView alloc]init];
    [self.progressImageV setBackgroundColor: self.bottomModel.hexColor];
    self.progressImageV.layer.cornerRadius = 2;
    self.progressImageV.clipsToBounds = YES;
    [self addSubview:self.progressImageV];
    [self.progressImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.titleLabel.mas_bottom).offset(AdaptedHeight(32));
        make.centerX.equalTo(self.titleLabel);
        make.height.mas_equalTo(AdaptedHeight(8));
        make.width.mas_equalTo(AdaptedWidth(60));
        
    }];
}

- (void)setModel:(ZLHomeBottomModel *)model{
    
}


@end
