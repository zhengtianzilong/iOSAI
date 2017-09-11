//
//  ZLFamailManageViewTableViewCell.m
//  AIProduct
//
//  Created by mac on 2017/8/14.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ZLFamailManageViewTableViewCell.h"

@implementation ZLFamailManageViewTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setUpUI];
        
    }
    return self;
    
}

- (void)setUpUI{
    self.userImageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"my_header"]];
    [self.contentView addSubview:self.userImageV];
    [self.userImageV mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.contentView).offset(AdaptedWidth(38));
        make.height.mas_equalTo(AdaptedHeight(106));
        make.width.mas_equalTo(AdaptedWidth(106));
        
    }];
    
    self.indicatorImageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"my_next"]];
    [self.contentView addSubview:self.indicatorImageV];
    [self.indicatorImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(self.contentView);
        make.right.equalTo(self.contentView.mas_right).offset(-AdaptedWidth(76));
        
    }];
    
    self.nameLabel = [[UILabel alloc]init];
    self.nameLabel.textColor = HEXCOLOR(0x11ccF9);
    self.nameLabel.font = AdaptedFontSize(34);
//    self.nameLabel.text = @"李秀秀";

    [self.contentView addSubview:self.nameLabel];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.contentView.mas_top).offset(AdaptedHeight(58));
        make.left.equalTo(self.userImageV.mas_right).offset(AdaptedWidth(43));
        make.height.mas_equalTo(AdaptedHeight(34));
//        make.width.mas_equalTo(10);
        
    }];
    
    self.idLabel = [[UILabel alloc]init];
    self.idLabel.textColor = HEXCOLOR(0x11ccF9);
    self.idLabel.alpha = 0.5;
    self.idLabel.font = AdaptedFontSize(24);
//    self.idLabel.text = @"id:151456789378979878";
    [self.contentView addSubview:self.idLabel];
    [self.idLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.nameLabel.mas_bottom).offset(AdaptedHeight(20));
        make.left.equalTo(self.nameLabel);
        make.height.mas_equalTo(AdaptedHeight(24));
//        make.width.mas_equalTo(60);
        
    }];
}

- (void)setFamilyModel:(ZLFamilyManagerModel *)familyModel{
    _familyModel = familyModel;
    _nameLabel.text = familyModel.name;
    _idLabel.text = familyModel.idString;
    
    
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.userImageV.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:self.userImageV.bounds.size];
    
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
    //设置大小
    maskLayer.frame = self.userImageV.bounds;
    //设置图形样子
    maskLayer.path = maskPath.CGPath;
    self.userImageV.layer.mask = maskLayer;
}

@end
