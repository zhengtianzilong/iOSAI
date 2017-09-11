//
//  ZLFamailyBandInfoViewController.h
//  AIProduct
//
//  Created by mac on 2017/8/14.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ZLBaseCustomNavViewController.h"
#import "ZLFamilyManagerModel.h"
@interface ZLFamailyBandInfoViewController : ZLBaseCustomNavViewController


@property (nonatomic, strong) void (^familyBandBlock)(ZLFamilyManagerModel *model);


@end
