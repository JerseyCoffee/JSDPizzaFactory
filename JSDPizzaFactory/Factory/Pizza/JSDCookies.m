//
//  JSDCookies.m
//  JSDPiSaProcessing
//
//  Created by Jersey on 6/1/2020.
//  Copyright © 2020 Jersey. All rights reserved.
//

#import "JSDCookies.h"

@implementation JSDCookies

- (instancetype)initWithNameNumber:(NSString* )nameNumber {
    
    self = [super init];
    if (!self) {
        return nil;
    }
    _status = JSDCookiesMakeStatusNot;
    _nameNumber = nameNumber;
    
    return self;
}

@end
