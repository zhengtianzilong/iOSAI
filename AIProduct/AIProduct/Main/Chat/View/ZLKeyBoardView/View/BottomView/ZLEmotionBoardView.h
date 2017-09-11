//
//  ZLEmotionBoardView.h
//  AIProduct
//
//  Created by mac on 2017/8/18.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZLKeyBoardHeader.h"
#import "Emoji.h"
#import "ZLEmotionViewDelegate.h"
#import "FLAnimatedImageView.h"
#import "FLAnimatedImage.h"
@interface ZLEmotionBoardView : UIView

+ (instancetype)faceBoardView:(NSInteger)type scrollView:(UIScrollView *)scrollView frame:(CGRect)frame;


/**
 *  @brief 第一页为emoij，其他页为gif
 */
@property(nonatomic,assign) NSInteger faceType;

//该表情面板有多少页
@property(nonatomic,assign) NSInteger page;

//@property(nonatomic,assign) BOOL isEmoij;
@property(nonatomic,assign) EmotionType emotionType;

@property(nonatomic,weak) id<ZLEmotionViewDelegate> emotionViewDelegate;

@end
