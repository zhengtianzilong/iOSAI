//
//  NSBundle+ZLKeyBoardExtension.h
//  AIProduct
//
//  Created by mac on 2017/8/18.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSBundle (ZLKeyBoardExtension)

+ (UIImage *)imageWithBundle:(NSString *)bundleName imageName:(NSString *)imageName;


+ (NSBundle *)bundle:(NSString *)bundleName;

@end
