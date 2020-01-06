//
//  JSDCookies.h
//  JSDPiSaProcessing
//
//  Created by Jersey on 6/1/2020.
//  Copyright © 2020 Jersey. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    JSDCookiesMakeStatusNot = 0,
    JSDCookiesMakeStatusBeing = 1,
    JSDCookiesMakeStatusComplection,
} JSDCookiesMakeStatus;

@interface JSDCookies : NSObject

@property(nonatomic, assign) JSDCookiesMakeStatus status;
@property(nonatomic, copy) NSString *nameNumber; //序号
- (instancetype)initWithNameNumber:(NSString* )nameNumber;

@end

NS_ASSUME_NONNULL_END
