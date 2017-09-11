//
//  ZLVoiceMessageModel.h
//  AIProduct
//
//  Created by mac on 2017/8/18.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ZLMessageModel.h"

@interface ZLVoiceMessageModel : ZLMessageModel

+ (instancetype)VoicePath:(NSString *)voicePath
                 voiceUrl:(NSString *)voiceUrl
            voiceDuration:(NSString *)voiceDuration
                 username:(NSString *)username
                timeStamp:(NSString *)timeStamp
                 isSender:(BOOL)isSender;



+ (instancetype)VoicePath:(NSString *)voicePath
                 voiceUrl:(NSString *)voiceUrl
            voiceDuration:(NSString *)voiceDuration
                 username:(NSString *)username
                timeStamp:(NSString *)timeStamp
                   isRead:(BOOL)isRead
                 isSender:(BOOL)isSender;

@end
