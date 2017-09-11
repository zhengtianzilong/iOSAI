//
//  ZLHomeBottomModel.h
//  AIProduct
//
//  Created by mac on 2017/8/15.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface ZLHomeBottomModel : JSONModel

@property (nonatomic, strong) NSString *weathValue;

@property (nonatomic, strong) NSString *symbol;

@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) UIColor *hexColor;

@end
