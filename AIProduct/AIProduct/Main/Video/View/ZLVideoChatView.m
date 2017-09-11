//
//  ZLVideoChatView.m
//  AIProduct
//
//  Created by mac on 2017/8/21.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ZLVideoChatView.h"

@interface ZLVideoChatView ()



@end
@implementation ZLVideoChatView
{
    int i;
}
- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        i = 0;
        
        [self setupUI];
        
        self.backgroundColor = HEXCOLORAndAlpha(0x000000, 0.75);
    }
    return self;
    
}
// 设置UI界面
- (void)setupUI{
    [self setUpTipsLabel];
    
    _bgimageV = [[UIImageView alloc]init];
    _bgimageV.image = [UIImage imageNamed:@"index_image"];
    _bgimageV.userInteractionEnabled = YES;
//    _bgimageV.hidden = YES;
    [self addSubview:_bgimageV];
    [_bgimageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    
    _controlVideoView = [[ZLControlVideoView alloc]init];
//    _controlVideoView.hidden = YES;
    [self addSubview:_controlVideoView];
    [_controlVideoView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(self);
        make.right.equalTo(self.mas_right);
        make.top.equalTo(self);
        make.height.mas_equalTo(AdaptedHeight(925));
        
    }];
    _addVideoView = [[ZLAddVideoChatView alloc]init];
//    _addVideoView.hidden = YES;
    [self addSubview:_addVideoView];
    
    __weak typeof(self) weakSelf = self;
    _addVideoView.changePersonBlock = ^(UIButton *personBtn) {
        
        UIImage *image = personBtn.currentImage;
        [personBtn setImage:weakSelf.bgimageV.image forState:(UIControlStateNormal)];
        weakSelf.bgimageV.image = image;
    };
    
    [_addVideoView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(self).offset(AdaptedWidth(38));
        make.top.equalTo(self).offset(AdaptedHeight(38));
        make.width.mas_equalTo(AdaptedWidth(140));
        make.height.mas_equalTo(AdaptedHeight(190));
        
    }];
    
    
    [self setUpBottomButton];
    
    
}

- (void)setUpTipsLabel{
    _tipsLabel = [[UILabel alloc]init];
    _tipsLabel.text = @"正在等待对方接受邀请";
    _tipsLabel.font = AdaptedFontSize(32);
    _tipsLabel.textColor = [UIColor whiteColor];
    [self addSubview:_tipsLabel];
    [_tipsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self).offset(AdaptedHeight(580));
        make.centerX.equalTo(self);
        
    }];
    
    
    
}


- (void)setUpBottomButton{

    
    _cancelBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [_cancelBtn setImage:[UIImage imageNamed:@"video_endcall"] forState:(UIControlStateNormal)];
    [_cancelBtn setImage:[UIImage imageNamed:@"video_endcall_hover"] forState:(UIControlStateHighlighted)];
    [self addSubview:_cancelBtn];
    
    [_cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self);
        make.bottom.equalTo(self.mas_bottom).offset(-AdaptedHeight(283));
    }];
    
    _microphoneBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [_microphoneBtn setImage:[UIImage imageNamed:@"video_mute"] forState:(UIControlStateNormal)];
    //    _microphoneBtn.hidden = YES;
    [_microphoneBtn setImage:[UIImage imageNamed:@"video_mute_hover"] forState:(UIControlStateHighlighted)];
    [self addSubview:_microphoneBtn];
    
    [_microphoneBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(_cancelBtn.mas_left).offset(-AdaptedWidth(54));
        make.bottom.equalTo(self.mas_bottom).offset(-AdaptedHeight(283));
    }];
    
    
    _voiceBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [_voiceBtn setImage:[UIImage imageNamed:@"video_speak"] forState:(UIControlStateNormal)];
    [_voiceBtn setImage:[UIImage imageNamed:@"video_speak_hover"] forState:(UIControlStateHighlighted)];
//    _voiceBtn.hidden = YES;
    [self addSubview:_voiceBtn];
    
    [_voiceBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(_cancelBtn.mas_right).offset(AdaptedWidth(54));
        make.bottom.equalTo(self.mas_bottom).offset(-AdaptedHeight(283));
    }];
    
    _addBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [_addBtn setImage:[UIImage imageNamed:@"video_add"] forState:(UIControlStateNormal)];
    [_addBtn setImage:[UIImage imageNamed:@"video_add_hover"] forState:(UIControlStateHighlighted)];
//    _addBtn.hidden = YES;
    
    [_addBtn addTarget:self action:@selector(addClick) forControlEvents:(UIControlEventTouchUpInside)];
    
    [self addSubview:_addBtn];
    
    [_addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(_microphoneBtn);
        make.top.equalTo(_microphoneBtn.mas_bottom).offset(AdaptedHeight(58));
    }];
    
    _recodBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [_recodBtn setImage:[UIImage imageNamed:@"Video_videoon"] forState:(UIControlStateNormal)];
    [_recodBtn setImage:[UIImage imageNamed:@"Video_videoon_hover"] forState:(UIControlStateHighlighted)];
//    _recodBtn.hidden = YES;
    [self addSubview:_recodBtn];
    
    [_recodBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self);
        make.top.equalTo(_cancelBtn.mas_bottom).offset(AdaptedHeight(58));
    }];
    
    _cameraBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [_cameraBtn setImage:[UIImage imageNamed:@"video_replace"] forState:(UIControlStateNormal)];
    [_cameraBtn setImage:[UIImage imageNamed:@"video_replace_hover"] forState:(UIControlStateHighlighted)];
//    _cameraBtn.hidden = YES;
    [self addSubview:_cameraBtn];
    
    [_cameraBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(_voiceBtn);
        make.top.equalTo(_voiceBtn.mas_bottom).offset(AdaptedHeight(58));
    }];

}


/**
 点击添加按钮
 */
- (void)addClick{
    i++;
    
    if (i >3) {
        
        return;
        
    }
    
    int margin = (App_Frame_Width - 2 * AdaptedWidth(38) - 4 * _addVideoView.frame.size.width) / 3;
    
    ZLAddVideoChatView *addView = [[ZLAddVideoChatView alloc]init];
    
    addView.symbolImageV.hidden = YES;
    __weak typeof(self) weakSelf = self;
    
    
    addView.changePersonBlock = ^(UIButton *personBtn) {
        
        UIImage *image = personBtn.currentImage;
        [personBtn setImage:weakSelf.bgimageV.image forState:(UIControlStateNormal)];
        weakSelf.bgimageV.image = image;
    };
    [self addSubview:addView];
    
    [addView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(_addVideoView.mas_right).offset(i * margin + (i - 1) * _addVideoView.frame.size.width);
        make.top.equalTo(_addVideoView);
        make.width.equalTo(_addVideoView);
        make.height.equalTo(_addVideoView);
    }];
    
    
}

@end
