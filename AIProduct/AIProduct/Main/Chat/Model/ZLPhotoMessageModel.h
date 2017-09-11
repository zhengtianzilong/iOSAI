//
//  ZLPhotoMessageModel.h
//  AIProduct
//
//  Created by mac on 2017/8/18.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ZLMessageModel.h"

@interface ZLPhotoMessageModel : ZLMessageModel
+ (instancetype)Photo:(NSString *)localPhotoPath
         thumbnailUrl:(NSString *)thumbnailUrl
       originPhotoUrl:(NSString *)originPhotoUrl
             username:(NSString *)username
            timeStamp:(NSString *)timeStamp
             isSender:(BOOL)isSender;
@end
