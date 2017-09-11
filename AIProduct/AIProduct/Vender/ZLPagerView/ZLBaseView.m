//
//  ZLBaseView.m
//  SmartGas
//
//  Created by caizilong on 16/6/13.
//  Copyright © 2016年 caizilong. All rights reserved.
//

#import "ZLBaseView.h"
#import "UIParameter.h"
@interface ZLBaseView ()

@end

@implementation ZLBaseView

{
    UIView *lineBottom;
    UIView *topTabBottomLine;
    NSMutableArray *btnArray;
    NSArray *titlesArray; /**<  标题   **/
    NSInteger arrayCount; /**<  topTab数量   **/
    UIColor *selectBtn;
    UIColor *unselectBtn;
    UIColor *underline;
    UIColor *topTabColors;
    NSInteger topTabType;
    UIView *ninaMaskView;
}

- (instancetype)initWithFrame:(CGRect)frame WithSelectColor:(UIColor *)selectColor WithUnselectorColor:(UIColor *)unselectColor WithUnderLineColor:(UIColor *)underlineColor WithtopTabColor:(UIColor *)topTabColor WithTopTabType:(NSInteger)topTabNum
{
    self = [super initWithFrame:frame];
    topTabType = topTabNum;
    if (self) {
        if ([selectColor isKindOfClass:[UIColor class]]) {
            selectBtn = selectColor;
        }else {
            NSLog(@"please change the selectColor into UIColor!");
        }
        if ([unselectColor isKindOfClass:[UIColor class]]) {
            unselectBtn = unselectColor;
        }else {
            NSLog(@"please change the unselectColor into UIColor!");
        }
        if ([underlineColor isKindOfClass:[UIColor class]]) {
            underline = underlineColor;
        }else {
            NSLog(@"please change the underlineColor into UIColor!");
        }
        if ([topTabColor isKindOfClass:[UIColor class]]) {
            topTabColors = topTabColor;
        }else {
            NSLog(@"please change the topTabColor into UIColor!");
        }
    }
    return self;
}

#pragma mark - SetMethod
- (void)setTitleArray:(NSArray *)titleArray {
    titlesArray = titleArray;
    arrayCount = titleArray.count;
    self.topTab.frame = CGRectMake(0, 0, FUll_VIEW_WIDTH, PageBtn);
    self.scrollView.frame = CGRectMake(0, PageBtn + 2, FUll_VIEW_WIDTH, FUll_CONTENT_HEIGHT - PageBtn);
    [self addSubview:self.topTab];
    
    self.topTab.layer.shadowColor = HEXCOLOR(KShadow_color_blue).CGColor;
    self.topTab.layer.shadowOffset = CGSizeMake(0, 2);
    self.topTab.layer.shadowOpacity = 0.17;
    self.topTab.layer.shadowRadius = 5;
    self.topTab.clipsToBounds = NO;
    
    [self addSubview:self.scrollView];

    
}

- (void)setTitleScale:(CGFloat)titleScale {
    _titleScale = titleScale;
    UIButton *buttonZero = btnArray[0];
    [UIView animateWithDuration:0.3 animations:^{
        buttonZero.transform = CGAffineTransformMakeScale(_titleScale, _titleScale);
    }];
}

#pragma mark - GetMethod
- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.delegate = self;
        _scrollView.tag = 318;
        _scrollView.backgroundColor = UIColorFromRGB(0xfafafa);
        _scrollView.contentSize = CGSizeMake(FUll_VIEW_WIDTH * titlesArray.count, 0);
        _scrollView.pagingEnabled = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.alwaysBounceHorizontal = YES;
               _scrollView.bounces = NO;
    }
    return _scrollView;
}

