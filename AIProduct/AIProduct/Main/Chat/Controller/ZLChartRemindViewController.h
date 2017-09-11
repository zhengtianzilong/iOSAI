//
//  ZLChartRemindViewController.h
//  AIProduct
//
//  Created by mac on 2017/8/16.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ZLBaseCustomNavViewController.h"
#import "ZLEventsModel.h"

@protocol ZlChartRemindViewDelegate <NSObject>

- (void)zlchartReminViewWithEventModel:(ZLEventsModel *)eventModel;


@end

@interface ZLChartRemindViewController : ZLBaseCustomNavViewController

@property (nonatomic,weak) id<ZlChartRemindViewDelegate> delegate;

@end
