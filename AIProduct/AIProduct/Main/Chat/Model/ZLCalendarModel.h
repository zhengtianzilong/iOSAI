//
//  ZLCalendarModel.h
//  AIProduct
//
//  Created by mac on 2017/8/17.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@protocol  ZLCalendarModel<NSObject>



@end

@interface ZLCalendarModel : JSONModel

@property (nonatomic, strong) NSString *year;

@property (nonatomic, strong) NSString *month;

@property (nonatomic, strong) NSString *day;

@end
