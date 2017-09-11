//
//  ZLKeyBoardView.m
//  AIProduct
//
//  Created by mac on 2017/8/18.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ZLKeyBoardView.h"
#define KeyBoardSystemMargin 3
@interface ZLKeyBoardView ()<VoiceReordingDelegate,TextInputDelegate,ZLBottomMoreDelegate,ZLEmotionViewDelegate>
@property(nonatomic,strong) ZLKeyBoardToolBarView *toolBarView;
@property(nonatomic,strong) ZLKeyBoardBottomActivityView *bottomActivityView;

@property(nonatomic,strong) ZLBottomMoreView *bottomMoreView;
@property(nonatomic,strong) ZLBottomEmotionFaceView *emotionView;
@property(nonatomic,assign) CGFloat keyBoardHeight;
@end

@implementation ZLKeyBoardView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.frame = CGRectMake(0, SCREEN_HEIGHT-KeyToolBarHeight, SCREEN_WIDTH, KeyToolBarHeight);
        
        [self setUpUI];
        
        
        self.backgroundColor = [UIColor greenColor];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textViewHeightChange:) name:KTextViewHeightChangeNotification object:nil];
        
        
        
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyBoardFrameChange:) name:UIKeyboardWillChangeFrameNotification object:nil];
        
    }
    return self;
}

- (void)keyBoardFrameChange:(NSNotification *)notify
{
    CGRect keyBoradRect = [notify.userInfo[UIKeyboardBoundsUserInfoKey] CGRectValue];
    
    self.keyBoardHeight = CGRectGetHeight(keyBoradRect);
}


- (void)setUpUI
{
    
    self.toolBarView = [[ZLKeyBoardToolBarView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, KeyToolBarHeight)];
    self.toolBarView.voiceRecoderDelegate = self;
    
    self.toolBarView.textInputDelegate = self;
    
    [self addSubview:self.toolBarView];
    
    
    
    //自定义键盘高度变化事件：
    
    __weak typeof(self) weakSelf = self;
    [self.toolBarView setKeyBoardFrameChange:^(NSInteger index,BOOL isInput) {
        
        __block  CGRect rect = weakSelf.frame;
        
        
        
        if (index == KeyBoardTypeSystem) {
            
            
            rect.origin.y = SCREEN_HEIGHT-KeyToolBarHeight-self.keyBoardHeight-KeyBoardSystemMargin;
            
            
        }
        
        else
        {
            [weakSelf.bottomActivityView.subviews makeObjectsPerformSelector:@selector( removeFromSuperview)];
            switch (index) {
                    
                case 0:
                    weakSelf.height = KeyToolBarHeight;
                    rect = self.frame;
                    isInput ?(rect.origin.y = SCREEN_HEIGHT-KeyToolBarHeight-self.keyBoardHeight-KeyBoardSystemMargin):(rect.origin.y = SCREEN_HEIGHT-KeyToolBarHeight);
                    
                    break;
                case 1:
                    
                    //改变键盘高度:250
                    weakSelf.height = 250;
                    
                    //用作键盘弹上动画
                    rect = self.frame;
                    //改变底部activityView的尺寸:在layoutsubview中写就不用重复设置
                    weakSelf.bottomActivityView.height = 250-KeyToolBarHeight;
                    
                    isInput ? (rect.origin.y = SCREEN_HEIGHT-KeyToolBarHeight-self.keyBoardHeight-KeyBoardSystemMargin):(rect.origin.y = SCREEN_HEIGHT-250);
                    [weakSelf.bottomActivityView addSubview:weakSelf.emotionView];
                    
                    break;
                    
                case 2:
                    //改变键盘高度:280
                    weakSelf.height = 280;
                    rect = self.frame;
                    weakSelf.bottomActivityView.height = 280-KeyToolBarHeight;
                    
                    
                    isInput ? (rect.origin.y = SCREEN_HEIGHT-KeyToolBarHeight-self.keyBoardHeight-KeyBoardSystemMargin):(rect.origin.y = SCREEN_HEIGHT-280);
                    
                    
                    [weakSelf.bottomActivityView addSubview:weakSelf.bottomMoreView];
                    
                    break;
                    
                    
                default:
                    break;
            }
        }
        
        
        
        weakSelf.keyBoardDetalChange =  SCREEN_HEIGHT - CGRectGetMinY(rect);
        
        [UIView animateWithDuration:0.3 animations:^{
            
            weakSelf.frame = rect;
            
        }];
        
    }];
    
    
    self.bottomActivityView = [[ZLKeyBoardBottomActivityView alloc]initWithFrame:CGRectMake(0, CGRectGetHeight(self.toolBarView.frame), SCREEN_WIDTH, self.height-CGRectGetHeight(self.toolBarView.frame))];
    [self addSubview:self.bottomActivityView];
    
}







//从外界触发键盘的隐藏
- (void)setHideKeyBoard:(BOOL)hideKeyBoard
{
    _hideKeyBoard = hideKeyBoard;
    [self endEditing:YES];
    
    if (self.toolBarView.switchBtn.selected) {
        return;
    }
    self.toolBarView.switchBtn.selected = NO;
    self.toolBarView.emoijBtn.selected = NO;
    self.toolBarView.moreBtn.selected = NO;
    
    [UIView animateWithDuration:0.3 animations:^{
        
        self.top = SCREEN_HEIGHT-KeyToolBarHeight;
    }];
    
//    self.keyBoardDetalChange = 0;
    
}




