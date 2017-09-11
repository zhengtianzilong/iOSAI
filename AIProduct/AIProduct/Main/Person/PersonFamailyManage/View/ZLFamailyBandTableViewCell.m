//
//  ZLFamailyBandTableViewCell.m
//  AIProduct
//
//  Created by mac on 2017/8/14.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ZLFamailyBandTableViewCell.h"

@interface ZLFamailyBandTableViewCell ()<UIPickerViewDelegate,UIPickerViewDataSource>


@property (nonatomic, strong) UIToolbar *myToolBar;
@property (nonatomic, strong) NSArray *sexArray;
@property (nonatomic, strong) NSString *selectedSex;


@end


@implementation ZLFamailyBandTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setUpUI];
        
    }
    return  self;
}


- (void)setUpUI{
    
    _sexArray = @[@"男",@"女"];
    _titleLabel = [[UILabel alloc]init];
    _titleLabel.font = AdaptedFontSize(32);
    [_titleLabel setTextColor:HEXCOLOR(0x191919)];
    [self.contentView addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.contentView).with.offset(AdaptedWidth(32));
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(44);
    }];
    
    _textField = [[UITextField alloc]init];
    _textField.textAlignment = NSTextAlignmentRight;
    _textField.placeholder = @"请填写";
    _textField.borderStyle = UITextBorderStyleNone;
    [_textField setTextColor:HEXCOLOR(KText_color_blue)];
    [_textField setValue:HEXCOLOR(KEdittext_hint_text_color) forKeyPath:@"_placeholderLabel.textColor"];
    [self.contentView addSubview:_textField];
    [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.right.equalTo(self.contentView.mas_right).with.offset(-20);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(44);
        
    }];
    
    self.pickview = [[UIPickerView alloc]initWithFrame:CGRectMake(0, self.bounds.size.height, self.bounds.size.width, 150)];
    self.pickview.backgroundColor = [UIColor whiteColor];
    
    self.pickview.delegate = self;
    self.pickview.dataSource = self;
    
    UIBarButtonItem *cancelItem = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:(UIBarButtonItemStylePlain) target:self action:@selector(cancelClick)];
    
    UIBarButtonItem *space = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    UIBarButtonItem *sureItem = [[UIBarButtonItem alloc]initWithTitle:@"确定" style:(UIBarButtonItemStylePlain) target:self action:@selector(doneClick)];
    self.myToolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, App_Frame_Height - 150, App_Frame_Width, 30)];
    [self.myToolBar setItems:@[cancelItem,space,sureItem]];
    
}


- (void)setTitle:(NSString *)title{
    _titleLabel.text = title;
    if ([title isEqualToString:@"年龄"] || [title isEqualToString:@"身高"] || [title isEqualToString:@"体重"]) {
        
        _textField.keyboardType = UIKeyboardTypeNumberPad;
    }
    
    if ([title isEqualToString:@"性别"]) {
        _textField.placeholder = @"请选择";
        _textField.inputView = self.pickview;
        _textField.inputAccessoryView = self.myToolBar;
        
        [_pickview selectRow:0 inComponent:0 animated:YES];
        [_pickview reloadAllComponents];
    }
    
}

- (void)doneClick {
    if ( [_textField isFirstResponder] ) {
        
        _textField.text = self.selectedSex.length > 0? self.selectedSex:_sexArray[0];
        
        [_textField resignFirstResponder];
    }
}

- (void)cancelClick {
    [self doneClick];
}

#pragma mark pickvew 的代理
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return 1;
    
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return 2;
    
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    return _sexArray[row];
    
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    self.selectedSex = _sexArray[row];
    
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    
    UILabel* pickerLabel            = (UILabel*)view;
    
    if (!pickerLabel){
        pickerLabel                 = [[UILabel alloc] init];
        pickerLabel.textAlignment   = NSTextAlignmentCenter;
        pickerLabel.backgroundColor = [UIColor clearColor];
        pickerLabel.font            = [UIFont systemFontOfSize:16.0];
    }
    
    pickerLabel.text                = [self pickerView:pickerView titleForRow:row forComponent:component];
    
    return pickerLabel;

}

@end
