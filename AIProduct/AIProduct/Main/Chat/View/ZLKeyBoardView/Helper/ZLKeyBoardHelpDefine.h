//
//  ZLKeyBoardHelpDefine.h
//  AIProduct
//
//  Created by mac on 2017/8/18.
//  Copyright © 2017年 mac. All rights reserved.
//

#ifndef ZLKeyBoardHelpDefine_h
#define ZLKeyBoardHelpDefine_h

typedef enum  {
    MoreViewTypePhotoAblums,
    MoreViewTypePhotoLocation,
    MoreViewTypeTakePicture,
    MoreViewTypePhoneCall,
    MoreViewTypeVideoCall,
} MoreViewType;


typedef enum  {
    KeyBoardTypeVoiceRecoder,   //录音
    KeyBoardTypeEmoij,          //emoij
    KeyBoardTypeMore,           //更多
    KeyBoardTypeSystem          //系统键盘
}  KeyBoardType;



/**
 Emotion面板表情类型
 */
typedef enum  {
    EmotionTypeEmoij,           //emoij
    EmotionTypeGif,             //gif
    EmotionTypePhoto,           //静态
}  EmotionType;

#define      SCREEN_WIDTH   [UIScreen mainScreen].bounds.size.width
#define      SCREEN_HEIGHT  [UIScreen mainScreen].bounds.size.height

#define KeyToolBarHeight 44

#define KTextViewHeightChangeNotification  @"textViewHeightChangeNotification"

#define kHorizontalPadding 8
#define kVerticalPadding 5

#define KTextHeight 33
#define  KMaxInputViewHeight 140


#define kVoiceRecorderTotalTime 120.0


#define  BundleName @"chatUiResource"

#endif /* ZLKeyBoardHelpDefine_h */
