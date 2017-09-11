//
//  ZLPersonListTableViewCell.m
//  AIProduct
//
//  Created by mac on 2017/8/22.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ZLPersonListTableViewCell.h"

@implementation ZLPersonListTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUpUI];
        
    }
    return self;

}

- (void)setUpUI{
    
    _selectButton = [[UIButton alloc]init];
    [_selectButton setImage:[UIImage imageNamed:@"video_select"] forState:(UIControlStateNormal)];
    [_selectButton setImage:[UIImage imageNamed:@"video_select_hover"] forState:(UIControlStateSelected)];
    
    [_selectButton addTarget:self action:@selector(selectBtnClick) forControlEvents:(UIControlEventTouchUpInside)];
    
    [self addSubview:_selectButton];
    [_selectButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.contentView).offset(AdaptedWidth(30));
        make.top.equalTo(self.contentView).offset(AdaptedHeight(40));

    }];
    
    _headImageV = [[UIImageView alloc]init];
    [_headImageV setImage:[UIImage imageNamed:@"video_contact"]];
    [self addSubview:_headImageV];
    [_headImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(_selectButton.mas_right).offset(AdaptedWidth(34));
        make.top.equalTo(self.contentView).offset(AdaptedHeight(24));
        
    }];
    
    _nameLabel = [[UILabel alloc]init];
//    _nameLabel.text = @"阿姨萍";
    _nameLabel.font = AdaptedFontSize(28);
    _nameLabel.textColor = HEXCOLOR(0x191919);
    [self addSubview:_nameLabel];
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(_headImageV.mas_right).offset(AdaptedWidth(26));
        make.top.equalTo(self.contentView).offset(AdaptedHeight(24));
        
    }];
    
    _statusBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
//    [_statusBtn setTitle:@"在线" forState:(UIControlStateNormal)];
    _statusBtn.titleLabel.font = AdaptedFontSize(16);
//    [_statusBtn setTitleColor:HEXCOLOR(0x11ccf9) forState:(UIControlStateNormal)];
    _statusBtn.layer.borderWidth = 1;
//    _statusBtn.layer.borderColor = HEXCOLOR(0x11ccf9).CGColor;
    _statusBtn.layer.cornerRadius = 2;
    _statusBtn.layer.masksToBounds = YES;
    _statusBtn.adjustsImageWhenHighlighted = NO;
    [self.contentView addSubview:_statusBtn];
    [_statusBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(_nameLabel);
        make.top.equalTo(_nameLabel.mas_bottom).offset(AdaptedHeight(17));
        make.width.mas_equalTo(AdaptedWidth(42));
        make.height.mas_equalTo(AdaptedHeight(20));
        
    }];
    
    _deviceShareBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [_deviceShareBtn setTitle:@"设备共享" forState:(UIControlStateNormal)];
    _deviceShareBtn.titleLabel.font = AdaptedFontSize(16);
    [_deviceShareBtn setTitleColor:HEXCOLOR(0x11ccf9) forState:(UIControlStateNormal)];
    _deviceShareBtn.layer.borderWidth = 1;
    _deviceShareBtn.layer.borderColor = HEXCOLOR(0x11ccf9).CGColor;
    _deviceShareBtn.layer.cornerRadius = 2;
    _deviceShareBtn.layer.masksToBounds = YES;
    [self.contentView addSubview:_deviceShareBtn];
    [_deviceShareBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(_statusBtn.mas_right).offset(AdaptedWidth(8));
        make.top.equalTo(_nameLabel.mas_bottom).offset(AdaptedHeight(17));
        make.width.mas_equalTo(AdaptedWidth(80));
        make.height.mas_equalTo(AdaptedHeight(20));
        
    }];
    
}

- (void)setPersonModel:(ZLPersonListModel *)personModel{
    _personModel = personModel;
    _nameLabel.text = personModel.name;
    
    _deviceShareBtn.hidden = !personModel.isShareButton;
    
    if (personModel.isStatus) {
        [_statusBtn setTitle:@"在线" forState:(UIControlStateNormal)];
        [_statusBtn setTitleColor:HEXCOLOR(0x11ccf9) forState:(UIControlStateNormal)];
        _statusBtn.backgroundColor = [UIColor whiteColor];
        _statusBtn.layer.borderColor = HEXCOLOR(0x11ccf9).CGColor;
    }else{
        [_statusBtn setTitle:@"离线" forState:(UIControlStateNormal)];
        [_statusBtn setTitleColor:HEXCOLOR(0xffffff) forState:(UIControlStateNormal)];
        _statusBtn.backgroundColor = HEXCOLOR(0xbfbfbf);
        _statusBtn.layer.borderColor = HEXCOLOR(0xbfbfbf).CGColor;
    }
    
    _selectButton.selected = _personModel.isSelected;
    
    
    
}

- (void)selectBtnClick{
    
    _selectButton.selected = !_selectButton.selected;
    
    _personModel.isSelected = _selectButton.isSelected;
    
    
}

@end
