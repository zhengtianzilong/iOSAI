//
//  ZLPersonListTableViewCell.h
//  AIProduct
//
//  Created by mac on 2017/8/22.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZLPersonListModel.h"
@interface ZLPersonListTableViewCell : UITableViewCell

@property (nonatomic, strong) UIButton *selectButton;

@property (nonatomic, strong) UIImageView *headImageV;

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UIButton *statusBtn;
@property (nonatomic, strong) UIButton *deviceShareBtn;

@property (nonatomic, strong) ZLPersonListModel *personModel;

@end
