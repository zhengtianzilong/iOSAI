//
//  ZLEventsModel.h
//  AIProduct
//
//  Created by mac on 2017/8/17.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "ZLCalendarModel.h"

@interface ZLEventsModel : JSONModel

@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) NSString *detial;

@property (nonatomic, strong) ZLCalendarModel *calendarModel;

@property (nonatomic, assign) BOOL is_Open;

@end
