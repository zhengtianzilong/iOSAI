//
//  ZLKeyBoardToolBarView.h
//  AIProduct
//
//  Created by mac on 2017/8/18.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZLKeyBoardHelpDefine.h"
#import "ZLMessageInputView.h"
#import "ZLVoiceRecordBtn.h"
#import "NSBundle+ZLKeyBoardExtension.h"
#import "ZLKeyBoardHeader.h"
@interface ZLKeyBoardToolBarView : UIView

//voiceRecoder
@property(nonatomic,weak) id<VoiceReordingDelegate> voiceRecoderDelegate;

@property(nonatomic,assign)float peakPower;


//inputText
@property(nonatomic,weak) id<TextInputDelegate> textInputDelegate;

/**
 *  @brief textHeightDetal 文本多行高度变化增量，调整外部keyBoard高度：该参数只用于index = -1时候
 */
@property(nonatomic,copy) void(^keyBoardFrameChange)(NSInteger index,BOOL isInput);





@property(nonatomic,strong) UIButton *switchBtn;
@property(nonatomic,strong) ZLVoiceRecordBtn *recordBtn;

@property(nonatomic,strong) UIButton *emoijBtn;
@property(nonatomic,strong) ZLMessageInputView *textView;
@property(nonatomic,strong) UIButton *moreBtn;



//Public：emoij表情输入时公开调用
- (void)textViewDidChange:(UITextView *)textView;


//public:emoij消息发送也需要:
/**
 *  @brief 将toolBar设置成44的默认高度状态
 */
- (void)setToolBarToNormalState;

@end
