//
//  ZLAddPersonViewController.h
//  AIProduct
//
//  Created by mac on 2017/8/22.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ZLBaseCustomNavViewController.h"

@interface ZLAddPersonViewController : ZLBaseCustomNavViewController

@property (nonatomic, strong) void(^selectedModelBlock)(NSArray *modelArray);

@end
