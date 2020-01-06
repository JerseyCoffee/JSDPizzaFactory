//
//  UIColor+JSDStyle.m
//  JSDPiSaProcessing
//
//  Created by Jersey on 5/1/2020.
//  Copyright © 2020 Jersey. All rights reserved.
//

#import "UIColor+JSDStyle.h"

@implementation UIColor (JSDStyle)

+ (UIColor *)jsd_grayColor {
    
    return [UIColor colorWithRed:0.93 green:0.93 blue:0.93 alpha:1];
}

+ (UIColor *)jsd_weakGrayColor {
    
    return [UIColor jsd_colorWithHexString:@"#DCDCDC"];
}

+ (UIColor *)jsd_whiteColor {
    
    return [UIColor whiteColor];
}

#pragma mark -- Text Color

+ (UIColor *)jsd_mainTextColor {
    
    return [UIColor colorWithRed:30/255.0 green:23/255.0 blue:13/255.0 alpha:1.0];
}

+ (UIColor *)jsd_minorTextColor {
    
    return [UIColor colorWithRed:113/255.0 green:120/255.0 blue:130/255.0 alpha:1.0];
}

+ (UIColor *)jsd_detailTextColor {
    
    return [UIColor colorWithRed:113/255.0 green:120/255.0 blue:130/255.0 alpha:1.0];
}

+ (UIColor *)jsd_colorWithHexString:(NSString *)color {
    
    //需要先判断color是否为空或null
    if (color == nil || color == NULL) {
        return [UIColor clearColor];;
    }
    if ([color isKindOfClass:[NSNull class]]) {
        return [UIColor clearColor];;
    }
    
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    // 判断前缀
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    // 从六位数值中找到RGB对应的位数并转换
    NSRange range;
    range.location = 0;
    range.length = 2;
    //R、G、B
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0) green:((float) g / 255.0) blue:((float) b / 255.0) alpha:1.0];
}

@end
