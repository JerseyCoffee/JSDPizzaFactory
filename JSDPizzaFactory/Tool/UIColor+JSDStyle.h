//
//  UIColor+JSDStyle.h
//  JSDPiSaProcessing
//
//  Created by Jersey on 5/1/2020.
//  Copyright © 2020 Jersey. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (JSDStyle)

+ (UIColor *)jsd_colorWithHexString:(NSString *)color;

+ (UIColor *)jsd_grayColor;
+ (UIColor *)jsd_weakGrayColor;
+ (UIColor *)jsd_whiteColor;

#pragma mark -Text Color

+ (UIColor *)jsd_mainTextColor;
+ (UIColor *)jsd_minorTextColor;
+ (UIColor *)jsd_detailTextColor;

@end

NS_ASSUME_NONNULL_END
