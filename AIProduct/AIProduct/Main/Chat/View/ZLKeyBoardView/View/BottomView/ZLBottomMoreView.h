//
//  ZLBottomMoreView.h
//  AIProduct
//
//  Created by mac on 2017/8/18.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZLKeyBoardHeader.h"

@protocol ZLBottomMoreDelegate <NSObject>

- (void)moreViewClick:(MoreViewType)type;

@end

@interface ZLBottomMoreView : UIView

@property(nonatomic,weak) id<ZLBottomMoreDelegate> moreViewDelegate;

@end
