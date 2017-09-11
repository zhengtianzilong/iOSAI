//
//  ZLVoiceRecordBtn.m
//  AIProduct
//
//  Created by mac on 2017/8/18.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ZLVoiceRecordBtn.h"
#import "ZLRecordingHub.h"
#import "ZLKeyBoardHelpDefine.h"

@interface ZLVoiceRecordBtn ()

@property(nonatomic,strong) ZLRecordingHub *recordHub;

@end

@implementation ZLVoiceRecordBtn

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        [self addTarget:self action:@selector(recordButtonTouchDown) forControlEvents:UIControlEventTouchDown];
        [self addTarget:self action:@selector(recordButtonTouchUpOutside) forControlEvents:UIControlEventTouchUpOutside];
        [self addTarget:self action:@selector(recordButtonTouchUpInside) forControlEvents:UIControlEventTouchUpInside];
        [self addTarget:self action:@selector(recordDragOutside) forControlEvents:UIControlEventTouchDragExit];
        [self addTarget:self action:@selector(recordDragInside) forControlEvents:UIControlEventTouchDragEnter];
        
        
        [self setTitle:@"按住说话" forState:UIControlStateNormal];
        [self setTitle:@"松开发送" forState:UIControlStateHighlighted];
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        
        
        
        self.recordHub = [[ZLRecordingHub alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-60, SCREEN_HEIGHT/2-60, 120, 120)];
        
        
    }
    return self;
}

- (void)setPeakPower:(float)peakPower
{
    _peakPower = peakPower;
    self.recordHub.peakPower = peakPower;
}



- (void)recordButtonTouchDown
{
    
    if (_voiceRecoderDelegate && [_voiceRecoderDelegate respondsToSelector:@selector(prepareRecordingVoiceAction)]) {
        [_voiceRecoderDelegate prepareRecordingVoiceAction];
    }
    
    if (_voiceRecoderDelegate && [_voiceRecoderDelegate respondsToSelector:@selector(didStartRecordingVoiceAction)]) {
        [_voiceRecoderDelegate didStartRecordingVoiceAction];
    }
    
    [self.recordHub recordButtonTouchDown];
    
}




- (void)recordButtonTouchUpOutside
{
    if (_voiceRecoderDelegate && [_voiceRecoderDelegate respondsToSelector:@selector(didCancelRecordingVoiceAction)])
    {
        [_voiceRecoderDelegate didCancelRecordingVoiceAction];
    }
    
    [self.recordHub recordButtonTouchUpOutside];
    
    
    
}

- (void)recordButtonTouchUpInside
{
    
    if ([_voiceRecoderDelegate respondsToSelector:@selector(didFinishRecoingVoiceAction)])
    {
        [_voiceRecoderDelegate didFinishRecoingVoiceAction];
    }
    
    [self.recordHub recordButtonTouchUpInside];
    
    [self.recordHub removeFromSuperview];
}

- (void)recordDragOutside
{
    
    [self.recordHub recordButtonDragOutside];
    if ([_voiceRecoderDelegate respondsToSelector:@selector(didDragOutsideAction)])
    {
        [_voiceRecoderDelegate didDragOutsideAction];
    }
}

- (void)recordDragInside
{
    
    [self.recordHub recordButtonDragInside];
    
    if ([_voiceRecoderDelegate respondsToSelector:@selector(didDragInsideAction)])
    {
        [_voiceRecoderDelegate didDragInsideAction];
    }
}





@end
