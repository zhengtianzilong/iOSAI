//
//  NSBundle+ZLKeyBoardExtension.m
//  AIProduct
//
//  Created by mac on 2017/8/18.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "NSBundle+ZLKeyBoardExtension.h"

@implementation NSBundle (ZLKeyBoardExtension)
/**
 *  @brief 取出指定bundle名中的image
 *
 *  @param bundleName <#bundleName description#>
 *  @param imageName  <#imageName description#>
 *
 *  @return <#return value description#>
 */
+ (UIImage *)imageWithBundle:(NSString *)bundleName imageName:(NSString *)imageName
{
    
    NSBundle *bundle = [self bundle:bundleName];
    
    NSString *imagePath =  [bundle pathForResource:imageName ofType:@"png"];
    return  [UIImage imageWithContentsOfFile:imagePath];
    
}

/**
 *  @brief 返回bundle对象
 *
 *  @param bundleName <#bundleName description#>
 *
 *  @return <#return value description#>
 */
+ (NSBundle *)bundle:(NSString *)bundleName
{
    NSString *bundlePath =  [[NSBundle mainBundle]pathForResource:bundleName ofType:@"bundle"];
    return [NSBundle bundleWithPath:bundlePath];
}

@end
