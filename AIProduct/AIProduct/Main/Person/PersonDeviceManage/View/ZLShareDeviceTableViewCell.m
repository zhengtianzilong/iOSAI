//
//  ZLShareDeviceTableViewCell.m
//  AIProduct
//
//  Created by mac on 2017/8/14.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ZLShareDeviceTableViewCell.h"
#import "MMAlertView.h"

@interface ZLShareDeviceTableViewCell ()
@property (nonatomic, strong) MMAlertView *alertView;
@end


@implementation ZLShareDeviceTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setUpUI];
        [self configAlertView];
    }
    return  self;
}

- (void)setUpUI{
    self.titleLabel = [[UILabel alloc]init];
    self.titleLabel.text = @"804C机器人";
    self.titleLabel.font = AdaptedFontSize(32);
    self.titleLabel.textColor = HEXCOLOR(0x191919);
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(self.contentView).offset(AdaptedWidth(32));
        make.centerY.equalTo(self.contentView);
        make.height.mas_equalTo(AdaptedHeight(50));
        
    }];

    self.shareButton = [[UIButton alloc]init];
    self.shareButton.titleLabel.font = AdaptedFontSize(26);
    [self.shareButton setTitle:@"共享邀请" forState:(UIControlStateNormal)];
    [self.shareButton setTitleColor:HEXCOLOR(0xFBFCFC) forState:(UIControlStateNormal)];
    [self.shareButton setBackgroundColor:HEXCOLOR(0x34D4FA)];
    self.shareButton.layer.cornerRadius = 3;
    self.shareButton.clipsToBounds = YES;
    
    [self.shareButton addTarget:self action:@selector(shareButtonClick) forControlEvents:(UIControlEventTouchUpInside)];
    
    [self.contentView addSubview:self.shareButton];
    [self.shareButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(self.contentView.mas_right).offset(-AdaptedWidth(32));
        make.centerY.equalTo(self.contentView);
        make.height.mas_equalTo(AdaptedHeight(48));
        make.width.mas_equalTo(AdaptedWidth(128));
        
    }];
    
    self.switchBtn = [[UISwitch alloc]init];
    self.switchBtn.onTintColor = HEXCOLOR(KText_color_blue);
    self.switchBtn.on = YES;
    [self.contentView addSubview:self.switchBtn];
    self.switchBtn.hidden = YES;
    [self.switchBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.right.equalTo(self.contentView.mas_right).offset(-AdaptedWidth(32));
        make.centerY.equalTo(self.contentView);

        
    }];

}

- (void)shareButtonClick{
    
    MMPopupCompletionBlock completionBlock = ^(MMPopupView *popupView,BOOL finished){

    };
    
    MMPopupItemHandler block = ^(NSInteger index){
        
    };
    
    NSArray *items =@[
                      MMItemMake(@"取消", MMItemTypeNormal, block),
                      MMItemMake(@"确定", MMItemTypeHighlight, block)
                      ];
    self.alertView = [[MMAlertView alloc]initWithTitle:@"共享邀请" detail:nil items:items inputPlaceholder:@"请输入共享人账号/手机号" inputHandler:^(NSString *text) {
        if (text.length > 0) {
            self.shareButton.hidden = YES;
            self.switchBtn.hidden = NO;
            
        }
        
        NSLog(@"%@",text);
        
    }];
    
    self.alertView.attachedView = self.cellview;
    self.alertView.attachedView.mm_dimBackgroundBlurEnabled = NO;
    self.alertView.attachedView.mm_dimBackgroundBlurEffectStyle = UIBlurEffectStyleDark;
    [self.alertView showWithBlock:completionBlock];
    
    
    
}

/**
 配置弹出框
 */
- (void)configAlertView{
    MMAlertViewConfig *alertConfig = [MMAlertViewConfig globalConfig];
    alertConfig.width = AdaptedWidth(476);
    alertConfig.backgroundColor = HEXCOLOR(KStand_bkg_color);
    alertConfig.titleColor = HEXCOLOR(0x191919);
    alertConfig.detailColor = HEXCOLOR(0x191919);
    alertConfig.itemHighlightColor = HEXCOLOR(0x11ccf9);
    alertConfig.itemNormalColor = HEXCOLOR(0x191919);
    alertConfig.splitColor = HEXCOLORAndAlpha(0x11ccf9, 0.2);
    alertConfig.itemPressedColor = HEXCOLOR(KStand_bkg_color);
    alertConfig.innerMargin = 10;
    alertConfig.textFieldTextColor = HEXCOLOR(0x11ccf9);
}



@end