#pragma mark --- textSendDelegate
- (void)sendTextMessage:(NSString *)text
{
    if (!text.length) {
        return;
    }
    
    
    if (_textInputDelegate && [_textInputDelegate respondsToSelector:@selector(sendTextMessage:)]) {
        [self.textInputDelegate sendTextMessage:text];
    }
}






#pragma mark --- moreViewDelegate
- (void)moreViewClick:(MoreViewType)type
{
    if (_moreViewDelegate && [_moreViewDelegate respondsToSelector:@selector(moreViewClick:)]) {
        
        [_moreViewDelegate moreViewClick:type];
    }
}

#pragma mark --- emoijViewDelegate
- (void)addEmoij:(NSString *)emoij isDeleteLastEmoij:(BOOL)isDeleteLastEmoij
{
    
    if (isDeleteLastEmoij) {
        NSMutableString *text = [self.toolBarView.textView.text mutableCopy];
        
        //无输入，不删除
        if (!text.length) {
            return;
        }
        
        if (text.length>=2) {
            [text deleteCharactersInRange:NSMakeRange(text.length-2, 2)];
        }
        self.toolBarView.textView.text = text;
        
        //无emoij了，置空，显示placeHolder
        if (self.toolBarView.textView.text.length == 0) {
            self.toolBarView.textView.text = nil;
        }
    }
    else
    {
        self.toolBarView.textView.text = [self.toolBarView.textView.text stringByAppendingString:emoij];
    }
    
    
#pragma mark --- 这里编码转化出来的emoij非字符串，不会实现textView代理方法，需要手动调用
    [self.toolBarView textViewDidChange:self.toolBarView.textView];
    
}

- (void)sendEmoijMessage:(NSString *)text
{
    
    
    if (!self.toolBarView.textView.text.length) {
        return;
    }
    
    if (_emoijViewDelegate && [_emoijViewDelegate respondsToSelector:@selector(sendEmoijMessage:)]) {
        [self.emoijViewDelegate sendEmoijMessage:self.toolBarView.textView.text];
    }
    
    [self.toolBarView setToolBarToNormalState];
}



//发送非emoij图片
- (void)sendEmotionImage:(NSString *)localPath emotionType:(EmotionType)emotionType
{
    if (_emoijViewDelegate && [_emoijViewDelegate respondsToSelector:@selector(sendEmotionImage:emotionType:)])
    {
        
        [self.emoijViewDelegate sendEmotionImage:localPath emotionType:emotionType];;
    }
}





#pragma mark --- voiceRecoderDelegate


//录音，正向传值
- (void)setPeakPower:(float)peakPower
{
    _peakPower = peakPower;
    self.toolBarView.peakPower = peakPower;
}

- (void)prepareRecordingVoiceAction
{
    if (_voiceRecoderDelegate && [_voiceRecoderDelegate respondsToSelector:@selector(prepareRecordingVoiceAction)]) {
        [self.voiceRecoderDelegate prepareRecordingVoiceAction];
    }
}

- (void)didStartRecordingVoiceAction
{
    if (_voiceRecoderDelegate && [_voiceRecoderDelegate respondsToSelector:@selector(didStartRecordingVoiceAction)]) {
        [_voiceRecoderDelegate didStartRecordingVoiceAction];
    }
}



- (void)didCancelRecordingVoiceAction
{
    if (_voiceRecoderDelegate && [_voiceRecoderDelegate respondsToSelector:@selector(didCancelRecordingVoiceAction)])
    {
        [_voiceRecoderDelegate didCancelRecordingVoiceAction];
    }
}

- (void)didFinishRecoingVoiceAction
{
    if (_voiceRecoderDelegate && [_voiceRecoderDelegate respondsToSelector:@selector(didFinishRecoingVoiceAction)])
    {
        [_voiceRecoderDelegate didFinishRecoingVoiceAction];
    }
}



- (void)didDragOutsideAction
{
    
    if ([_voiceRecoderDelegate respondsToSelector:@selector(didDragOutsideAction)])
    {
        [_voiceRecoderDelegate didDragOutsideAction];
    }
}

- (void)didDragInsideAction
{
    
    if ([_voiceRecoderDelegate respondsToSelector:@selector(didDragInsideAction)])
    {
        [_voiceRecoderDelegate didDragInsideAction];
    }
}




//加个通知来监听实时textView行高变化：
- (void)textViewHeightChange:(NSNotification *)notify
{
    self.keyBoardDetalChange = SCREEN_HEIGHT-self.top+[notify.object floatValue];
}


//LazyLoading
- (ZLBottomMoreView *)bottomMoreView
{
    if (!_bottomMoreView) {
        _bottomMoreView = [[ZLBottomMoreView alloc]initWithFrame:self.bottomActivityView.bounds];
        _bottomMoreView.moreViewDelegate = self;
    }
    
    return _bottomMoreView;
}


- (ZLBottomEmotionFaceView*)emotionView
{
    if (!_emotionView) {
        _emotionView = [[ZLBottomEmotionFaceView alloc]initWithFrame:self.bottomActivityView.bounds];
        _emotionView.emotionViewDelegate = self;
    }
    
    return _emotionView;
}


- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self forKeyPath:KTextViewHeightChangeNotification];
}


@end
