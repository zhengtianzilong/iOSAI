//
//  ZLShareDeviceViewController.m
//  AIProduct
//
//  Created by mac on 2017/8/14.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ZLShareDeviceViewController.h"
#import "ZLShareDeviceTableViewCell.h"
@interface ZLShareDeviceViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) UITableView *mainTableView;

@end

@implementation ZLShareDeviceViewController

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
    [self.view configWith:EaseBlankPageTypeNoButton hasData:self.dataArray.count hasError:self.dataArray.count > 0 tipsTitle:@"快去我的设备中添加设备吧" nameImage:@"my_list" reloadButtonBlock:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = HEXCOLOR(KStand_bkg_color);
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    if (!self.dataArray) {
        self.dataArray = [[NSArray alloc]init];
                self.dataArray = @[@"2",@"3"];
    }
    
    if (!_mainTableView) {
        
        _mainTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, Main_Screen_Width, self.dataArray.count * 44) style:(UITableViewStylePlain)];
        _mainTableView.backgroundColor = HEXCOLOR(KStand_bkg_color);
        _mainTableView.showsVerticalScrollIndicator = NO;
        _mainTableView.showsHorizontalScrollIndicator = NO;
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        self.mainTableView.separatorColor = HEXCOLORAndAlpha(KShadow_color_blue, 0.2) ;
        self.mainTableView.layer.shadowColor = HEXCOLOR(KShadow_color_blue).CGColor;
        self.mainTableView.clipsToBounds = false;
        self.mainTableView.layer.shadowOffset = CGSizeMake(0, 3);
        self.mainTableView.layer.shadowOpacity = 0.17;

        [_mainTableView registerClass:[ZLShareDeviceTableViewCell class] forCellReuseIdentifier:NSStringFromClass([ZLShareDeviceTableViewCell class])];
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
    
   return self.dataArray.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ZLShareDeviceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ZLShareDeviceTableViewCell class]) forIndexPath:indexPath];
    cell.cellview = self.view;
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    //    cell.textLabel.text   = self.dataArray[indexPath.row];
    return cell;
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return AdaptedHeight(98);
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

- (NSMutableAttributedString *)setTitle{
    
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc]initWithString:@"共享设备"];
    
    [title addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, title.length)];
    
    [title addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:20] range:NSMakeRange(0, title.length)];
    
    return title;
    
}

@end
