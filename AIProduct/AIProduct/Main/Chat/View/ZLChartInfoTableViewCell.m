//
//  ZLChartInfoTableViewCell.m
//  AIProduct
//
//  Created by mac on 2017/8/16.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ZLChartInfoTableViewCell.h"

@interface ZLChartInfoTableViewCell ()

@property (nonatomic, strong) UIImageView *headimageV;

@property (nonatomic, strong) UIButton *stateButton;

@property (nonatomic, strong) UILabel *userNameLael;

@property (nonatomic, strong) UILabel *detailLabel;
@end

@implementation ZLChartInfoTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setUpUI];
        
        self.layer.shadowColor = HEXCOLOR(KShadow_color_blue).CGColor;
        self.layer.shadowOffset = CGSizeMake(0, 3);
        
        self.layer.shadowOpacity = 0.17;
        // 必须为no,不然出不来阴影
        self.layer.masksToBounds = NO;
        
    }
    return self;
}

- (void)setUpUI{
    
    _headimageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"chat_robotpic"]];
    [self.contentView addSubview:_headimageV];
    [_headimageV mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(self.contentView).offset(AdaptedWidth(28));
        make.top.equalTo(self.contentView).offset(AdaptedHeight(24));
        make.bottom.equalTo(self.contentView.mas_bottom).offset(AdaptedHeight(-31));
        
    }];
    
    
    _userNameLael = [[UILabel alloc]init];
    [self.contentView addSubview:_userNameLael];
//    _userNameLael.text = @"小智家";
    _userNameLael.font = AdaptedFontSize(28);
    [_userNameLael setTextColor:HEXCOLOR(0x191919)];
    [_userNameLael mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(_headimageV.mas_right).offset(AdaptedWidth(24));
        make.top.equalTo(self.contentView).offset(AdaptedHeight(24));
//        make.bottom.equalTo(self.contentView.mas_bottom).offset(AdaptedHeight(-31));
        
    }];
    
    _stateButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [_stateButton setTitle:@"在线" forState:(UIControlStateNormal)];
    _stateButton.titleLabel.font = AdaptedFontSize(16);
    [_stateButton setTitleColor:HEXCOLOR(0x11ccf9) forState:(UIControlStateNormal)];
    _stateButton.layer.borderWidth = 1;
    _stateButton.layer.borderColor = HEXCOLOR(0x11ccf9).CGColor;
    _stateButton.layer.cornerRadius = 2;
    _stateButton.layer.masksToBounds = YES;
    [self.contentView addSubview:_stateButton];
    [_stateButton mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(_userNameLael.mas_right).offset(AdaptedWidth(12));
        make.centerY.equalTo(_userNameLael);
        make.width.mas_equalTo(AdaptedWidth(42));
        make.height.mas_equalTo(AdaptedHeight(20));
        
    }];
    
    
    _detailLabel = [[UILabel alloc]init];
    [self.contentView addSubview:_detailLabel];
    _detailLabel.font = AdaptedFontSize(20);
//    _detailLabel.text = @"今天天气很热,提醒服务多喝水哦,记得通风...";
    [_detailLabel setTextColor:HEXCOLOR(0xa5a5a5)];
    [_detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(_headimageV.mas_right).offset(AdaptedWidth(24));
        make.top.equalTo(_userNameLael.mas_bottom).offset(0);
        //        make.bottom.equalTo(self.contentView.mas_bottom).offset(AdaptedHeight(-31));
        
    }];
    
}
- (void)setPersonModel:(ZLVideoPersonModel *)personModel{
    _personModel = personModel;
    
    _userNameLael.text = personModel.name;
    _detailLabel.text = personModel.detailTitle;
    
}
@end
