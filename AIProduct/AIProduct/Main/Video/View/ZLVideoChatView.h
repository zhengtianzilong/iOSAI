//
//  ZLVideoChatView.h
//  AIProduct
//
//  Created by mac on 2017/8/21.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZLControlVideoView.h"
#import "ZLAddVideoChatView.h"
@interface ZLVideoChatView : UIView
// 提示文字
@property (nonatomic, strong) UILabel *tipsLabel;

@property (nonatomic, strong) UIImageView *bgimageV;

// 取消按钮
@property (nonatomic, strong)UIButton *cancelBtn;

// 静音按钮
@property (nonatomic, strong)UIButton *microphoneBtn;

// 声音按钮
@property (nonatomic, strong)UIButton *voiceBtn;

// 添加按钮
@property (nonatomic, strong)UIButton *addBtn;

// 录像按钮
@property (nonatomic, strong)UIButton *recodBtn;

// 镜头转换按钮
@property (nonatomic, strong)UIButton *cameraBtn;

// 操控按钮
@property (nonatomic, strong)ZLControlVideoView *controlVideoView;

@property (nonatomic, strong) ZLAddVideoChatView *addVideoView;
@end
