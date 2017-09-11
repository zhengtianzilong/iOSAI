//
//  ZLHomeViewController.m
//  AIProduct
//
//  Created by mac on 2017/8/2.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ZLHomeViewController.h"
#import "ZLHomeTopView.h"
#import "ZLHomeTipsView.h"
#import "ZLHomeBottomView.h"
#import "ZLHomeBottomModel.h"
#import "SDCycleScrollView.h"
#import "ZLBottomLoopCollectionViewCell.h"
#import "ZLMonitorViewController.h"
@interface ZLHomeViewController ()<SDCycleScrollViewDelegate>

@property (nonatomic, strong) NSArray *bottomArray;

@end

@implementation ZLHomeViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = HEXCOLOR(KStand_bkg_color);
    ZLHomeTopView *topHomeView = [[ZLHomeTopView alloc]init];
    
    [topHomeView.eyeButton addTarget:self action:@selector(eyeBtnClick) forControlEvents:(UIControlEventTouchUpInside)];
    
    [self.view addSubview:topHomeView];
    
    [topHomeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view.mas_right);
        make.top.equalTo(self.view.mas_top).offset(0);
        make.height.mas_equalTo(AdaptedHeight(648));
    }];
    
    ZLHomeTipsView *tipsView = [[ZLHomeTipsView alloc]init];
    
    [self.view addSubview:tipsView];
    
    [tipsView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.view).offset(AdaptedWidth(28));
        make.top.equalTo(topHomeView.mas_bottom).offset(AdaptedHeight(28));
        make.height.mas_equalTo(AdaptedHeight(116));
        make.width.mas_equalTo(AdaptedWidth(694));
    }];
    
    
    ZLHomeBottomModel *model = [[ZLHomeBottomModel alloc]init];
    model.weathValue = @"32";
    model.symbol = @"°C";
    model.title = @"天气";
    model.hexColor = HEXCOLOR(0x11ccf9);
    
    ZLHomeBottomModel *model1 = [[ZLHomeBottomModel alloc]init];
    model1.weathValue = @"22";
    model1.symbol = @"°C";
    model1.title = @"室温";
    model1.hexColor = HEXCOLOR(0xf9aa11);
    
    ZLHomeBottomModel *model2 = [[ZLHomeBottomModel alloc]init];
    model2.weathValue = @"92";
    model2.symbol = @"%";
    model2.title = @"空气";
    model2.hexColor = HEXCOLOR(0x53f6B7);
    
    _bottomArray = @[@[model,model1,model2],@[model,model1,model2],@[model,model1,model2]];

    
    SDCycleScrollView *customScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectZero delegate:self placeholderImage:nil];
    [self.view addSubview:customScrollView];
    [customScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.view);
                make.right.equalTo(self.view.mas_right);
                make.top.equalTo(tipsView.mas_bottom).offset(10);
                make.height.mas_equalTo(AdaptedHeight(350));
    }];
    
    customScrollView.pageControlDotSize = CGSizeMake(AdaptedWidth(16), AdaptedHeight(16));
    customScrollView.currentPageDotColor = HEXCOLORAndAlpha(0x11ccf9, 0.5);
    customScrollView.pageDotColor = HEXCOLORAndAlpha(0xaeb8ba, 0.5);
    
    customScrollView.imageURLStringsGroup = @[@"",@"",@""];
    
    
    
}

- (void)eyeBtnClick{
    
    ZLMonitorViewController *monitorVC = [[ZLMonitorViewController alloc]init];
    [self.navigationController pushViewController:monitorVC animated:YES];
    
    
}

/** 如果你需要自定义cell样式，请在实现此代理方法返回你的自定义cell的class。 */
- (Class)customCollectionViewCellClassForCycleScrollView:(SDCycleScrollView *)view{
    
    return  [ZLBottomLoopCollectionViewCell class];
    
}

/** 如果你自定义了cell样式，请在实现此代理方法为你的cell填充数据以及其它一系列设置 */
- (void)setupCustomCell:(UICollectionViewCell *)cell forIndex:(NSInteger)index cycleScrollView:(SDCycleScrollView *)view{
    
    ZLBottomLoopCollectionViewCell *customCell = (ZLBottomLoopCollectionViewCell *)cell;
    customCell.modelArray = _bottomArray[index];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
