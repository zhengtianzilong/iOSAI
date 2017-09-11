//
//  ZLPersonAccountViewController.m
//  AIProduct
//
//  Created by mac on 2017/8/2.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ZLPersonAccountViewController.h"
#import "ZLPersonChangePhoneViewController.h"
#import "ZLChangePasswordViewController.h"
#import "ZLPersonInfoViewController.h"
@interface ZLPersonAccountViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *mainTableView;
// 数据数组
@property (nonatomic, strong) NSArray *dataArray;

// 退出登录按钮
@property (nonatomic, strong) UIButton *exitLoginButton;


@end

@implementation ZLPersonAccountViewController

- (NSArray *)dataArray{
    if (_dataArray == nil) {
        
        _dataArray = @[
                       @"个人资料",
                       @"密码修改",
                       @"更换绑定手机号",
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
    
    
    // 登录
    self.exitLoginButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.exitLoginButton setBackgroundImage:[UIImage imageWithColor:HEXCOLOR(KNormal_button_unpressed)] forState:(UIControlStateNormal)];
    self.exitLoginButton.layer.cornerRadius = 4;
    self.exitLoginButton.clipsToBounds = YES;
    [self.exitLoginButton setBackgroundImage:[UIImage imageWithColor:HEXCOLOR(KNormal_button_pressed)] forState:(UIControlStateHighlighted)];
    [self.exitLoginButton setTitle:@"退出登录" forState:(UIControlStateNormal)];
    self.exitLoginButton.titleLabel.font = AdaptedFontSize(36);
    [self.view addSubview:self.exitLoginButton];
    
    [self.exitLoginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.mainTableView.mas_bottom).offset(AdaptedHeight(92));
        make.height.equalTo(AdaptedHeight(90));
        make.width.equalTo(AdaptedWidth(694));
        
    }];

    

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
        case 0:{
            
            ZLPersonInfoViewController *infoVC = [[ZLPersonInfoViewController alloc]init];
            [self.navigationController pushViewController:infoVC animated:YES];
            
        }
            break;
        case 1:{
            
            ZLChangePasswordViewController *changePasswordVC = [[ZLChangePasswordViewController alloc]init];
            [self.navigationController pushViewController:changePasswordVC animated:YES];
            
        }
            
            break;
            
        case 2:{
            
            ZLPersonChangePhoneViewController *changePhoneVC = [[ZLPersonChangePhoneViewController alloc]init];
            [self.navigationController pushViewController:changePhoneVC animated:YES];
            
        }
            
            break;
            
        default:
            break;
    }
    
    
}


- (NSMutableAttributedString *)setTitle{
    
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc]initWithString:@"账号管理"];
    
    [title addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, title.length)];
    
    [title addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:20] range:NSMakeRange(0, title.length)];
    
    return title;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
