//
//  ZLChartRemindViewController.m
//  AIProduct
//
//  Created by mac on 2017/8/16.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ZLChartRemindViewController.h"
#import "ZLChartRemindView.h"
@interface ZLChartRemindViewController ()

@property (nonatomic,strong) ZLChartRemindView *chartReminV;

@end

@implementation ZLChartRemindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = HEXCOLOR(KStand_bkg_color);
    
    _chartReminV = [[ZLChartRemindView alloc]initWithFrame:CGRectMake(0, 64, App_Frame_Width, App_Frame_Height)];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self.view addSubview:_chartReminV];
    
    
}




- (UIButton *)set_rightButton{
    
    UIButton *rightButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    
    rightButton.frame = CGRectMake(0, 0, 40, 40);
    
    [rightButton setTitle:@"完成" forState:(UIControlStateNormal)];
    
    return rightButton;
    
}

- (void)right_button_event:(UIButton *)sender{
    
    ZLEventsModel *eventModel = [[ZLEventsModel alloc]init];
    NSArray *timeArray = [_chartReminV.timeTextField.text componentsSeparatedByString:@" "];
    
    NSArray *yearAndMonth = [timeArray[0] componentsSeparatedByString:@"-"];
    
    eventModel.title = timeArray[1];
    eventModel.detial = _chartReminV.contenTextView.text;
    ZLCalendarModel *calendarModel = [[ZLCalendarModel alloc]init];
    calendarModel.year = yearAndMonth[0];
    calendarModel.month = yearAndMonth[1];
    calendarModel.day = yearAndMonth[2];
    eventModel.calendarModel = calendarModel;
    
    if (_delegate && [self.delegate respondsToSelector:@selector(zlchartReminViewWithEventModel:)]) {
        
        [self.delegate zlchartReminViewWithEventModel:eventModel];
        
    }
    [self.navigationController popViewControllerAnimated:YES];
   
}


- (NSMutableAttributedString *)setTitle{
    
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc]initWithString:@"添加提醒"];
    
    [title addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, title.length)];
    
    [title addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:20] range:NSMakeRange(0, title.length)];
    
    return title;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
