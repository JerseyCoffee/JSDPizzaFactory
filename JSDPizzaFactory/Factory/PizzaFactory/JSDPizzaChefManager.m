//
//  JSDPizzaChefManager.m
//  JSDPiSaProcessing
//
//  Created by Jersey on 6/1/2020.
//  Copyright © 2020 Jersey. All rights reserved.
//

#import "JSDPizzaChefManager.h"
#import "JSDPizza.h"
#import "JSDPizzaChef.h"


@interface JSDPizzaChefManager () 

@property(nonatomic, assign) NSInteger allotLastChefNumber;
@property(nonatomic, assign) NSInteger pizzaSum;
@property(nonatomic, assign) NSInteger pizzaCompleteSum;


@end

@implementation JSDPizzaChefManager

- (instancetype)initWithChefCount:(NSInteger)chefCount {
    
    self = [super init];
    if (!self) {
        return nil;
    }
    NSMutableArray* tempArray = [NSMutableArray new];
    for (NSInteger i = 0; i < chefCount; i++) {
        JSDPizzaChef* pizzaChef = [[JSDPizzaChef alloc] initWithName:[NSString stringWithFormat:@"Pizza Chef %ld", i] spped:(int)(i + 1)];
        [tempArray addObject:pizzaChef];
    }
    _allotLastChefNumber = 0;
    _chefs = [tempArray copy];
    
    return self;
}

- (void)customMakePizzeCount:(NSInteger)pizzeCount completionBlock:(voidBlock)complectionBlock{
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        __block NSInteger makePizzaCount = pizzeCount;
        if (self.allotLastChefNumber != 0) {
            [self.chefs enumerateObjectsUsingBlock:^(JSDPizzaChef * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                if (idx >= self.allotLastChefNumber) {
                    JSDPizza* pizza = [[JSDPizza alloc] initWithNameNumber:[NSString stringWithFormat:@"%@", @(self.pizzaSum + idx).stringValue]];
                    [obj addPizzas:@[pizza]];
                    makePizzaCount--;
                }
            }];
            self.allotLastChefNumber = 0;
        }
        //暂时不考虑分配数小于 7 时
        NSInteger averaageCount = makePizzaCount / self.chefs.count;
        __block NSInteger remainCount = makePizzaCount % self.chefs.count;
        self.allotLastChefNumber = remainCount; // 下标从 0 开始
        [self.chefs enumerateObjectsUsingBlock:^(JSDPizzaChef * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (remainCount) {
                remainCount--;
                NSMutableArray* tempPizza = [NSMutableArray new];
                for (NSInteger i = 0; i < (averaageCount + 1); i++) {
                    JSDPizza* pizza = [[JSDPizza alloc] initWithNameNumber:[NSString stringWithFormat:@"%@", @(self.pizzaSum + (i * 7 + idx)).stringValue]];
                    [tempPizza addObject:pizza];
                }
                [obj addPizzas:tempPizza.copy];
            } else {
                NSMutableArray* tempPizza = [NSMutableArray new];
                for (NSInteger i = 0; i < averaageCount; i++) {
                    JSDPizza* pizza = [[JSDPizza alloc] initWithNameNumber:[NSString stringWithFormat:@"%@", @(self.pizzaSum + (i * 7 + idx)).stringValue]];
                    [tempPizza addObject:pizza];
                }
                [obj addPizzas:tempPizza.copy];
            }
        }];
        self.pizzaSum += pizzeCount;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            complectionBlock ? complectionBlock() : NULL;
        });
    });
    
}

- (void)switchChefStatus:(int)chefNumber {
    
//    [self.chefs[chefNumber] switchStatus];
}

- (void)switchChefStatus:(NSInteger)chefNumber switchStatus:(BOOL)switchStatus {
    
    [self.chefs[chefNumber] switchStatus];
}

- (void)switchWorkStatus {
    
    [self.chefs enumerateObjectsUsingBlock:^(JSDPizzaChef * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj pause];
    }];
}

@end
