//
//  ZLVideoMessageModel.m
//  AIProduct
//
//  Created by mac on 2017/8/18.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ZLVideoMessageModel.h"

@implementation ZLVideoMessageModel
+ (instancetype)VideoThumbPhoto:(NSString *)videoThumbPhoto
                  videoThumbUrl:(NSString *)videoThumbUrl
                       videoUrl:(NSString *)videoUrl
                       username:(NSString *)username
                      timeStamp:(NSString *)timeStamp
                       isSender:(BOOL)isSender
{
    
    return [[self alloc]initWithVideoThumbPhoto:videoThumbPhoto videoThumbUrl:videoThumbUrl videoUrl:videoUrl username:username timeStamp:timeStamp isSender:isSender];
}


- (instancetype)initWithVideoThumbPhoto:(NSString *)videoThumbPhoto
                          videoThumbUrl:(NSString *)videoThumbUrl
                               videoUrl:(NSString *)videoUrl
                               username:(NSString *)username
                              timeStamp:(NSString *)timeStamp
                               isSender:(BOOL)isSender
{
    self = [super init];
    if (self) {
        self.videoThumbPhoto = videoThumbPhoto;
        self.videoThumbUrl = videoThumbUrl;
        self.videoUrl = videoUrl;
        
        
        self.username = username;
        self.timeStamp = timeStamp;
        
        self.bubbleMessageBodyType = MessageBodyTypeVideo;
        self.isSender = isSender;
    }
    return self;
    
}

@end
