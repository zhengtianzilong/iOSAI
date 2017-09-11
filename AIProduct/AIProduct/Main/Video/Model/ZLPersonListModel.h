//
//  ZLPersonListModel.h
//  AIProduct
//
//  Created by mac on 2017/8/22.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <JSONModel/JSONModel.h>
// 添加联系人列表model
@interface ZLPersonListModel : JSONModel

@property (nonatomic, strong) NSString *name;

//@property (nonatomic, strong) NSString *imageName;

@property (nonatomic, assign) BOOL isStatus;

@property (nonatomic, assign) BOOL isShareButton;

@property (nonatomic, assign) BOOL isSelected;

@end
