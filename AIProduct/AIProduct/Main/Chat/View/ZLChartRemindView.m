//
//  ZLChartRemindView.m
//  AIProduct
//
//  Created by mac on 2017/8/17.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ZLChartRemindView.h"
#define KTextHeight AdaptedHeight(98)
@interface ZLChartRemindView ()<UIPickerViewDelegate,UIPickerViewDataSource,UITextViewDelegate>

@property (nonatomic, assign) CGFloat textHeight;

@property (nonatomic, strong) UIView *bgView2;

@end

@implementation ZLChartRemindView
{
    
    NSInteger yearRange;
    NSInteger dayRange;
    NSInteger startYear;
    NSInteger selectedYear;
    NSInteger selectedMonth;
    NSInteger selectedDay;
    NSInteger selectedHour;
    NSInteger selectedMinute;
    NSCalendar *calendar;
    
}
- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = HEXCOLOR(KStand_bkg_color);
        [self setUpUI];
        
        
    }
    
    return  self;
}

- (void)setUpUI{

    
//    UIView *bgView1 = [[UIView alloc]init];
//    bgView1.backgroundColor = [UIColor whiteColor];
//    [self addSubview:bgView1];
//    [bgView1 mas_makeConstraints:^(MASConstraintMaker *make) {
//       
//        make.left.equalTo(self);
//        make.top.equalTo(self);
//        make.height.mas_equalTo(AdaptedHeight(98));
//        make.right.equalTo(self.mas_right);
//
//    }];
    
    
    _contenTextView = [[ZLChartRemindTextView alloc]init];
    _contenTextView.placeholder = @"请输入实践内容";
    _contenTextView.placeholderTextColor = HEXCOLOR(0xBCE2EB);
    _contenTextView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    _contenTextView.font = AdaptedFontSize(28);
    [_contenTextView setTextColor:HEXCOLOR(0x3a3a3a)];
//     _contenTextView.contentInset = UIEdgeInsetsMake(0, AdaptedWidth(52), 0,100);
    _contenTextView.textContainerInset = UIEdgeInsetsMake(20, AdaptedWidth(52), 0, 0);
    _contenTextView.scrollEnabled = NO;
    [self addSubview:_contenTextView];
    _contenTextView.delegate = self;
    [_contenTextView mas_makeConstraints:^(MASConstraintMaker *make) {
       
                make.left.equalTo(self).offset(0);
                make.top.equalTo(self);
                make.height.greaterThanOrEqualTo(AdaptedHeight(98));
                make.right.equalTo(self.mas_right).offset(0);
        
    }];
    
    _bgView2 = [[UIView alloc]init];
    _bgView2.backgroundColor = [UIColor whiteColor];
    [self addSubview:_bgView2];
    [_bgView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self);
        make.top.equalTo(_contenTextView.mas_bottom).offset(1);
        make.height.mas_equalTo(AdaptedHeight(430));
        make.right.equalTo(self.mas_right);
        
    }];
    
    
    _timeTextField = [self customTextFieldOn:_bgView2 placeholder:@"设置时间" placeholderColor:HEXCOLORAndAlpha(0x6c6c6c, 0.5) textColor:nil keyboardType:(UIKeyboardTypeDefault)] ;
    
    UIImageView *left = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, AdaptedHeight(60), AdaptedHeight(60))];
    
    left.contentMode = UIViewContentModeLeft;
    
    left.image = [UIImage imageNamed:@"chat_time"];
    
    _timeTextField.leftView = left;
    _timeTextField.leftViewMode = UITextFieldViewModeAlways;
    
    [_bgView2 addSubview:_timeTextField];
    
    [_timeTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(_bgView2).offset(AdaptedWidth(52));
        make.top.equalTo(_bgView2);
        make.height.mas_equalTo(AdaptedHeight(60));
        make.right.equalTo(_bgView2.mas_right);
        
    }];
    
    
    // 50年跨度
    yearRange = 50;
    
    NSCalendar *calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    
     NSInteger unitFlags =  NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute;
     NSDateComponents *comps = [calendar components:unitFlags fromDate:[NSDate date]];
    NSInteger year = [comps year];
    startYear = year - 15;
    
    
    self.pickerView = [[UIPickerView alloc]init];
    self.pickerView.backgroundColor = [UIColor whiteColor];
    self.pickerView.dataSource = self;
    self.pickerView.delegate = self;
    [_bgView2 addSubview:self.pickerView];
    [self.pickerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.top.equalTo(_timeTextField.mas_bottom).offset(2);
        make.height.mas_equalTo(AdaptedHeight(355));
        make.right.equalTo(self.mas_right);
        
        
    }];
    
    self.pickerView.layer.shadowColor = HEXCOLOR(0x11ccf9).CGColor;
    self.pickerView.layer.shadowOffset = CGSizeMake(0, 3);
    self.pickerView.layer.shadowOpacity = 0.2;
    self.layer.shadowRadius = 5;
//    [self.pickerView.layer setShadowPath:(__bridge CGPathRef _Nullable)([UIBezierPath bezierPathWithRect:self.pickerView.bounds])];
    self.pickerView.layer.masksToBounds = NO;
    [self setCurrentDate:[NSDate date]];
    
    
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    

    
}


// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return 5;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    switch (component) {
        case 0:
        {
            return yearRange;
        }
            break;
        case 1:
        {
            return 12;
        }
            break;
        case 2:
        {
            return dayRange;
        }
            break;
        case 3:
        {
            return 24;
        }
            break;
        case 4:
        {
            return 60;
        }
            break;
    }
    
    return 0;
}

