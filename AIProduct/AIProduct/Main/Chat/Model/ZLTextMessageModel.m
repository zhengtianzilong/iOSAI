//
//  ZLTextMessageModel.m
//  AIProduct
//
//  Created by mac on 2017/8/18.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ZLTextMessageModel.h"

@implementation ZLTextMessageModel
+ (instancetype)text:(NSString *)text
            username:(NSString *)username
           timeStamp:(NSString *)timeStamp
            isSender:(BOOL)isSender

{
    return [[self alloc]initWithText:text username:username timeStamp:timeStamp isSender:isSender];
}


- (instancetype)initWithText:(NSString *)text
                    username:(NSString *)username
                   timeStamp:(NSString *)timeStamp
                    isSender:(BOOL)isSender

{
    self = [super init];
    if (self) {
        self.text = text;
        
        self.username = username;
        self.timeStamp = timeStamp;
        
        self.bubbleMessageBodyType = MessageBodyTypeText;
        self.isSender = isSender;
    }
    return self;
    
}

@end
