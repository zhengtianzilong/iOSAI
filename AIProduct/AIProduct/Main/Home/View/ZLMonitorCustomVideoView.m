//
//  ZLMonitorCustomVideoView.m
//  AIProduct
//
//  Created by mac on 2017/8/21.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ZLMonitorCustomVideoView.h"
#import "ZLControlVideoView.h"
@interface ZLMonitorCustomVideoView ()

@property (nonatomic, strong) ZLControlVideoView *controlView;

@end

@implementation ZLMonitorCustomVideoView


- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
//        self.backgroundColor = HEXCOLOR(0xdcf7fe);
        self.userInteractionEnabled = YES;
        self.image = [UIImage imageNamed:@"index_image"];
        [self setUpUI];
        
    }
    
    return self;
}

- (void)setUpUI{
    
    _controlView = [[ZLControlVideoView alloc]init];
    [self addSubview:_controlView];
    
    [_controlView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.edges.equalTo(self);
        
    }];

}

@end
