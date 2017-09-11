//
//  ZLMonitorViewController.m
//  AIProduct
//
//  Created by mac on 2017/8/21.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ZLMonitorViewController.h"
#import "ZLVideoAndPhotoBottomVIew.h"
#import "ZLMonitorTipsOpenView.h"
#import "ZLMonitorCustomVideoView.h"
@interface ZLMonitorViewController ()

@property (nonatomic, strong) ZLVideoAndPhotoBottomVIew *bottomView;
@property (nonatomic, strong) ZLMonitorTipsOpenView *tipsView;
@property (nonatomic, strong) ZLMonitorCustomVideoView *monitorView;
@end

@implementation ZLMonitorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _tipsView = [[ZLMonitorTipsOpenView alloc]initWithFrame:CGRectZero];
    
    [self.view addSubview:_tipsView];
    
    [_tipsView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.view);
        make.right.equalTo(self.view.mas_right);
        make.top.equalTo(self.view.mas_top).offset(64);
        make.height.mas_equalTo(AdaptedHeight(868));
        
    }];

    _bottomView = [[ZLVideoAndPhotoBottomVIew alloc]initWithFrame:CGRectZero];
    
    [_bottomView.videoBtn addTarget:self action:@selector(videoClick) forControlEvents:(UIControlEventTouchUpInside)];
    [_bottomView.startVideoBtn addTarget:self action:@selector(startVideo) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:_bottomView];
    
    [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.view);
        make.right.equalTo(self.view.mas_right);
        make.bottom.equalTo(self.view.mas_bottom);
        make.height.mas_equalTo(AdaptedHeight(340));
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/**
 点击拍摄按钮
 */
- (void)videoClick{
    
    [UIView animateWithDuration:1 animations:^{
        
        _bottomView.videoBtn.hidden = YES;
        _bottomView.photoBtn.hidden = YES;
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:1 animations:^{
            
            _bottomView.startVideoBgView.hidden = NO;
            
        } completion:nil];
        
    }];
    
    
}


/**
 开始录像按钮
 */
- (void)startVideo{
    
    _bottomView.startVideoBtn.selected = !_bottomView.startVideoBtn.selected;
    
    
}

#pragma mark -- 导航栏设置
- (NSMutableAttributedString *)setTitle{
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc]initWithString:@"监控"];
    [string addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0,string.length)];
    
    [string addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:18] range:NSMakeRange(0, string.length)];
    
    return string;
}

- (UIButton *)set_rightButton{
    UIImage* addImage = [[UIImage imageNamed:@"index_monitor_all"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIButton* addButton = [[UIButton alloc] init];
    
    [addButton setImage:addImage forState:UIControlStateNormal];
    
    addButton.adjustsImageWhenHighlighted = NO;
    
    [addButton sizeToFit];
    
    return  addButton;
}

- (void)right_button_event:(UIButton *)sender{
    
    _monitorView = [[ZLMonitorCustomVideoView alloc]init];
    _monitorView.hidden = YES;
    [self.view addSubview:_monitorView];
    _monitorView.frame = _tipsView.frame;
    
    _bottomView.videoBtn.selected = YES;
    _bottomView.photoBtn.selected = YES;
    
    [UIView animateWithDuration:1 animations:^{
        _monitorView.hidden = NO;
    } completion:^(BOOL finished) {
        [_tipsView removeFromSuperview];
    }];
    
}

- (UIColor *)set_colorBackground{
    
    return HEXCOLOR(KNavBarBG_color_blue);
    
}



@end
