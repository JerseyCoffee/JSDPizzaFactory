//
//  UIFont+JSDStyle.m
//  JSDPiSaProcessing
//
//  Created by Jersey on 5/1/2020.
//  Copyright © 2020 Jersey. All rights reserved.
//

#import "UIFont+JSDStyle.h"

static NSString* const kJSDFontName = @"Helvetica Neue";

@implementation UIFont (JSDStyle)

+ (UIFont *)jsd_fontSize:(CGFloat)size {
    
    UIFont* font = [UIFont fontWithName:kJSDFontName size:size];
    
    return font;
}

@end
