//
//  ZLFamailyBandTableViewCell.h
//  AIProduct
//
//  Created by mac on 2017/8/14.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZLFamailyBandTableViewCell : UITableViewCell

@property (nonatomic ,strong) UILabel *titleLabel;

@property (nonatomic, strong) UITextField *textField;

@property (nonatomic,strong) NSString *title;

@property (nonatomic, strong) UIPickerView *pickview;

@end
