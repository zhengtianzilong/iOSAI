//
//  ZLKeyBoardView.h
//  AIProduct
//
//  Created by mac on 2017/8/18.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZLBottomMoreView.h"
#import "ZLKeyBoardHeader.h"
#import "ZLKeyBoardToolBarView.h"
#import "ZLKeyBoardBottomActivityView.h"
#import "ZLBottomEmotionFaceView.h"
#import "ZLEmotionViewDelegate.h"


@protocol  ZLBottomMoreDelegate;

@interface ZLKeyBoardView : UIView


@property(nonatomic,weak) id<VoiceReordingDelegate> voiceRecoderDelegate;

@property(nonatomic,assign)float peakPower;

@property(nonatomic,weak) id<ZLBottomMoreDelegate> moreViewDelegate;

@property(nonatomic,weak) id<TextInputDelegate> textInputDelegate;

@property(nonatomic,weak) id<ZLEmotionViewDelegate> emoijViewDelegate;




@property(nonatomic,assign) BOOL hideKeyBoard;

//键盘变化
@property(nonatomic,assign) CGFloat keyBoardDetalChange;

@end
