//
//  ZLAddVideoChatView.h
//  AIProduct
//
//  Created by mac on 2017/8/21.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZLAddVideoChatView : UIView

@property (nonatomic, strong) void (^changePersonBlock)(UIButton *personBtn);

@property (nonatomic, strong) UIImageView *symbolImageV;

@end
