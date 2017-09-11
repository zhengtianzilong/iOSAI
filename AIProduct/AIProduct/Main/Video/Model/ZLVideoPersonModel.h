//
//  ZLVideoPersonModel.h
//  AIProduct
//
//  Created by mac on 2017/8/22.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <JSONModel/JSONModel.h>
// 准备视频的人的列表model
@interface ZLVideoPersonModel : JSONModel

@property (nonatomic, strong) NSString *name;

@property (nonatomic, strong) NSString *detailTitle;

@end
