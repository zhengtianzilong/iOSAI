//
//  ZLVoiceRecordBtn.h
//  AIProduct
//
//  Created by mac on 2017/8/18.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol VoiceReordingDelegate <NSObject>
    
    - (void)prepareRecordingVoiceAction;
    /**
     *  开始录音
     */
    - (void)didStartRecordingVoiceAction;
    /**
     *  手指向上滑动取消录音
     */
    - (void)didCancelRecordingVoiceAction;
    /**
     *  松开手指完成录音
     */
    - (void)didFinishRecoingVoiceAction;
    /**
     *  当手指离开按钮的范围内时
     */
    - (void)didDragOutsideAction;
    /**
     *  当手指再次进入按钮的范围内时
     */
    - (void)didDragInsideAction;
    
@end


@interface ZLVoiceRecordBtn : UIButton
@property(nonatomic,weak) id<VoiceReordingDelegate> voiceRecoderDelegate;

@property(nonatomic,assign)float peakPower;

@end
