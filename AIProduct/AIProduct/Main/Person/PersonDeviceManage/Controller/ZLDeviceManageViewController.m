//
//  ZLDeviceManageViewController.m
//  AIProduct
//
//  Created by mac on 2017/8/3.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ZLDeviceManageViewController.h"
#import "ZLMyDeviceViewController.h"
#import "ZLShareDeviceViewController.h"
@interface ZLDeviceManageViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *mainTableView;
// 数据数组
@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation ZLDeviceManageViewController

- (NSArray *)dataArray{
    if (_dataArray == nil) {
        
        _dataArray = @[
                       @"我的设备",
                       @"共享设备",
                       ];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = HEXCOLOR(KStand_bkg_color);
    self.mainTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 74, App_Frame_Width, self.dataArray.count * 44) style:(UITableViewStylePlain)];
    self.mainTableView.bounces = NO;
    self.mainTableView.dataSource = self;
    self.mainTableView.delegate = self;
    self.mainTableView.separatorColor = HEXCOLORAndAlpha(KShadow_color_blue, 0.2) ;
    self.mainTableView.layer.shadowColor = HEXCOLOR(KShadow_color_blue).CGColor;
    self.mainTableView.clipsToBounds = false;
    self.mainTableView.layer.shadowOffset = CGSizeMake(0, 3);
    self.mainTableView.layer.shadowOpacity = 0.17;
    [self.mainTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"tableViewCell"];
    [self.view addSubview:self.mainTableView];
    
    
}

#pragma mark -- tableView代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tableViewCell" forIndexPath:indexPath];
    
    UIImageView *indicator = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"my_next"]];
    
    cell.accessoryView = indicator;
    
    cell.textLabel.font = AdaptedFontSize(32);
    cell.textLabel.textColor = HEXCOLOR(0x191919);
    
    
    cell.textLabel.text = self.dataArray[indexPath.row];
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
            
        case 0:
        {
            
            ZLMyDeviceViewController *myDeviceVC = [[ZLMyDeviceViewController alloc]init];
            [self.navigationController pushViewController:myDeviceVC animated:YES];
            
        }
            break;
            
        case 1:
        {
            
            ZLShareDeviceViewController *shareDeviceVC = [[ZLShareDeviceViewController alloc]init];
            [self.navigationController pushViewController:shareDeviceVC animated:YES];
            
        }
            
            break;
            
        default:
            break;
    }
    
    
}

- (NSMutableAttributedString *)setTitle{
    
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc]initWithString:@"我的设备"];
    
    [title addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, title.length)];
    
    [title addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:20] range:NSMakeRange(0, title.length)];
    
    return title;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
