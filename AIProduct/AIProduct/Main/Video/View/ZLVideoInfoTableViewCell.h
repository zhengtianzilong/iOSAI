//
//  ZLVideoInfoTableViewCell.h
//  AIProduct
//
//  Created by mac on 2017/8/21.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZLVideoPersonModel.h"
@interface ZLVideoInfoTableViewCell : UITableViewCell

@property (nonatomic, strong) UIButton *inviteBtn;

@property (nonatomic, strong) ZLVideoPersonModel *personModel;

@end
