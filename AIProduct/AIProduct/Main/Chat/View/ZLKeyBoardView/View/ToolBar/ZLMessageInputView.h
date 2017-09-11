//
//  ZLMessageInputView.h
//  AIProduct
//
//  Created by mac on 2017/8/18.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol TextInputDelegate <NSObject>

@required
/**
 *  发送消息
 */
- (void)sendTextMessage:(NSString *)text;


@end

@interface ZLMessageInputView : UITextView

@property(nonatomic,weak) id<TextInputDelegate> textInputDelegate;



@property(nonatomic,strong)NSString * placeholder;

@property(nonatomic,strong)UIColor * placeholderTextColor;


@end