- (UIScrollView *)topTab {
    if (!_topTab) {
        _topTab = [[UIScrollView alloc] init];
        _topTab.delegate = self;
        if (topTabColors) {
            _topTab.backgroundColor = topTabColors;
        }else {
            _topTab.backgroundColor = [UIColor whiteColor];
        }
        _topTab.tag = 917;
        _topTab.scrollEnabled = YES;
        _topTab.alwaysBounceHorizontal = YES;
        _topTab.showsHorizontalScrollIndicator = NO;
        _topTab.bounces = NO;
        
//        _topTab.layer.shadowColor = HEXCOLOR(KShadow_color_blue).CGColor;
//        _topTab.layer.shadowOffset = CGSizeMake(0, 3);
//        _topTab.layer.shadowOpacity = 0.17;
//        _topTab.layer.shadowRadius = 5;
//        
//        _topTab.layer.borderWidth = 2;
//        _topTab.layer.borderColor = [UIColor redColor].CGColor;
//        
//        _topTab.clipsToBounds = NO;

        
        CGFloat additionCount = 0;
        if (arrayCount > 5) {
            additionCount = (arrayCount - 5.0) / 5.0;
        }
        _topTab.contentSize = CGSizeMake((1 + additionCount) * FUll_VIEW_WIDTH, PageBtn - TabbarHeight);
        btnArray = [NSMutableArray array];
        for (NSInteger i = 0; i < titlesArray.count; i++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.tag = i;
            button.titleLabel.font = [UIFont systemFontOfSize:14];
            if ([titlesArray[i] isKindOfClass:[NSString class]]) {
                [button setTitle:titlesArray[i] forState:UIControlStateNormal];
                button.titleLabel.numberOfLines = 0;
            }else {
                NSLog(@"您所提供的标题%li格式不正确。 Your title%li not fit for topTab,please correct it to NSString!",(long)i + 1,(long)i + 1);
            }
            if (titlesArray.count > 5) {
                button.frame = CGRectMake(More5LineWidth * i, 0, More5LineWidth, PageBtn);
            }else {
                button.frame = CGRectMake(FUll_VIEW_WIDTH / titlesArray.count * i, 0, FUll_VIEW_WIDTH / titlesArray.count, PageBtn);
            }
            
            
            
            [_topTab addSubview:button];
            [button addTarget:self action:@selector(touchAction:) forControlEvents:UIControlEventTouchUpInside];
            [btnArray addObject:button];
            if (i == 0 && topTabType == 0) {
                if (selectBtn) {
                    [button setTitleColor:selectBtn forState:UIControlStateNormal];
                }else {
                    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                }
                [UIView animateWithDuration:0.3 animations:^{
                    button.transform = CGAffineTransformMakeScale(1.15, 1.15);
                }];
            } else {
                if (unselectBtn) {
                    [button setTitleColor:unselectBtn forState:UIControlStateNormal];
                }else {
                    [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
                }
            }
        }
        //创建tabTop下方总览线
        topTabBottomLine = [UIView new];
        topTabBottomLine.backgroundColor = [UIColor whiteColor];
        

        
        [_topTab addSubview:topTabBottomLine];
        //创建选中移动线
        lineBottom = [UIView new];
        if (underline) {
            lineBottom.backgroundColor = underline;
        }else {
            lineBottom.backgroundColor = UIColorFromRGB(0xff6262);
        }
        lineBottom.clipsToBounds = YES;
        lineBottom.userInteractionEnabled = YES;
        [_topTab addSubview:lineBottom];
        //创建ninaMaskView
        ninaMaskView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, (1 + additionCount) * FUll_VIEW_WIDTH, SliderHeight)];
        ninaMaskView.backgroundColor = [UIColor clearColor];
        for (NSInteger j = 0; j < titlesArray.count; j++) {
            UILabel *maskLabel = [UILabel new];
            if (titlesArray.count > 5) {
                maskLabel.frame = CGRectMake(More5LineWidth * j - More5LineWidth * (1 - SelectBottomLinePer) / 2, 0, More5LineWidth, SliderHeight);
            }else {
                maskLabel.frame = CGRectMake(FUll_VIEW_WIDTH / titlesArray.count * j - FUll_VIEW_WIDTH / titlesArray.count * (1 - SelectBottomLinePer) / 2, 0, FUll_VIEW_WIDTH / titlesArray.count, SliderHeight);
            }
            maskLabel.text = titlesArray[j];
            maskLabel.textColor = selectBtn;
            maskLabel.textAlignment = NSTextAlignmentCenter;
            maskLabel.font = [UIFont systemFontOfSize:14];
            [ninaMaskView addSubview:maskLabel];
        }
        [lineBottom addSubview:ninaMaskView];
    }
    return _topTab;
}

