//
//  ZLAddPersonViewController.m
//  AIProduct
//
//  Created by mac on 2017/8/22.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ZLAddPersonViewController.h"
#import "ZLPersonListTableViewCell.h"
#import "ZLPersonListModel.h"
@interface ZLAddPersonViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) UITableView *mainTableView;

@property (nonatomic, strong) NSMutableDictionary *sourceDic;

@end

@implementation ZLAddPersonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = HEXCOLOR(KStand_bkg_color);
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    if (!self.dataArray) {
        self.dataArray = [[NSArray alloc]init];
        //        self.dataArray = @[@"2",@"3"];
    }
    
    ZLPersonListModel *model1 = [[ZLPersonListModel alloc]init];
    model1.name = @"阿姨萍";
    model1.isStatus = YES;
    model1.isShareButton = YES;
    model1.isSelected = NO;
    
    ZLPersonListModel *model2 = [[ZLPersonListModel alloc]init];
    model2.name = @"Aunty";
    model2.isStatus = NO;
    model2.isShareButton = NO;
    model2.isSelected = NO;
    
    ZLPersonListModel *model3 = [[ZLPersonListModel alloc]init];
    model3.name = @"伯恩";
    model3.isStatus = YES;
    model3.isShareButton = YES;
    model3.isSelected = NO;
    
    _sourceDic = [NSMutableDictionary dictionary];
    
    [_sourceDic setObject:@[model1,model2] forKey:@"A"];
    [_sourceDic setObject:@[model3] forKey:@"B"];
    
    if (!_mainTableView) {
        
        _mainTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, Main_Screen_Width, Main_Screen_Height - 64) style:(UITableViewStylePlain)];
        _mainTableView.backgroundColor = HEXCOLOR(KStand_bkg_color);
        _mainTableView.showsVerticalScrollIndicator = NO;
        _mainTableView.showsHorizontalScrollIndicator = NO;
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        [_mainTableView registerClass:[ZLPersonListTableViewCell class] forCellReuseIdentifier:NSStringFromClass([ZLPersonListTableViewCell class])];
        _mainTableView.separatorColor = HEXCOLORAndAlpha(KShadow_color_blue, 0.2) ;
        [self.view addSubview:_mainTableView];
        
        ZLWeakSelf(self);
        
//        _mainTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
//            
//            ZLStrongSelf(self);
//            
////            [self loadData];
//        }];
//        
//        [_mainTableView.mj_header beginRefreshing];
    }

    
    
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _sourceDic.allKeys.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSString *key = _sourceDic.allKeys[section];
    
    NSArray *array = _sourceDic[key];
    
    return array.count;
    
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *headerView = [[UIView alloc]init];
    
//    headerView.backgroundColor =HEXCOLOR(KStand_bkg_color);
    
    UILabel *label = [[UILabel alloc]init];
    
    label.textColor = HEXCOLORAndAlpha(0x829da4, 0.75);
    
    label.font = AdaptedFontSize(22);
    label.text = _sourceDic.allKeys[section];
    label.frame =CGRectMake(AdaptedWidth(28), 0, AdaptedWidth(48), AdaptedHeight(58));
    
    [headerView addSubview:label];
    
    return headerView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ZLPersonListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ZLPersonListTableViewCell class]) forIndexPath:indexPath];
    
    NSString *key = _sourceDic.allKeys[indexPath.section];
    ZLPersonListModel *personModel =  _sourceDic[key][indexPath.row];
    
    NSArray *tempArray = _sourceDic[key];
    
    if (personModel == tempArray.lastObject) {
        
        cell.layer.shadowColor = HEXCOLOR(KShadow_color_blue).CGColor;
        cell.layer.shadowOffset = CGSizeMake(0, 2);
        
        cell.layer.shadowOpacity = 0.17;
        // 必须为no,不然出不来阴影
        cell.layer.masksToBounds = NO;
        
    }
    
    cell.personModel = personModel;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    
    
    return cell;
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return AdaptedHeight(125);
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return AdaptedHeight(58);
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
//    NSString *key = _sourceDic.allKeys[indexPath.section];
//    ZLPersonListModel *personModel =  _sourceDic[key][indexPath.row];
//    
//    NSLog(@"%ld%ld",indexPath.section,indexPath.row);
    
    
    
    ZLPersonListTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    cell.selectButton.selected = !cell.selectButton.selected;
    cell.personModel.isSelected = cell.selectButton.selected;
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- 导航栏设置
- (UIButton *)set_rightButton{
    
    UIButton *rightButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    
    rightButton.frame = CGRectMake(0, 0, 40, 40);
    
    [rightButton setTitle:@"完成" forState:(UIControlStateNormal)];
    
    return rightButton;
    
}

- (void)right_button_event:(UIButton *)sender{
    
    NSMutableArray *seleectedArray = [NSMutableArray array];
    
    for (NSInteger i = 0; i < _sourceDic.allValues.count; i++) {
        
        NSArray *modelArray = _sourceDic.allValues[i];
        
        for (ZLPersonListModel *model in modelArray) {
            
            if (model.isSelected) {
                [seleectedArray addObject:model];
            }

        }
        
    }
    if (_selectedModelBlock) {
        _selectedModelBlock(seleectedArray);
        
        [self.navigationController popViewControllerAnimated:YES];
        
    }
    
    
    
}


- (NSMutableAttributedString *)setTitle{
    
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc]initWithString:@"添加群聊"];
    
    [title addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, title.length)];
    
    [title addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:20] range:NSMakeRange(0, title.length)];
    
    return title;
    
}


@end
