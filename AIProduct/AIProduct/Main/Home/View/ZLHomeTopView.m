//
//  ZLHomeTopView.m
//  AIProduct
//
//  Created by mac on 2017/8/3.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ZLHomeTopView.h"

@interface ZLHomeTopView ()
@property (nonatomic, strong) UIImageView *rebotImageV;

@end

@implementation ZLHomeTopView
- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
        
    }
    return self;
    
}
// 设置UI界面
- (void)setupUI{

    self.rebotImageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"index_image"]];
    [self addSubview:self.rebotImageV];
    [self.rebotImageV mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.edges.equalTo(self).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
        
    }];
    
    self.eyeButton = [[UIButton alloc]init];
    [self.eyeButton setImage:[UIImage imageNamed:@"index_monitor"] forState:(UIControlStateNormal)];
    [self addSubview:self.eyeButton];
    [self.eyeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self).offset(AdaptedHeight(80));
        make.right.equalTo(self.mas_right).offset(AdaptedWidth(-42));
        
    }];

}



@end
