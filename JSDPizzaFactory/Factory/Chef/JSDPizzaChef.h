//
//  JSDPizzaChef.h
//  JSDPiSaProcessing
//
//  Created by Jersey on 6/1/2020.
//  Copyright © 2020 Jersey. All rights reserved.
//

#import "JSDChef.h"
#import "JSDPizza.h"

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    JSDPizzaChefWorkStatusRest = 0, //任务完成
    JSDPizzaChefWorkStatusBegin = 1, //正在加工
    JSDPizzaChefWorkStatusSuspended = 2, //暂停
} JSDPizzaChefWorkStatus;

@interface JSDPizzaChef : JSDChef

@property(nonatomic, strong) NSMutableArray<JSDPizza* > *completionPizzas;
@property(nonatomic, strong) NSMutableArray<JSDPizza* > *waitMakePizzas;
@property(nonatomic, strong) NSMutableArray<JSDPizza* > *pizzaSum;


- (void)addPizzas:(NSArray* )pizzas;
- (void)movePizzaNumber:(NSInteger)pizzaNumber fromPizzaChef:(JSDPizzaChef* )pizzaChef;

- (void)start;
- (void)pause;
- (void)switchStatus;

- (void)makePizzaOperation;

@end

NS_ASSUME_NONNULL_END
