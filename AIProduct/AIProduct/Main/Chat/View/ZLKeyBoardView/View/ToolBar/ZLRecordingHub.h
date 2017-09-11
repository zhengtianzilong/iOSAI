//
//  ZLRecordingHub.h
//  AIProduct
//
//  Created by mac on 2017/8/18.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZLRecordingHub : UIView

// 录音按钮按下
-(void)recordButtonTouchDown;

// 手指在录音按钮内部时离开
-(void)recordButtonTouchUpInside;

// 手指在录音按钮外部时离开
-(void)recordButtonTouchUpOutside;

// 手指移动到录音按钮内部
-(void)recordButtonDragInside;

// 手指移动到录音按钮外部
-(void)recordButtonDragOutside;


@property(nonatomic,assign)float peakPower;

@end
