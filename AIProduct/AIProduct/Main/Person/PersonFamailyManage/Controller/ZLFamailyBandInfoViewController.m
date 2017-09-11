//
//  ZLFamailyBandInfoViewController.m
//  AIProduct
//
//  Created by mac on 2017/8/14.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ZLFamailyBandInfoViewController.h"
#import "ZLFamailyBandTableViewCell.h"
#import "UIAlertView+Block.h"
#import "ZLFamailyBandCompleteViewController.h"
//#import "MMAlertView.h"

@interface ZLFamailyBandInfoViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) UITableView *mainTableView;
@property (nonatomic, strong) UIButton *sureButton;

@property (nonatomic, strong) UIButton *userImageBtn;
@end

@implementation ZLFamailyBandInfoViewController

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    //移除通知中心
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:nil];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(famailChangeTextField:) name:UITextFieldTextDidChangeNotification object:nil];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
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
    
    
    // 确定按钮
    if (!_sureButton) {
        self.sureButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [self.sureButton setBackgroundImage:[UIImage imageWithColor:HEXCOLOR(KNormal_button_unpressed)] forState:(UIControlStateNormal)];
        self.sureButton.layer.cornerRadius = 5;
        self.sureButton.enabled = NO;
        self.sureButton.clipsToBounds = YES;
        [self.sureButton setBackgroundImage:[UIImage imageWithColor:HEXCOLOR(KNormal_button_pressed)] forState:(UIControlStateSelected)];
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
    
//    [self configAlertView];
    
    
}


///**
// 配置弹出框
// */
//- (void)configAlertView{
//    MMAlertViewConfig *alertConfig = [MMAlertViewConfig globalConfig];
//    alertConfig.width = AdaptedWidth(476);
//    alertConfig.backgroundColor = HEXCOLOR(KStand_bkg_color);
//    alertConfig.titleColor = HEXCOLOR(0x191919);
//    alertConfig.detailColor = HEXCOLOR(0x191919);
//    alertConfig.itemHighlightColor = HEXCOLOR(0x11ccf9);
//    alertConfig.itemNormalColor = HEXCOLOR(0x191919);
//    alertConfig.splitColor = HEXCOLORAndAlpha(0x11ccf9, 0.2);
//    alertConfig.itemPressedColor = HEXCOLOR(KStand_bkg_color);
//    alertConfig.titleFont = AdaptedFontSize(32);
//    alertConfig.detailFont = AdaptedFontSize(28);
//    alertConfig.buttonFont = AdaptedFontSize(28);
//    
//}



// 点击下一步按钮
- (void)sureButtonClick{
    
//    NSMutableArray *sourceArray = [NSMutableArray array];
    
    ZLFamilyManagerModel *familyModel = [[ZLFamilyManagerModel alloc]init];
    
    familyModel.imageString = @"";
    
    for (ZLFamailyBandTableViewCell *cell in _mainTableView.visibleCells) {
        
        if ([cell.titleLabel.text isEqualToString:@"姓名"]) {
            
            familyModel.name = cell.textField.text;
            
        }
        if ([cell.titleLabel.text isEqualToString:@"性别"]) {

            familyModel.sex = cell.textField.text;
        }
        
        if ([cell.titleLabel.text isEqualToString:@"年龄"]) {
            
            familyModel.age = cell.textField.text;
            
        }
        if ([cell.titleLabel.text isEqualToString:@"身高"]) {
            
            familyModel.height = cell.textField.text;
        }
        
        if ([cell.titleLabel.text isEqualToString:@"体重"]) {
            
            familyModel.weight = cell.textField.text;
            
        }
        if ([cell.titleLabel.text isEqualToString:@"id"]) {
            
            familyModel.idString = cell.textField.text;
        }
        
    }
    if (_familyBandBlock) {
        
        _familyBandBlock(familyModel);
        
    }
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
    
    
    
    
    
    
//    MMPopupItemHandler block = ^(NSInteger index){
//        
//        NSLog(@"%ld",(long)index);
//        
//        switch (index) {
//            case 0:
//            {
//                NSMutableArray *sourceArray = [NSMutableArray array];
//                for (ZLFamailyBandTableViewCell *cell in _mainTableView.visibleCells) {
//                    
//                    if ([cell.titleLabel.text isEqualToString:@"身高"]) {
//                        
//                        cell.textField.text = [NSString stringWithFormat:@"%@cm",cell.textField.text];
//                        
//                    }
//                    if ([cell.titleLabel.text isEqualToString:@"体重"]) {
//                        
//                        cell.textField.text = [NSString stringWithFormat:@"%@kg",cell.textField.text];
//                        
//                    }
//                    [sourceArray addObject:cell.textField.text];
//                }
//                ZLFamailyBandCompleteViewController *comPleVC = [[ZLFamailyBandCompleteViewController alloc]init];
//                comPleVC.rightSourceArray = sourceArray;
//                [self.navigationController pushViewController:comPleVC animated:YES];
//            }
//                break;
//            case 1:
//            {
//                NSLog(@"人脸识别");
//            }
//                break;  
//        }
//    };
//    MMPopupCompletionBlock compleBlock = ^(MMPopupView *popupView,BOOL finished){
//        
//        NSLog(@"finished");
//        
//    };
//    NSArray *items = @[
//                       MMItemMake(@"跳过此步",MMItemTypeNormal, block),
//                       MMItemMake(@"确定",MMItemTypeHighlight, block)
//                       ];
//    
//    MMAlertView *alertView = [[MMAlertView alloc]initWithTitle:@"添加李秀秀头像" detail:@"" items:items];
//    
//    alertView.attachedView.mm_dimBackgroundBlurEnabled = NO;
//    alertView.attachedView = self.view;
//    alertView.attachedView.mm_dimBackgroundBlurEffectStyle = UIBlurEffectStyleDark;
//    [alertView showWithBlock:compleBlock];
}



/**
 通知调用的文本框值变化的方法
 */
- (void)famailChangeTextField:(NSNotification *)notification{
    ZLFamailyBandTableViewCell *cell0 = _mainTableView.visibleCells[0];
    ZLFamailyBandTableViewCell *cell1 = _mainTableView.visibleCells[1];
    ZLFamailyBandTableViewCell *cell2 = _mainTableView.visibleCells[2];
    ZLFamailyBandTableViewCell *cell3 = _mainTableView.visibleCells[3];
    ZLFamailyBandTableViewCell *cell4 = _mainTableView.visibleCells[4];
    ZLFamailyBandTableViewCell *cell5 = _mainTableView.visibleCells[5];
    
    if (cell0.textField.text.length >0 &&
        cell1.textField.text.length >0 &&
        cell2.textField.text.length >0 &&
        cell3.textField.text.length >0 &&
        cell4.textField.text.length >0 &&
        cell5.textField.text.length >0) {
        
        self.sureButton.enabled = YES;
        
        self.sureButton.selected = YES;
        
    }else{
        self.sureButton.enabled = NO;
        
        self.sureButton.selected = NO;
    }
}


#pragma mark -- tableView代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArray.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ZLFamailyBandTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ZLFamailyBandTableViewCell class]) forIndexPath:indexPath];
    
    cell.title = self.dataArray[indexPath.row];
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
