//
//  ZLFamailManageViewTableViewCell.h
//  AIProduct
//
//  Created by mac on 2017/8/14.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZLFamilyManagerModel.h"
@interface ZLFamailManageViewTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *userImageV;

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *idLabel;

@property (nonatomic, strong) UIImageView *indicatorImageV;

@property (nonatomic, strong) ZLFamilyManagerModel *familyModel;

@end
