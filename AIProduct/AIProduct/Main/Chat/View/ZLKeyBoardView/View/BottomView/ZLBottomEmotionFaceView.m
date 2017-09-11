//
//  ZLBottomEmotionFaceView.m
//  AIProduct
//
//  Created by mac on 2017/8/18.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ZLBottomEmotionFaceView.h"

#define  KMargin 4

#define  KColumNum 7
#define  KRowNum 3

@interface ZLBottomEmotionFaceView ()<UIScrollViewDelegate,ZLEmotionViewDelegate>


@property(nonatomic,strong) UIScrollView *scrollview;
@property(nonatomic,strong) UIPageControl *pageControl;
@property(nonatomic,strong) ZLEmotionFaceToolBar *toolBar;
@property(nonatomic,strong) ZLEmotionBoardView *faceView;


@end

@implementation ZLBottomEmotionFaceView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        [self setUpUi];
    }
    return self;
}


- (void)setUpUi
{
    
    
    
    
    //scrollView:装emoij面板
    self.scrollview = [[UIScrollView alloc]initWithFrame:self.bounds];
    
    self.scrollview.showsHorizontalScrollIndicator = NO;
    self.scrollview.pagingEnabled = YES;
    self.scrollview.delegate = self;
    
    
    [self addSubview:self.scrollview];
    
    
    
    
    //pageControl
    self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(self.width/2, self.height-70, 10, 10)];
    self.pageControl.currentPageIndicatorTintColor = [UIColor grayColor];
    self.pageControl.pageIndicatorTintColor = [[UIColor lightGrayColor]colorWithAlphaComponent:0.6];
    [self addSubview:self.pageControl];
    
    
    
    
    
    
    
    //底部toolBar
    self.toolBar = [[ZLEmotionFaceToolBar alloc]initWithFrame:CGRectMake(0, self.height-38, self.width, 38)];
    
    __weak typeof(self) weakSelf = self;
    [self.toolBar setSendEmoijBlock:^{
        
        if (self.emotionViewDelegate && [self.emotionViewDelegate respondsToSelector:@selector(sendEmoijMessage:)]) {
            
            [weakSelf.emotionViewDelegate sendEmoijMessage:nil];
        }
        
    }];
    
    [weakSelf.toolBar setSwitchEmoijBlock:^(NSInteger index) {
        
        
        [weakSelf switchEmoijType:index];
    }];
    
    [weakSelf addSubview:self.toolBar];
    
    
    
    //emoij面板：默认切换第一个emoij面板
    [self switchEmoijType:0];
    [self.toolBar setBtnIndexSelect:0];
    
    
    
    
}

- (void)switchEmoijType:(NSInteger)type
{
    NSLog(@"切换表情类型：%ld",type);
    
    
    [self.scrollview.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self.scrollview setContentOffset:CGPointZero];
    
    
    self.faceView = [ZLEmotionBoardView faceBoardView:type scrollView:self.scrollview frame:self.scrollview.bounds];
    
    self.faceView.emotionViewDelegate = self;
    [self.scrollview addSubview:self.faceView];
    
    self.pageControl.currentPage = 0;
    self.pageControl.numberOfPages = self.faceView.page;
    
    
    self.faceView.width = self.faceView.page *self.scrollview.width;
    
    
    self.scrollview.contentSize = CGSizeMake(self.scrollview.bounds.size.width*(self.faceView.page), 0);
    
}




- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    NSInteger page = scrollView.contentOffset.x/self.width;
    self.pageControl.currentPage = page;
    
}





/**
 *  @brief 格式布局
 *
 *  @param columesOfPerRow 多少列
 *  @param rowsOfPerColumn 多少行
 *  @param itemWidth       格宽
 *  @param itemHeight      格高
 *  @param marginX         格子间左右间隙
 *  @param marginY         格子间上下间隙
 *  @param index           格子所在索引
 *  @param page            格子所在页码
 *  @param scrollView      格子所在scrollview
 *
 *  @return <#return value description#>
 */
- (CGRect)getFrameWithColumesOfPerRow:(NSInteger)columesOfPerRow
                      rowsOfPerColumn:(NSInteger)rowsOfPerColumn
                            itemWidth:(CGFloat)itemWidth
                           itemHeight:(NSInteger)itemHeight
                              marginX:(CGFloat)marginX
                               maginY:(CGFloat)marginY
                              atIndex:(NSInteger)index
                               atPage:(NSInteger)page
                           scrollView:(UIScrollView *)scrollView
{
    CGRect itemFrame = CGRectMake((index % columesOfPerRow) * (itemWidth + marginX) + marginX + (page * CGRectGetWidth(scrollView.bounds)), ((index / columesOfPerRow) - rowsOfPerColumn * page) * (itemHeight + marginY) + marginY, itemWidth, itemHeight);
    return itemFrame;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
}



//添加emoij
- (void)addEmoij:(NSString *)emoij isDeleteLastEmoij:(BOOL)isDeleteLastEmoij
{
    if (self.emotionViewDelegate && [self.emotionViewDelegate respondsToSelector:@selector(addEmoij:isDeleteLastEmoij:)]) {
        
        [self.emotionViewDelegate addEmoij:emoij isDeleteLastEmoij:isDeleteLastEmoij];
    }
}



//发送非emoij图片
- (void)sendEmotionImage:(NSString *)localPath emotionType:(EmotionType)emotionType
{
    if (self.emotionViewDelegate && [self.emotionViewDelegate respondsToSelector:@selector(sendEmotionImage:emotionType:)]) {
        
        [self.emotionViewDelegate sendEmotionImage:localPath emotionType:emotionType];;
    }
}







@end
