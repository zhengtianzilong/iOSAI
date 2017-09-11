//
//  ZLFamilyManagerModel.h
//  AIProduct
//
//  Created by mac on 2017/8/31.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface ZLFamilyManagerModel : JSONModel

@property (nonatomic, strong) NSString *imageString;

@property (nonatomic, strong) NSString *name;

@property (nonatomic, strong) NSString *idString;

@property (nonatomic, strong) NSString *age;

@property (nonatomic, strong) NSString *sex;

@property (nonatomic, strong) NSString *height;

@property (nonatomic, strong) NSString *weight;


@end
