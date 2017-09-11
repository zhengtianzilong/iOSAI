//
//  ZLPhotoMessageModel.m
//  AIProduct
//
//  Created by mac on 2017/8/18.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ZLPhotoMessageModel.h"

@implementation ZLPhotoMessageModel

+ (instancetype)Photo:(NSString *)localPhotoPath
         thumbnailUrl:(NSString *)thumbnailUrl
       originPhotoUrl:(NSString *)originPhotoUrl
             username:(NSString *)username
            timeStamp:(NSString *)timeStamp
             isSender:(BOOL)isSender

{
    return [[self alloc]initWithPhoto:localPhotoPath thumbnailUrl:thumbnailUrl originPhotoUrl:originPhotoUrl username:username timeStamp:timeStamp isSender:isSender];
}


- (instancetype)initWithPhoto:(NSString *)localPhotoPath
                 thumbnailUrl:(NSString *)thumbnailUrl
               originPhotoUrl:(NSString *)originPhotoUrl
                     username:(NSString *)username
                    timeStamp:(NSString *)timeStamp
                     isSender:(BOOL)isSender
{
    self = [super init];
    if (self) {
        self.localPhotoPath = localPhotoPath;
        self.thumbnailUrl = thumbnailUrl;
        self.originPhotoUrl = originPhotoUrl;
        self.username = username;
        self.timeStamp = timeStamp;
        
        self.bubbleMessageBodyType = MessageBodyTypePhoto;
        self.isSender = isSender;
    }
    return self;
}

@end
