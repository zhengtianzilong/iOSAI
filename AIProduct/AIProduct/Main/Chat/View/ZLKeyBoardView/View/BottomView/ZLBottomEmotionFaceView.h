//
//  ZLBottomEmotionFaceView.h
//  AIProduct
//
//  Created by mac on 2017/8/18.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZLKeyBoardHeader.h"
#import "ZLEmotionFaceToolBar.h"
#import "ZLEmotionBoardView.h"
#import "ZLEmotionViewDelegate.h"
@interface ZLBottomEmotionFaceView : UIView
@property(nonatomic,weak) id <ZLEmotionViewDelegate>  emotionViewDelegate;
@end
