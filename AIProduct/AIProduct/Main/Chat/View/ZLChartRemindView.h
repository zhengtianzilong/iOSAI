//
//  ZLChartRemindView.h
//  AIProduct
//
//  Created by mac on 2017/8/17.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZLChartRemindTextView.h"
@interface ZLChartRemindView : UIView
@property (nonatomic, strong) ZLChartRemindTextView *contenTextView;
@property (nonatomic, strong) UITextField *timeTextField;
@property (nonatomic, strong) UIPickerView *pickerView;
@end
