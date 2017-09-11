//
//  ZLEmotionFaceToolBar.h
//  AIProduct
//
//  Created by mac on 2017/8/18.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZLEmotionFaceToolBar : UIView


/**
 *  @brief 表情中可能不是emoij，也可能是其他图片，就另外处理了
 */
@property(nonatomic,assign) BOOL isEmoij;
@property(nonatomic,copy) void(^switchEmoijBlock)(NSInteger);
@property(nonatomic,copy) void(^sendEmoijBlock)();



- (void)setBtnIndexSelect:(NSInteger)index;

@end
