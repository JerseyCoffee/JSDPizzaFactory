//
//  JSDPizza.m
//  JSDPiSaProcessing
//
//  Created by Jersey on 6/1/2020.
//  Copyright © 2020 Jersey. All rights reserved.
//

#import "JSDPizza.h"

@implementation JSDPizza

- (instancetype)initWithNameNumber:(NSString *)nameNumber {
    
    self = [super initWithNameNumber:nameNumber];
    if (!self) {
        return nil;
    }
    _size = JSDPizzaSizeSmall;
    _type = JSDPizzaTypeBeef;
    
    return self;
}

@end
