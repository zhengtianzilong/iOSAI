//
//  UIParameter.h
//  NinaPagerView
//
//  Created by RamWire on 15/11/13.
//  Copyright © 2015年 RamWire. All rights reserved.
//

#ifndef UIParameter_h
#define UIParameter_h

//是否需要打印调试
#define isDebug NO
//全屏宽和高大小
#define FUll_VIEW_WIDTH     ([[UIScreen mainScreen] bounds].size.width)
#define FUll_VIEW_HEIGHT    ([[UIScreen mainScreen] bounds].size.height)
#define FUll_CONTENT_HEIGHT     FUll_VIEW_HEIGHT - 64 //如果您想创建的界面不需要减去Tabbar的高度，您可以将此参数的-49去掉即可
//十六进制颜色值
#define UIColorFromRGB(rgbValue)    [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define PageBtn     0.06 * FUll_VIEW_HEIGHT //6s下高度40(您如果想改变上方TopTab的高度，请设置此值)
#define SliderHeight    PageBtn //默认滑块的高度（您如果想让高度与TopTab一致，请设置此参数为PageBtn）
#define SliderY     (PageBtn - SliderHeight) / 2.0 //默认滑块的Y值
#define TabbarHeight    49
#define More5LineWidth      FUll_VIEW_WIDTH / 5.0 //超过5个标题的宽度
#define SelectBottomLinePer     1 //您可以对此参数进行设置来改变下划线的长度，此参数代表的是选中的整体部分的占比，默认为1，您可以对此进行设置，但推荐您尽量不要设置在0.5以下(此参数设置在两种样式中均可使用)
#define SelectBottomLineHeight      2 //您可以对此参数进行设置来改变下划线的高度，默认为2，若超过3，则默认为3

#endif /* UIParameter_h */


