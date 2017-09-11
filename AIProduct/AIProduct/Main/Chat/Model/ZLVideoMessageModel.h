//
//  ZLVideoMessageModel.h
//  AIProduct
//
//  Created by mac on 2017/8/18.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ZLMessageModel.h"

@interface ZLVideoMessageModel : ZLMessageModel
+ (instancetype)VideoThumbPhoto:(NSString *)videoThumbPhoto
                  videoThumbUrl:(NSString *)videoThumbUrl
                       videoUrl:(NSString *)videoUrl
                       username:(NSString *)username
                      timeStamp:(NSString *)timeStamp
                       isSender:(BOOL)isSender;
@end
