//
//  ZLVideoViewController.m
//  AIProduct
//
//  Created by mac on 2017/8/2.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ZLVideoViewController.h"
#import "ZLChartAITopView.h"
#import "ZLVideoInfoTableViewCell.h"
#import "ZLVideoChatView.h"
#import "ZLAddPersonViewController.h"
#import "ZLPersonListModel.h"
#import "ZLVideoPersonModel.h"
#import "ZLVideoWaitView.h"
@interface ZLVideoViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) UITableView *mainTableView;

@property (nonatomic, strong) ZLVideoWaitView *videoWaitView;
@property (nonatomic, strong) ZLVideoChatView *videoChatView;


@end

@implementation ZLVideoViewController

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
        [_mainTableView registerClass:[ZLVideoInfoTableViewCell class] forCellReuseIdentifier:NSStringFromClass([ZLVideoInfoTableViewCell class])];
        [self.view addSubview:_mainTableView];
        
        [_mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(self.view);
            make.right.equalTo(self.view.mas_right);
            make.top.equalTo(topView.mas_bottom).offset(1);
            make.bottom.equalTo(self.view.mas_bottom);
            
        }];
        
    }
    
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ZLVideoInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ZLVideoInfoTableViewCell class]) forIndexPath:indexPath];
    
    ZLVideoPersonModel *personModel = _dataArray[indexPath.section];
    
    cell.personModel = personModel;
    
    [cell.inviteBtn addTarget:self action:@selector(inviteClick) forControlEvents:(UIControlEventTouchUpInside)];
    //    cell.textLabel.text   = self.dataArray[indexPath.row];
    
    
    return cell;
    
    
}


/**
 视频邀请按钮点击事件
 */
- (void)inviteClick{
    
    _videoWaitView = [[ZLVideoWaitView alloc]initWithFrame:self.view.bounds];
    
    [_videoWaitView.cancelBtn addTarget:self action:@selector(cancelClick:) forControlEvents:(UIControlEventTouchUpInside)];
    
    _videoChatView = [[ZLVideoChatView alloc]initWithFrame:self.view.bounds];
    [_videoChatView.cancelBtn addTarget:self action:@selector(cancelClick:) forControlEvents:(UIControlEventTouchUpInside)];

    [UIView animateWithDuration:2 animations:^{
        [[UIApplication sharedApplication].keyWindow addSubview:_videoWaitView];
    } completion:^(BOOL finished) {
        
        dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0/*延迟执行时间*/ * NSEC_PER_SEC));
        
        dispatch_after(delayTime, dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:1 animations:^{
                
                [_videoWaitView removeFromSuperview];

                [[UIApplication sharedApplication].keyWindow addSubview:_videoChatView];

//                _videoChatView.tipsLabel.hidden = YES;
//                _videoChatView.bgimageV.hidden = NO;
//                _videoChatView.addBtn.hidden = NO;
//                _videoChatView.microphoneBtn.hidden = NO;
//                _videoChatView.voiceBtn.hidden = NO;
//                _videoChatView.recodBtn.hidden = NO;
//                _videoChatView.cameraBtn.hidden = NO;
//                _videoChatView.addVideoView.hidden = NO;
            }];

        });

        
       
    }];
 
    
}


/**
 视频取消按钮
 */
- (void)cancelClick:(UIButton *)sender{
    
    [sender.superview removeFromSuperview];
    
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
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- 导航栏设置
- (NSMutableAttributedString *)setTitle{
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc]initWithString:@"视频"];
    [string addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0,string.length)];
    
    [string addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:18] range:NSMakeRange(0, string.length)];
    
    return string;
}

- (UIButton *)set_rightButton{
    UIImage* addImage = [[UIImage imageNamed:@"chat_nav_add"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIButton* addButton = [[UIButton alloc] init];
    [addButton setTitle:@"群视频" forState:(UIControlStateNormal)];
    
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