#pragma mark - BtnMethod
- (void)touchAction:(UIButton *)button {
    [_scrollView setContentOffset:CGPointMake(FUll_VIEW_WIDTH * button.tag, 0) animated:YES];
    self.currentPage = (FUll_VIEW_WIDTH * button.tag + FUll_VIEW_WIDTH / 2) / FUll_VIEW_WIDTH;
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (scrollView.tag == 318) {
        self.currentPage = (NSInteger)((scrollView.contentOffset.x + FUll_VIEW_WIDTH / 2) / FUll_VIEW_WIDTH);
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView.tag == 318) {
        NSInteger yourPage = (NSInteger)((scrollView.contentOffset.x + FUll_VIEW_WIDTH / 2) / FUll_VIEW_WIDTH);
        CGFloat yourCount = 1.0 / arrayCount;
        if (arrayCount > 5) {
            yourCount = 1.0 / 5.0;
        }
        CGFloat lineBottomDis = yourCount * FUll_VIEW_WIDTH * (1 -SelectBottomLinePer) / 2;
        CGPoint maskCenter = ninaMaskView.center;
        if (arrayCount >= 5) {
            maskCenter.x = ninaMaskView.frame.size.width / 2.0 - (scrollView.contentOffset.x * 0.2);
        }else {
            maskCenter.x = ninaMaskView.frame.size.width / 2.0 - (scrollView.contentOffset.x * yourCount);
        }
        ninaMaskView.center = maskCenter;
        if (arrayCount > 5) {
            switch (topTabType) {
                case 0:
                    if (SelectBottomLineHeight >= 3) {
                        lineBottom.frame = CGRectMake(scrollView.contentOffset.x / 5 + lineBottomDis, PageBtn - 3, yourCount * FUll_VIEW_WIDTH * SelectBottomLinePer, 3);
                    }
                    lineBottom.frame = CGRectMake(scrollView.contentOffset.x / 5 + lineBottomDis, PageBtn - SelectBottomLineHeight, yourCount * FUll_VIEW_WIDTH * SelectBottomLinePer, SelectBottomLineHeight);
                    break;
                case 1:
                    lineBottom.frame = CGRectMake(scrollView.contentOffset.x / 5 + lineBottomDis, SliderY, yourCount * FUll_VIEW_WIDTH * SelectBottomLinePer, SliderHeight);
                    break;
                default:
                    break;
            }
        }else {
            switch (topTabType) {
                case 0:
                    if (SelectBottomLineHeight >= 3) {
                        lineBottom.frame = CGRectMake(scrollView.contentOffset.x / arrayCount + lineBottomDis, PageBtn - 3, yourCount * FUll_VIEW_WIDTH * SelectBottomLinePer, 3);
                    }else {
                        lineBottom.frame = CGRectMake(scrollView.contentOffset.x / arrayCount + lineBottomDis, PageBtn - SelectBottomLineHeight, yourCount * FUll_VIEW_WIDTH * SelectBottomLinePer, SelectBottomLineHeight);
                    }
                    break;
                case 1:
                    lineBottom.frame = CGRectMake(scrollView.contentOffset.x / arrayCount + lineBottomDis, SliderY, yourCount * FUll_VIEW_WIDTH * SelectBottomLinePer, SliderHeight);
                    break;
                default:
                    break;
            }
        }
        for (NSInteger i = 0;  i < btnArray.count; i++) {
            if (topTabType == 0) {
                if (unselectBtn) {
                    [btnArray[i] setTitleColor:unselectBtn forState:UIControlStateNormal];
                }else {
                    [btnArray[i] setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
                }
            }
            UIButton *changeButton = btnArray[i];
            [UIView animateWithDuration:0.3 animations:^{
                changeButton.transform = CGAffineTransformMakeScale(1, 1);
            }];
        }
        if (topTabType == 0) {
            if (selectBtn) {
                [btnArray[yourPage] setTitleColor:selectBtn forState:UIControlStateNormal];
            }else {
                [btnArray[yourPage] setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            }
            UIButton *changeButton = btnArray[yourPage];
            if (_titleScale > 0) {
                [UIView animateWithDuration:0.3 animations:^{
                    changeButton.transform = CGAffineTransformMakeScale(_titleScale, _titleScale);
                }];
            }else {
                [UIView animateWithDuration:0.3 animations:^{
                    changeButton.transform = CGAffineTransformMakeScale(1.15, 1.15);
                }];
            }
        }
    }
}

#pragma mark - LayOutSubViews
- (void)layoutSubviews {
    [super layoutSubviews];
    [self initUI];
}

- (void)initUI {
    CGFloat yourCount = 1.0 / arrayCount;
    CGFloat additionCount = 0;
    if (arrayCount > 5) {
        additionCount = (arrayCount - 5.0) / 5.0;
        yourCount = 1.0 / 5.0;
    }
    CGFloat lineBottomDis = yourCount * FUll_VIEW_WIDTH * (1 -SelectBottomLinePer) / 2;
    switch (topTabType) {
        case 0:
            if (SelectBottomLineHeight >= 3) {
                lineBottom.frame = CGRectMake(lineBottomDis, PageBtn - 3, yourCount * FUll_VIEW_WIDTH * SelectBottomLinePer, 3);
            }else {
                lineBottom.frame = CGRectMake(lineBottomDis, PageBtn - SelectBottomLineHeight, yourCount * FUll_VIEW_WIDTH * SelectBottomLinePer, SelectBottomLineHeight);
            }
            break;
        case 1:
            lineBottom.frame = CGRectMake(lineBottomDis, SliderY, yourCount * FUll_VIEW_WIDTH * SelectBottomLinePer, SliderHeight);
            lineBottom.layer.cornerRadius = SliderHeight / 2.0;
            break;
        default:
            break;
    }
    topTabBottomLine.frame = CGRectMake(0, PageBtn - 1, (1 + additionCount) * FUll_VIEW_WIDTH, 1);
}



@end
