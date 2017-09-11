//
//  ZLAddVideoChatView.m
//  AIProduct
//
//  Created by mac on 2017/8/21.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ZLAddVideoChatView.h"
#import "UIImageView+Addition.h"
@interface ZLAddVideoChatView ()

@property (nonatomic,strong) UIButton *personBtn;



@end

@implementation ZLAddVideoChatView
- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        [self setupUI];

    }
    return self;
    
}
// 设置UI界面
- (void)setupUI{
    
    _personBtn = [[UIButton alloc]init];
    UIImage *image = [UIImage imageNamed:@"2"];
    [_personBtn setImage:image forState:(UIControlStateNormal)];
    [self addSubview:_personBtn];
    
    [_personBtn addTarget:self action:@selector(changePersonClick) forControlEvents:(UIControlEventTouchUpInside)];
    
    [_personBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(self);
        make.right.equalTo(self.mas_right);
        make.top.equalTo(self);
        make.bottom.equalTo(self.mas_bottom);
        
    }];
    
    _symbolImageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"video_robot_small"]];
    [_personBtn addSubview:_symbolImageV];
    [_symbolImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(_personBtn.mas_right);
        make.bottom.equalTo(_personBtn.mas_bottom);
    }];
    
}

- (void)changePersonClick{
    
    if (_changePersonBlock) {
        
        _changePersonBlock(self.personBtn);
        
    }
    
}


- (void)layoutSubviews{
    [super layoutSubviews];

//    _personBtn.imageView.contentMode = UIViewContentModeScaleAspectFill;
    
}

@end
