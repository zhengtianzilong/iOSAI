//
//  ZLFamailyBandCompleteViewController.m
//  AIProduct
//
//  Created by mac on 2017/8/14.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ZLFamailyBandCompleteViewController.h"
#import "ZLFamailyBandTableViewCell.h"
#import "ZLFamailyManageViewController.h"
@interface ZLFamailyBandCompleteViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) UITableView *mainTableView;
@property (nonatomic, strong) UIButton *sureButton;
@property (nonatomic, strong) UIButton *userImageBtn;

@end

@implementation ZLFamailyBandCompleteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    if (!self.dataArray) {
        self.dataArray = @[@"姓名",@"性别",@"年龄",@"身高",@"体重",@"id"];
    }
    
    
    self.userImageBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    self.userImageBtn.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:self.userImageBtn];
    
    self.userImageBtn.layer.shadowColor = HEXCOLOR(KShadow_color_blue).CGColor;
    self.userImageBtn.layer.shadowOffset = CGSizeMake(0, 3);
    self.userImageBtn.layer.shadowOpacity = 0.17;
    self.userImageBtn.layer.cornerRadius = AdaptedWidth(76);
    self.userImageBtn.layer.masksToBounds = false;
    
    [self.userImageBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view.mas_top).offset(AdaptedHeight(198));
        
        make.width.mas_equalTo(AdaptedWidth(152));
        make.height.mas_equalTo(AdaptedHeight(152));
        
    }];


    if (!_mainTableView) {
        
        self.view.backgroundColor = HEXCOLOR(KStand_bkg_color);
        self.mainTableView = [[UITableView alloc]initWithFrame:CGRectZero style:(UITableViewStylePlain)];
        self.mainTableView.bounces = NO;
        self.mainTableView.dataSource = self;
        self.mainTableView.delegate = self;
        self.mainTableView.separatorColor = HEXCOLORAndAlpha(KShadow_color_blue, 0.2) ;
        self.mainTableView.layer.shadowColor = HEXCOLOR(KShadow_color_blue).CGColor;
        self.mainTableView.clipsToBounds = false;
        self.mainTableView.layer.shadowOffset = CGSizeMake(0, 3);
        self.mainTableView.layer.shadowOpacity = 0.17;
        [_mainTableView registerClass:[ZLFamailyBandTableViewCell class] forCellReuseIdentifier:NSStringFromClass([ZLFamailyBandTableViewCell class])];
        [self.view addSubview:_mainTableView];
        
        [self.mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo (self.view);
            make.right.equalTo(self.view.mas_right);
            make.top.equalTo(self.userImageBtn.mas_bottom).offset(20);
            make.height.mas_equalTo(_dataArray.count * 44);
        }];
        
    }
    
    
    // 下一步
    if (!_sureButton) {
        self.sureButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
//        [self.sureButton setBackgroundImage:[UIImage imageWithColor:HEXCOLOR(KNormal_button_unpressed)] forState:(UIControlStateNormal)];
        self.sureButton.layer.cornerRadius = 5;
        self.sureButton.clipsToBounds = YES;
        self.sureButton.adjustsImageWhenHighlighted = YES;
        [self.sureButton setBackgroundImage:[UIImage imageWithColor:HEXCOLOR(KNormal_button_pressed)] forState:(UIControlStateNormal)];
        [self.sureButton setTitle:@"确定" forState:(UIControlStateNormal)];
        self.sureButton.titleLabel.font = AdaptedFontSize(36);
        [self.sureButton addTarget:self action:@selector(sureButtonClick) forControlEvents:(UIControlEventTouchUpInside)];
        [self.view addSubview:self.sureButton];
        
        [self.sureButton mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerX.equalTo(self.view);
            make.top.equalTo(self.mainTableView.mas_bottom).offset(AdaptedHeight(92));
            make.height.equalTo(AdaptedHeight(90));
            make.width.equalTo(AdaptedWidth(694));
            
        }];
        
    }
    
    
}


/**
 点击确定按钮
 */
- (void)sureButtonClick{
    
    // 导航控制器返回指定的控制器
    for (UIViewController *controller in self.navigationController.viewControllers) {
        if ([controller isKindOfClass:[ZLFamailyManageViewController class]]) {
            ZLFamailyManageViewController *manageVC = (ZLFamailyManageViewController *)controller;
            [self.navigationController popToViewController:manageVC animated:YES];
        }
    }
    
    
}

#pragma mark -- tableView代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArray.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ZLFamailyBandTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ZLFamailyBandTableViewCell class]) forIndexPath:indexPath];
    
    cell.title = self.dataArray[indexPath.row];
    cell.textField.text = _rightSourceArray[indexPath.row];
    cell.textField.enabled = NO;
    return cell;
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}


- (NSMutableAttributedString *)setTitle{
    
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc]initWithString:@"家庭信息绑定"];
    
    [title addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, title.length)];
    
    [title addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:20] range:NSMakeRange(0, title.length)];
    
    return title;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
