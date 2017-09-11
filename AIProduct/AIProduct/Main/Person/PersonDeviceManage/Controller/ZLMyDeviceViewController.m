//
//  ZLMyDeviceViewController.m
//  AIProduct
//
//  Created by mac on 2017/8/14.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ZLMyDeviceViewController.h"
#import "MMAlertView.h"
#import "ZLMyDeviceModel.h"
@interface ZLMyDeviceViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) UITableView *mainTableView;

@property (nonatomic, strong) MMAlertView *alertView;


@end

@implementation ZLMyDeviceViewController

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
    [self.view configWith:EaseBlankPageTypeNoButton hasData:self.dataArray.count hasError:self.dataArray.count > 0 tipsTitle:@"快去添加设备信息" nameImage:@"my_list" reloadButtonBlock:nil];
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
        [_mainTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
        [self.view addSubview:_mainTableView];
        
        ZLWeakSelf(self);
        
        _mainTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            
            ZLStrongSelf(self);
            
            [self loadData];
        }];
        
        [_mainTableView.mj_header beginRefreshing];
    }
    
    [self configAlertView];
    
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    
    cell.layer.shadowColor = HEXCOLOR(KShadow_color_blue).CGColor;
    cell.clipsToBounds = false;
    cell.layer.shadowOffset = CGSizeMake(0, 1);
    cell.layer.shadowOpacity = 0.17;
    ZLMyDeviceModel *model = self.dataArray[indexPath.row];
    cell.textLabel.text = model.title;
    return cell;
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return AdaptedHeight(88);
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        
        return 10;
        
    }else{
        return 1;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.3;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (NSMutableAttributedString *)setTitle{
    
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc]initWithString:@"我的设备"];
    
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
    
    MMPopupCompletionBlock completionBlock = ^(MMPopupView *popupView,BOOL finished){
        self.navigationItem.rightBarButtonItem.enabled = !popupView.visible;
//        NSLog(@"%d",popupView.visible);
    };
    
    MMPopupItemHandler block = ^(NSInteger index){
        self.navigationItem.rightBarButtonItem.enabled = YES;
//        NSLog(@"%ld",(long)index);
        
    };
    
    NSArray *items =@[
                      MMItemMake(@"取消", MMItemTypeNormal, block),
                      MMItemMake(@"确定", MMItemTypeHighlight, block)
                      ];
    self.alertView = [[MMAlertView alloc]initWithTitle:@"设备添加" detail:nil items:items inputPlaceholder:@"请输入设备id信息进行验证" inputHandler:^(NSString *text) {
        self.navigationItem.rightBarButtonItem.enabled = YES;
        if (text.length > 0) {
            ZLMyDeviceModel *model = [[ZLMyDeviceModel alloc]init];
            model.title = text;
            [self.dataArray addObject:model];
            [self.mainTableView.mj_header beginRefreshing];
        }

        NSLog(@"%@",text);

    }];

        self.alertView.attachedView = self.view;
        self.alertView.attachedView.mm_dimBackgroundBlurEnabled = NO;
        self.alertView.attachedView.mm_dimBackgroundBlurEffectStyle = UIBlurEffectStyleDark;
        [self.alertView showWithBlock:completionBlock];

    
    
}

/**
 配置弹出框
 */
- (void)configAlertView{
    MMAlertViewConfig *alertConfig = [MMAlertViewConfig globalConfig];
    alertConfig.width = AdaptedWidth(476);
    alertConfig.backgroundColor = HEXCOLOR(KStand_bkg_color);
    alertConfig.titleColor = HEXCOLOR(0x191919);
    alertConfig.detailColor = HEXCOLOR(0x191919);
    alertConfig.titleFont = AdaptedFontSize(32);
    alertConfig.detailFont = AdaptedFontSize(28);
    alertConfig.buttonFont = AdaptedFontSize(28);
    alertConfig.itemHighlightColor = HEXCOLOR(0x11ccf9);
    alertConfig.itemNormalColor = HEXCOLOR(0x191919);
    alertConfig.splitColor = HEXCOLORAndAlpha(0x11ccf9, 0.2);
    alertConfig.itemPressedColor = HEXCOLOR(KStand_bkg_color);
    alertConfig.innerMargin = 10;
    alertConfig.textFieldTextColor = HEXCOLOR(0x11ccf9);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
