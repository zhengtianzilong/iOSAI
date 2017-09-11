//
//  ZLHomeTipsView.m
//  AIProduct
//
//  Created by mac on 2017/8/3.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ZLHomeTipsView.h"
@interface ZLHomeTipsView ()

@property (nonatomic, strong) UIImageView *remindLineImageV;

@property (nonatomic, strong) UILabel *todayLabel;

@property (nonatomic, strong) UILabel *titleLabel;

@end
@implementation ZLHomeTipsView
- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
        
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = 5;
        self.layer.shadowColor = HEXCOLOR(KShadow_color_blue).CGColor;
        self.layer.shadowOffset = CGSizeMake(0, 3);
        self.layer.shadowOpacity = 0.17;
        self.layer.shadowRadius = 0.25;
        self.layer.masksToBounds = false;
    }
    return self;
    
}
// 设置UI界面
- (void)setupUI{
    NSArray *familyNames = [UIFont familyNames];
    for(NSString *familyName in familyNames)
    {
        NSLog(@"%@", familyName);
        NSArray *fontNames = [UIFont fontNamesForFamilyName:familyName];
        for(NSString *fontName in fontNames)
        {
            NSLog(@"\t%@", fontName);
        }  
    }

    self.todayLabel = [[UILabel alloc]init];
    self.todayLabel.text = @"Today";
    self.todayLabel.textColor = HEXCOLOR(0x2FDF95);
    
        self.todayLabel.font = AdaptedFontBoldSize(26);

    
    [self addSubview:self.todayLabel];
    [self.todayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(self).offset(AdaptedWidth(28));
        make.centerY.equalTo(self);
        make.width.mas_equalTo(AdaptedWidth(79));
    }];


    self.remindLineImageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"index_remindline"]];
    [self addSubview:self.remindLineImageV];
    [self.remindLineImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(self);
        make.left.equalTo(self.todayLabel.mas_right).offset(AdaptedWidth(28));
//        make.height.mas_equalTo(55);
        make.width.mas_equalTo(1);
        
    }];
    
    self.titleLabel = [[UILabel alloc]init];
    self.titleLabel.text = @"小智提醒您已经两天没有雨家里聊天了,要多多互动哦~天气炎热,记得提醒父母多喝水,少在室外活动哦";
    self.titleLabel.numberOfLines = 0;
    self.titleLabel.textColor = HEXCOLOR(0x191919);
    self.titleLabel.font = AdaptedFontSize(24);
    [self addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(self);
        make.left.equalTo(self.remindLineImageV.mas_right).offset(AdaptedWidth(20));
        make.right.equalTo(self.mas_right).offset(-AdaptedWidth(28));
        make.height.mas_equalTo(AdaptedHeight(116));
        
    }];
    
   }
@end
