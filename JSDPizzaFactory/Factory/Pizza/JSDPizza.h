//
//  JSDPizza.h
//  JSDPiSaProcessing
//
//  Created by Jersey on 6/1/2020.
//  Copyright © 2020 Jersey. All rights reserved.
//

#import "JSDCookies.h"

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    JSDPizzaSizeSmall = 0,
    JSDPizzaSizeMiddle = 1,
    JSDPizzaSizeBig = 2,
} JSDPizzaSize;

typedef enum : NSUInteger {
    JSDPizzaTypeBeef = 0,
    JSDPizzaTypeMushroom = 1,
    JSDPizzaTypeOnion = 2,
    JSDPizzaTypeTomato = 3,
    JSDPizzaTypeMarinara = 4,
} JSDPizzaType;

@interface JSDPizza : JSDCookies

@property(nonatomic, assign) JSDPizzaSize size;
@property(nonatomic, assign) JSDPizzaType type;

- (instancetype)initWithNameNumber:(NSString *)nameNumber;

@end

NS_ASSUME_NONNULL_END
