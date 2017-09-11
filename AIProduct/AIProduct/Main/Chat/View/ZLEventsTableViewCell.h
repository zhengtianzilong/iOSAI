//
//  ZLEventsTableViewCell.h
//  AIProduct
//
//  Created by mac on 2017/8/16.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZLEventsModel.h"
@interface ZLEventsTableViewCell : UITableViewCell

@property (nonatomic, assign) BOOL open;

@property (nonatomic, strong) ZLEventsModel *model;

@property (nonatomic, strong) void (^openClickBlock)(UIButton *btn);



@end
