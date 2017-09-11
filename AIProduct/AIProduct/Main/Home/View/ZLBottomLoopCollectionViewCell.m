//
//  ZLBottomLoopCollectionViewCell.m
//  AIProduct
//
//  Created by mac on 2017/8/15.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ZLBottomLoopCollectionViewCell.h"
#import "ZLHomeBottomView.h"

@interface ZLBottomLoopCollectionViewCell ()
@property (nonatomic, strong) ZLHomeBottomView *bottomView;
@end

@implementation ZLBottomLoopCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
//        [self setUpUI];
        
    }
    return  self;
}

- (void)setUpUI{
    

    
    

}

- (void)setModelArray:(NSArray *)modelArray{
    _bottomView = [[ZLHomeBottomView alloc]initWithFrame:self.bounds bottomArray:modelArray];
    
    [self.contentView addSubview:_bottomView];
    
}

@end
