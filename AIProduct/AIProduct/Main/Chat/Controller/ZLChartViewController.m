//
//  ZLChartViewController.m
//  AIProduct
//
//  Created by mac on 2017/8/2.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ZLChartViewController.h"
#import "ZLChartAITopView.h"
#import "ZLChartInfoTableViewCell.h"
#import "ZLChartBottomRemindView.h"
#import "ZLChartRemindViewController.h"
#import "ZLChartEventsViewController.h"
#import "ZLChartDetailMessageViewController.h"
#import "ZLAddPersonViewController.h"
#import "ZLVideoPersonModel.h"
#import "ZLPersonListModel.h"
@interface ZLChartViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) UITableView *mainTableView;
@property (nonatomic, strong) ZLChartRemindViewController *remindVC;
@end

@implementation ZLChartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = HEXCOLOR(KStand_bkg_color);
    
    ZLChartAITopView *topView = [[ZLChartAITopView alloc]init];
    
    [self.view addSubview:topView];
    
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(self.view).offset(0);
        make.top.equalTo(self.view).offset(64);
        make.width.mas_equalTo(App_Frame_Width);
        make.height.mas_equalTo(AdaptedHeight(74));
        
    }];
    
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    if (!self.dataArray) {
        self.dataArray = [NSMutableArray array];
        ZLVideoPersonModel *personModel = [[ZLVideoPersonModel alloc]init];
        personModel.name = @"小智家";
        personModel.detailTitle = @"今天天气很热,提醒服务多喝水哦,记得通风...";
        
        [self.dataArray addObject:personModel];;

    }
    
    if (!_mainTableView) {
        
        _mainTableView = [[UITableView alloc]initWithFrame:CGRectZero style:(UITableViewStyleGrouped)];
        _mainTableView.backgroundColor = HEXCOLOR(KStand_bkg_color);
        _mainTableView.showsVerticalScrollIndicator = NO;
        _mainTableView.showsHorizontalScrollIndicator = NO;
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        _mainTableView.separatorColor = [UIColor whiteColor];
        [_mainTableView registerClass:[ZLChartInfoTableViewCell class] forCellReuseIdentifier:NSStringFromClass([ZLChartInfoTableViewCell class])];
        [self.view addSubview:_mainTableView];
        
        [_mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.left.equalTo(self.view);
            make.right.equalTo(self.view.mas_right);
            make.top.equalTo(topView.mas_bottom).offset(1);
            make.bottom.equalTo(self.view.mas_bottom);
            
        }];
        
    }

    
    UIButton *button = [[UIButton alloc] init];
    button.layer.cornerRadius = 21.5;
    [button addTarget:self action:@selector(clickAddButton:) forControlEvents:UIControlEventTouchUpInside];
    [button setImage:[UIImage imageNamed:@"chat_add_mark"] forState:UIControlStateNormal];
    [self.view addSubview:button];

    [button mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.right.equalTo(self.view.mas_right).offset(-AdaptedWidth(52));
        make.bottom.equalTo(self.view.mas_bottom).offset(-AdaptedHeight(143));
        make.width.mas_equalTo(AdaptedWidth(86));
        make.height.mas_equalTo(AdaptedHeight(86));
    }];
}

- (void)clickAddButton:(UIButton *)sender{
    
    ZLChartBottomRemindView *remindView = [[ZLChartBottomRemindView alloc]initWithFrame:CGRectMake(0, 0, App_Frame_Width, self.view.bounds.size.height)];
    
    [[UIApplication sharedApplication].keyWindow addSubview:remindView];
    
    remindView.remindBlock = ^{
        
        _remindVC = [[ZLChartRemindViewController alloc]init];
        
        [self.navigationController pushViewController:_remindVC animated:YES];
        
    };
    
    remindView.eventBlock = ^{
        ZLChartEventsViewController *eventsVC = [[ZLChartEventsViewController alloc]init];
        
        [self.navigationController pushViewController:eventsVC animated:YES];
    };
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ZLChartInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ZLChartInfoTableViewCell class]) forIndexPath:indexPath];
    
    ZLVideoPersonModel *personModel = _dataArray[indexPath.section];
    
    cell.personModel = personModel;

    

    return cell;
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return AdaptedHeight(126);
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 5;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    ZLChartDetailMessageViewController *message = [[ZLChartDetailMessageViewController alloc]init];
    [self.navigationController pushViewController:message animated:YES];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark -- 导航栏设置
- (NSMutableAttributedString *)setTitle{
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc]initWithString:@"聊天"];
    [string addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0,string.length)];
    
    [string addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:18] range:NSMakeRange(0, string.length)];
    
    return string;
}

- (UIButton *)set_rightButton{
    UIImage* addImage = [[UIImage imageNamed:@"chat_nav_add"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIButton* addButton = [[UIButton alloc] init];
    [addButton setTitle:@"群聊" forState:(UIControlStateNormal)];
   
    [addButton setImage:addImage forState:UIControlStateNormal];
    
    CGFloat labelWidth = [addButton.titleLabel.text sizeWithFont:addButton.titleLabel.font].width;
    [addButton setTitleEdgeInsets:UIEdgeInsetsMake(0, -addImage.size.width, 0,addImage.size.width)];
    [addButton setImageEdgeInsets:UIEdgeInsetsMake(0, labelWidth, 0, -labelWidth)];
    
    addButton.adjustsImageWhenHighlighted = NO;
    
    [addButton sizeToFit];
    
    return  addButton;
}

- (void)right_button_event:(UIButton *)sender{
    
    ZLAddPersonViewController *addPersonVC = [[ZLAddPersonViewController alloc]init];
    
    __weak typeof(self) weakSelf = self;
    addPersonVC.selectedModelBlock = ^(NSArray *modelArray) {
        ZLVideoPersonModel *personModel = [[ZLVideoPersonModel alloc]init];
        personModel.detailTitle = @"";
        for (int i = 0; i < modelArray.count; i++) {
            
            ZLPersonListModel *listModel = modelArray[i];
            
            personModel.name = @"群聊";
            
            personModel.detailTitle = [personModel.detailTitle stringByAppendingString:listModel.name];
            
        }
        [_dataArray addObject:personModel];
        
        [weakSelf.mainTableView reloadData];
        
    };
    
    [self.navigationController pushViewController:addPersonVC animated:YES];
    
}


- (UIButton *)set_leftButton{
    return nil;
}

- (UIColor *)set_colorBackground{
    
    return HEXCOLOR(KNavBarBG_color_blue);
    
}


@end
