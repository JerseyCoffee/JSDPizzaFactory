//
//  JSDPizzaFactory.m
//  JSDPiSaProcessing
//
//  Created by Jersey on 6/1/2020.
//  Copyright © 2020 Jersey. All rights reserved.
//

#import "JSDPizzaFactory.h"

@implementation JSDPizzaFactory

- (void)addMakePizzaCount:(NSInteger)pizzaCount completionBlock:(voidBlock)complectionBlock {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(customMakePizzeCount:completionBlock:)]) {
        [self.delegate customMakePizzeCount:pizzaCount completionBlock:complectionBlock];
    }
}

- (void)willSwitchWorkStatus {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(switchWorkStatus)]) {
        [self.delegate switchWorkStatus];
    }
}

- (void)willSwitchChefStatus:(int)chefNumber {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(switchChefStatus:)]) {
        [self.delegate switchChefStatus:chefNumber];
    }
}

@end
