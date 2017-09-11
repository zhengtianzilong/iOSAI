//
//  ZLChartEventsViewController.m
//  AIProduct
//
//  Created by mac on 2017/8/16.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ZLChartEventsViewController.h"
#import "UIView+ZLEaseBlankPage.h"
#import "ZLEventsTableViewCell.h"
#import "ZLEventsModel.h"
#import "NSString+Size.h"
#import "ZLChartRemindViewController.h"
@interface ZLChartEventsViewController ()<UITableViewDelegate,UITableViewDataSource,ZlChartRemindViewDelegate>
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) UITableView *mainTableView;

@property (nonatomic, strong) ZLEventsModel *eventModel;

@end

@implementation ZLChartEventsViewController


- (void)loadData{
    
    // 从网络请求数据
    __weak typeof(self)weakSelf = self;
    
    
    // 成功时
    [self.mainTableView reloadData];
    [self.mainTableView.mj_header endRefreshing];

    // 如果没有数据,则显示无按钮的空白展示页
    [self.view configWith:EaseBlankPageTypeNoButton hasData:self.dataArray.count hasError:self.dataArray.count > 0 tipsTitle:@"快去添加家人信息" nameImage:@"my_list" reloadButtonBlock:nil];
}

- (ZLEventsModel *)eventModel{
    if (!_eventModel) {
        
        _eventModel = [[ZLEventsModel alloc]init];
        
    }
    return _eventModel;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = HEXCOLOR(KStand_bkg_color);
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.eventModel.title = @"9:00";
    self.eventModel.detial = @"事件:这是第一次发表自己的博客，一直不知道该写点什么东西，恰巧今天写了个App中比较常见的使用场景，列表页面列表每行显示的数据有限，不能完整的显示所有内容，通过点击UITableViewCell将不能完全展示的内容展示完全，再次点击会继续隐藏部分内容。Demo见这是第一次发表自己的博客";
    ZLCalendarModel *calendarModel = [[ZLCalendarModel alloc]init];
    calendarModel.year = @"2017";
    calendarModel.month = @"7";
    calendarModel.day = @"30";
    
    ZLEventsModel *eventModel1 = [[ZLEventsModel alloc]init];
    eventModel1.title = @"8:00";
    eventModel1.detial = @"事件:这是第一次发表自己的博客";
    
    eventModel1.calendarModel = calendarModel;
    _eventModel.calendarModel = calendarModel;
    
    [self.dataArray addObject:_eventModel];
    [self.dataArray addObject:eventModel1];
    [self.dataArray addObject:eventModel1];
    
    if (!_mainTableView) {
        
        _mainTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, Main_Screen_Width, Main_Screen_Height - 64) style:(UITableViewStyleGrouped)];
        _mainTableView.backgroundColor = HEXCOLOR(KStand_bkg_color);
        _mainTableView.showsVerticalScrollIndicator = NO;
        _mainTableView.showsHorizontalScrollIndicator = NO;
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        _mainTableView.rowHeight = UITableViewAutomaticDimension;
        _mainTableView.estimatedRowHeight = 200;
        _mainTableView.separatorColor = HEXCOLORAndAlpha(0x11ccf9, 0.2);
        [_mainTableView registerClass:[ZLEventsTableViewCell class] forCellReuseIdentifier:NSStringFromClass([ZLEventsTableViewCell class])];
        [self.view addSubview:_mainTableView];
        
        ZLWeakSelf(self);
        
        _mainTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            
            ZLStrongSelf(self);
            
            [self loadData];
        }];
        
        [_mainTableView.mj_header beginRefreshing];
    }

    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArray.count;;
    
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ZLEventsModel *model =  self.dataArray[indexPath.row];
    
    if (!model.is_Open) {
        return AdaptedHeight(164);
        
    }else{
       CGFloat height = [model.detial heightWithFont:AdaptedFontSize(24) constrainedToWidth:AdaptedWidth(488)];
        return  AdaptedHeight(164 - 46) + height ;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ZLEventsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ZLEventsTableViewCell class]) forIndexPath:indexPath];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    ZLEventsModel *eventModel = self.dataArray[indexPath.row];
    cell.model = eventModel;
    
    __weak typeof(self) weakself = self;
    
    cell.openClickBlock = ^(UIButton *btn) {
        
//       ZLEventsTableViewCell *eventsCell =  (ZLEventsTableViewCell *)[[btn superview] superview];
        
//       NSIndexPath *indexPath = [weakself.mainTableView indexPathForCell:eventsCell];
        eventModel.is_Open = !eventModel.is_Open;

        [weakself.mainTableView reloadData];
        
    };
    return cell;
    
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}

- (UIButton *)set_rightButton{
    
    UIButton *rightButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    
    rightButton.frame = CGRectMake(0, 0, 40, 40);
    
    [rightButton setTitle:@"添加" forState:(UIControlStateNormal)];
    
    return rightButton;
    
}

- (void)right_button_event:(UIButton *)sender{
    
    ZLChartRemindViewController *remindVC = [[ZLChartRemindViewController alloc]init];
    remindVC.delegate = self;
    [self.navigationController pushViewController:remindVC animated:YES];
    
}

- (void)zlchartReminViewWithEventModel:(ZLEventsModel *)eventModel{
    
    [self.dataArray addObject:eventModel];
    
    [self.mainTableView.mj_header beginRefreshing];
    
}


- (NSMutableAttributedString *)setTitle{
    
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc]initWithString:@"事件薄"];
    
    [title addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, title.length)];
    
    [title addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:20] range:NSMakeRange(0, title.length)];
    
    return title;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
