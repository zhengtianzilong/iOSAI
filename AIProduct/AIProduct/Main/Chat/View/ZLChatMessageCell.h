//
//  ZLChatMessageCell.h
//  AIProduct
//
//  Created by mac on 2017/8/18.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZLMessageModel.h"
@interface ZLChatMessageCell : UITableViewCell

@property(nonatomic,strong) ZLMessageModel *message;
@property(nonatomic,strong)  UIImageView *avateImageV;
@property(nonatomic,strong)  UILabel *nameLabel;

@property(nonatomic,strong)  UIImageView *bubbleImageV;

+ (CGFloat)CellHeight:(ZLMessageModel *)message;

@end
