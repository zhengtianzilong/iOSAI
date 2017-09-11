//
//  ZLChatDataSourceHelper.h
//  AIProduct
//
//  Created by mac on 2017/8/18.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZLMessageModel.h"
#import "ZLTextMessageModel.h"
#import "ZLPhotoMessageModel.h"
#import "ZLVideoMessageModel.h"
#import "ZLVoiceMessageModel.h"
#import "LocationMessageModel.h"
#import "NSDate+Addition.h"
//#import "ZLLocationMessageModel.h"
@interface ZLChatDataSourceHelper : NSObject

//获取模拟消息数据
+ (NSMutableArray *)getFakeMessages;


//模拟接收的消息
+ (ZLMessageModel *)getReceiveMessage;

@end
