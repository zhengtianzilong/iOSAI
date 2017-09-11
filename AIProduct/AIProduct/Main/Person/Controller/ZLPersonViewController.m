//
//  ZLPersonViewController.m
//  AIProduct
//
//  Created by mac on 2017/8/2.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ZLPersonViewController.h"
#import "ZLPersonTopView.h"
#import "UIView+Frame.h"
#import "ZLPersonAccountViewController.h"
#import "ZLDeviceManageViewController.h"
#import "ZLLoginViewController.h"
#import "ZLFamailyManageViewController.h"
@interface ZLPersonViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) ZLPersonTopView *personTopView;


@property (nonatomic, strong) UITableView *mainTableView;

// 数据数组
@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation ZLPersonViewController


- (NSArray *)dataArray{
    if (_dataArray == nil) {
        
        _dataArray = @[
                       @[@"账号管理",
                       @"家庭档案",],
                       
                       @[@"设备管理",],
                       @[@"意见反馈",
                       @"退出登录",]
                       ];
        
    }
    
    return _dataArray;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = HEXCOLOR(KStand_bkg_color);
    
    self.personTopView = [[ZLPersonTopView alloc]initWithFrame:CGRectMake(0, 0, App_Frame_Width, AdaptedHeight(486))];
    [self.view addSubview:self.personTopView];
    
    self.mainTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, self.personTopView.bottom, App_Frame_Width, App_Frame_Height - self.personTopView.bottom - 44) style:(UITableViewStyleGrouped)];
    self.mainTableView.backgroundColor = HEXCOLOR(KStand_bkg_color);
    [self.mainTableView setSeparatorColor:HEXCOLORAndAlpha(0x11ccf9, 0.2)];
    self.mainTableView.dataSource = self;
    self.mainTableView.delegate = self;
    [self.mainTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"tableViewCell"];
    [self.view addSubview:self.mainTableView];
}



#pragma mark -- tableView代理

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSArray *tempArray = self.dataArray[section];
    
    return tempArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tableViewCell" forIndexPath:indexPath];
    
    cell.textLabel.font = AdaptedFontSize(32);
    cell.textLabel.textColor = HEXCOLOR(0x191919);
    
//    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    UIImageView *indicator = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"my_next"]];
    
    cell.accessoryView = indicator;
    
    NSArray *tempArray = self.dataArray[indexPath.section];
    cell.textLabel.text = tempArray[indexPath.row];
    
    if (tempArray[indexPath.row] == tempArray.lastObject) {
        
        cell.layer.shadowColor = HEXCOLOR(KShadow_color_blue).CGColor;
        cell.layer.shadowOffset = CGSizeMake(0, 2);
        
        cell.layer.shadowOpacity = 0.17;
        // 必须为no,不然出不来阴影
        cell.layer.masksToBounds = NO;
        
    }
    
    
    
    
   
    
    return cell;
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
     return 1.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return AdaptedHeight(24);
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        
        switch (indexPath.row) {
            case 0:{
                ZLPersonAccountViewController *personAccount = [[ZLPersonAccountViewController alloc]init];
                [self.navigationController pushViewController:personAccount animated:YES];
            }
                break;
            case 1:{
                ZLFamailyManageViewController *famailyVC = [[ZLFamailyManageViewController alloc]init];
                [self.navigationController pushViewController:famailyVC animated:YES];
            }
                break;

        }
    }
    
    if (indexPath.section == 1) {
        
        switch (indexPath.row) {
            case 0:{
                ZLDeviceManageViewController *personDevice = [[ZLDeviceManageViewController alloc]init];
                [self.navigationController pushViewController:personDevice animated:YES];
            }
                break;
     
        }
    }
    if (indexPath.section == 2) {
        
        switch (indexPath.row) {
            case 0:{
                ZLPersonAccountViewController *personAccount = [[ZLPersonAccountViewController alloc]init];
                [self.navigationController pushViewController:personAccount animated:YES];
            }
                break;

            case 1:{
                ZLLoginViewController *loginVC = [[ZLLoginViewController alloc]init];
                
                UINavigationController *loginNav = [[UINavigationController alloc]initWithRootViewController:loginVC];
                
                [self presentViewController:loginNav animated:NO completion:nil];
            }
                break;
            default:
                break;
        }
    }

    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
