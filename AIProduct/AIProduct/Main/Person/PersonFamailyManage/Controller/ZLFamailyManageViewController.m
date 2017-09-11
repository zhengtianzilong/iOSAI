//
//  ZLFamailyManageViewController.m
//  AIProduct
//
//  Created by mac on 2017/8/10.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ZLFamailyManageViewController.h"
#import "ZLFamailyBandInfoViewController.h"
#import "ZLFamailManageViewTableViewCell.h"
//#import "ZLFamailyBandCompleteViewController.h"
@interface ZLFamailyManageViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) UITableView *mainTableView;
@end

@implementation ZLFamailyManageViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)loadData{
    
    // 从网络请求数据
    __weak typeof(self)weakSelf = self;
    
    // 成功时
    [self.mainTableView reloadData];
    [self.mainTableView.mj_header endRefreshing];
    
    // 如果没有数据,则显示无按钮的空白展示页
    [self.view configWith:EaseBlankPageTypeNoButton hasData:self.dataArray.count hasError:self.dataArray.count > 0 tipsTitle:@"快去添加家人信息" nameImage:@"my_list" reloadButtonBlock:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = HEXCOLOR(KStand_bkg_color);
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    if (!self.dataArray) {
        self.dataArray = [[NSMutableArray alloc]init];
//        self.dataArray = @[@"2",@"3"];
    }
    
    if (!_mainTableView) {
        
        _mainTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, Main_Screen_Width, Main_Screen_Height - 64) style:(UITableViewStyleGrouped)];
        _mainTableView.backgroundColor = HEXCOLOR(KStand_bkg_color);
        _mainTableView.showsVerticalScrollIndicator = NO;
        _mainTableView.showsHorizontalScrollIndicator = NO;
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        [_mainTableView registerClass:[ZLFamailManageViewTableViewCell class] forCellReuseIdentifier:NSStringFromClass([ZLFamailManageViewTableViewCell class])];
        [self.view addSubview:_mainTableView];
        
        ZLWeakSelf(self);
        
        _mainTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            
            ZLStrongSelf(self);
            
            [self loadData];
        }];
        
        [_mainTableView.mj_header beginRefreshing];
    }
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ZLFamailManageViewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ZLFamailManageViewTableViewCell class]) forIndexPath:indexPath];
    
    cell.layer.shadowColor = HEXCOLOR(KShadow_color_blue).CGColor;
    cell.layer.shadowOffset = CGSizeMake(0, 2);
    
    cell.layer.shadowOpacity = 0.17;
    // 必须为no,不然出不来阴影
    cell.layer.masksToBounds = NO;
    
    cell.familyModel = self.dataArray[indexPath.section];
    
//    cell.textLabel.text   = self.dataArray[indexPath.row];
    return cell;

    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return AdaptedHeight(184);
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 5;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (NSMutableAttributedString *)setTitle{
    
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc]initWithString:@"家庭档案"];
    
    [title addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, title.length)];
    
    [title addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:20] range:NSMakeRange(0, title.length)];
    
    return title;
    
}

- (UIButton *)set_rightButton{
    
    UIButton *rightButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    
    rightButton.frame = CGRectMake(0, 0, 40, 40);
    
    [rightButton setTitle:@"添加" forState:(UIControlStateNormal)];
    
    return rightButton;
    
}


/**
 添加按钮点击事件
 */
- (void)right_button_event:(UIButton *)sender{
    
    ZLFamailyBandInfoViewController *bandVC = [[ZLFamailyBandInfoViewController alloc]init];
    
    
    bandVC.familyBandBlock = ^(ZLFamilyManagerModel *model) {
      
        [self.dataArray addObject:model];
        
        [_mainTableView.mj_header beginRefreshing] ;
        
    };
    
//    ZLFamailyBandCompleteViewController *comPleVC = [[ZLFamailyBandCompleteViewController alloc]init];
    [self.navigationController pushViewController:bandVC animated:YES];
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
