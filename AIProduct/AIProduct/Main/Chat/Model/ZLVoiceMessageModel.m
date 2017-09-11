//
//  ZLVoiceMessageModel.m
//  AIProduct
//
//  Created by mac on 2017/8/18.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ZLVoiceMessageModel.h"

@implementation ZLVoiceMessageModel

+ (instancetype)VoicePath:(NSString *)voicePath
                 voiceUrl:(NSString *)voiceUrl
            voiceDuration:(NSString *)voiceDuration
                 username:(NSString *)username
                timeStamp:(NSString *)timeStamp
                 isSender:(BOOL)isSender
{
    return  [[self alloc]initWithVoicePath:voicePath voiceUrl:voiceUrl voiceDuration:voiceDuration username:username timeStamp:timeStamp isRead:NO isSender:isSender];
}


+ (instancetype)VoicePath:(NSString *)voicePath
                 voiceUrl:(NSString *)voiceUrl
            voiceDuration:(NSString *)voiceDuration
                 username:(NSString *)username
                timeStamp:(NSString *)timeStamp
                   isRead:(BOOL)isRead
                 isSender:(BOOL)isSender


{
    return  [[self alloc]initWithVoicePath:voicePath voiceUrl:voiceUrl voiceDuration:voiceDuration username:username timeStamp:timeStamp isRead:isRead isSender:isSender];
}




- (instancetype)initWithVoicePath:(NSString *)voicePath
                         voiceUrl:(NSString *)voiceUrl
                    voiceDuration:(NSString *)voiceDuration
                         username:(NSString *)username
                        timeStamp:(NSString *)timeStamp
                         isSender:(BOOL)isSender
{
    
    return [self initWithVoicePath:voicePath voiceUrl:voiceUrl voiceDuration:voiceDuration username:username timeStamp:timeStamp isRead:NO isSender:isSender];
    
    
}
- (instancetype)initWithVoicePath:(NSString *)voicePath
                         voiceUrl:(NSString *)voiceUrl
                    voiceDuration:(NSString *)voiceDuration
                         username:(NSString *)username
                        timeStamp:(NSString *)timeStamp
                           isRead:(BOOL)isRead
                         isSender:(BOOL)isSender
{
    
    self = [super init];
    if (self) {
        self.voicePath = voicePath;
        
        
        self.username = username;
        self.timeStamp = timeStamp;
        self.isRead = isRead;
        self.voiceDuration = voiceDuration;
        
        self.bubbleMessageBodyType = MessageBodyTypeVoice;
        self.isSender = isSender;
    }
    return self;
}

@end
