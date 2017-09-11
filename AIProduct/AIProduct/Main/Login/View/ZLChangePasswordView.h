//
//  ZLChangePasswordView.h
//  AIProduct
//
//  Created by mac on 2017/8/1.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZLChangePasswordView : UIView
// 点击确定按钮
@property (nonatomic, strong) UIButton *sureButton;

// 新密码
@property (nonatomic, strong) UITextField *newpasswordTF;

// 重复新密码
@property (nonatomic, strong) UITextField *repeatPasswordTF;

// 密码正确与否
@property (nonatomic, strong) UIButton *trueOrFalseBtnFirst;
// 确认密码正确与否
@property (nonatomic, strong) UIButton *trueOrFalseBtnSecond;
@end
