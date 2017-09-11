//
//  ZLEmotionViewDelegate.h
//  AIProduct
//
//  Created by mac on 2017/8/18.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ZLEmotionViewDelegate <NSObject>


/**
 *  @brief 点击emoij表情，增加内容，或删除最后一个emoij
 *
 *  @param emoij             <#emoij description#>
 *  @param isDeleteLastEmoij <#isDeleteLastEmoij description#>
 */
- (void)addEmoij:(NSString *)emoij isDeleteLastEmoij:(BOOL)isDeleteLastEmoij;

/**
 *  @brief 发送emoij表情
 *
 *  @param text <#text description#>
 */
- (void)sendEmoijMessage:(NSString *)text;

/**
 *  @brief 发送浪小花等图片，扩展功能
 *
 *  @param imagePath <#imagePath description#>
 */
- (void)sendEmotionImage:(NSString *)localPath emotionType:(EmotionType)emotionType;
@end
