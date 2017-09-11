//
//  ZLChartBottomRemindView.h
//  AIProduct
//
//  Created by mac on 2017/8/16.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZLChartBottomRemindView : UIView

@property (nonatomic, copy) void(^remindBlock)();

@property (nonatomic, copy) void(^eventBlock)();

@end