// returns width of column and height of row for each component.
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
    
    return (App_Frame_Width - 60) / 5;
    
}


- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(nullable UIView *)view{
    
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(App_Frame_Width *component/6.0, 0,App_Frame_Width/6.0, 30)];
    
    label.font= AdaptedFontBoldSize(36);
    
    label.textColor = HEXCOLORAndAlpha(0x11ccf9, 0.85);
    label.tag=component*100+row;
    label.textAlignment=NSTextAlignmentCenter;
    switch (component) {
        case 0:
        {
            label.text=[NSString stringWithFormat:@"%ld",(long)(startYear + row)];
        }
            break;
        case 1:
        {
            label.text=[NSString stringWithFormat:@"%ld",(long)row+1];
        }
            break;
        case 2:
        {
            
            label.text=[NSString stringWithFormat:@"%ld",(long)row+1];
        }
            break;
        case 3:
        {
            label.textAlignment=NSTextAlignmentCenter;
            label.text=[NSString stringWithFormat:@"%ld",(long)row];
        }
            break;
        case 4:
        {
            label.textAlignment=NSTextAlignmentCenter;
            label.text=[NSString stringWithFormat:@"%ld",(long)row];
        }
            break;

    }
    
    
    return label;
    
}

//默认时间的处理
-(void)setCurrentDate:(NSDate *)currentDate
{
    //获取当前时间
    NSCalendar *calendar0 = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags =  NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute;
    comps = [calendar0 components:unitFlags fromDate:currentDate];
    NSInteger year=[comps year];
    NSInteger month=[comps month];
    NSInteger day=[comps day];
    NSInteger hour=[comps hour];
    NSInteger minute=[comps minute];
    
    selectedYear=year;
    selectedMonth=month;
    selectedDay=day;
    selectedHour=hour;
    selectedMinute=minute;
    
    dayRange=[self isAllDay:year andMonth:month];
    
    [self.pickerView selectRow:year-startYear inComponent:0 animated:NO];
    [self.pickerView selectRow:month-1 inComponent:1 animated:NO];
    [self.pickerView selectRow:day-1 inComponent:2 animated:NO];
    [self.pickerView selectRow:hour inComponent:3 animated:NO];
    [self.pickerView selectRow:minute inComponent:4 animated:NO];
    
    [self pickerView:self.pickerView didSelectRow:year-startYear inComponent:0];
    [self pickerView:self.pickerView didSelectRow:month-1 inComponent:1];
    [self pickerView:self.pickerView didSelectRow:day-1 inComponent:2];
    [self pickerView:self.pickerView didSelectRow:hour inComponent:3];
    [self pickerView:self.pickerView didSelectRow:minute inComponent:4];
    
    [self.pickerView reloadAllComponents];
}

-(NSInteger)isAllDay:(NSInteger)year andMonth:(NSInteger)month
{
    int day=0;
    switch(month)
    {
        case 1:
        case 3:
        case 5:
        case 7:
        case 8:
        case 10:
        case 12:
            day=31;
            break;
        case 4:
        case 6:
        case 9:
        case 11:
            day=30;
            break;
        case 2:
        {
            if(((year%4==0)&&(year%100!=0))||(year%400==0))
            {
                day=29;
                break;
            }
            else
            {
                day=28;
                break;
            }
        }
        default:
            break;
    }
    return day;
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    switch (component) {
        case 0:
        {
            selectedYear=startYear + row;
            dayRange=[self isAllDay:selectedYear andMonth:selectedMonth];
            [self.pickerView reloadComponent:2];
        }
            break;
        case 1:
        {
            selectedMonth=row+1;
            dayRange=[self isAllDay:selectedYear andMonth:selectedMonth];
            [self.pickerView reloadComponent:2];
        }
            break;
        case 2:
        {
            selectedDay=row+1;
        }
            break;
        case 3:
        {
            selectedHour=row;
        }
            break;
        case 4:
        {
            selectedMinute=row;
        }
            break;
            
        default:
            break;
    }
    
    _timeTextField.text = [NSString stringWithFormat:@"%ld-%.ld-%.2ld %.2ld:%.2ld",selectedYear,selectedMonth,selectedDay,selectedHour,selectedMinute];
    
    NSLog(@"%@",[NSString stringWithFormat:@"%ld-%.2ld-%.2ld %.2ld:%.2ld",selectedYear,selectedMonth,selectedDay,selectedHour,selectedMinute]);
}

#pragma mark --- textViewDelegate

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    _contenTextView.placeholderLable.hidden = YES;
}



// 创建textField的可配置方式
- (UITextField *)customTextFieldOn:(UIView *)bgview placeholder:(NSString *)placeholder placeholderColor:(UIColor *)placeholderColor textColor:(UIColor *)textColor keyboardType:(UIKeyboardType)keyboardType {
    
    UITextField *textField = [[UITextField alloc]init];
    
    [bgview addSubview:textField];
    textField.borderStyle = UITextBorderStyleNone;
    textField.placeholder = placeholder;
    [textField setTextColor:textColor?textColor :HEXCOLOR(KText_color_blue)];
    [textField setValue:placeholderColor?placeholderColor:HEXCOLOR(KEdittext_hint_text_color) forKeyPath:@"_placeholderLabel.textColor"];
    textField.keyboardType = keyboardType;
    return textField;
    
}


@end
