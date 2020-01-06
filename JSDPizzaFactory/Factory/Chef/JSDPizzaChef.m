//
//  JSDPizzaChef.m
//  JSDPiSaProcessing
//
//  Created by Jersey on 6/1/2020.
//  Copyright © 2020 Jersey. All rights reserved.
//

#import "JSDPizzaChef.h"
#import "JSDOperation.h"

@interface JSDPizzaChef ()

@property(nonatomic, strong) NSOperationQueue *operationQueue;
@property(nonatomic, weak)   JSDOperation *operation;
@property(nonatomic, assign) NSInteger completionPizzaCount;
@property(nonatomic, assign) NSInteger waitMakePizzaCount;
@property(nonatomic, assign) NSInteger pizzaSumCount;

@end

@implementation JSDPizzaChef

- (instancetype)initWithName:(NSString *)name spped:(int)spped {
    
    self = [super initWithName:name spped:spped];
    if (!self) {
        return nil;
    }
    
    _operationQueue = [[NSOperationQueue alloc] init];
    _operationQueue.maxConcurrentOperationCount = 1;
    
    return self;
}

//- (void)addPizzaCount:(NSInteger)pizzaCount {
//
//    self.pizzaSumCount += pizzaCount;
//    self.waitMakePizzaCount += pizzaCount;
//    [self start];
//}

- (void)addPizzas:(NSArray *)pizzas {
    
    NSBlockOperation* addPizzaOperation = [NSBlockOperation blockOperationWithBlock:^{
        [pizzas enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [self.pizzaSum addObject:obj];
            [self.waitMakePizzas addObject:obj];
        }];
    }];
    [self.operationQueue addOperation:addPizzaOperation];
}

- (void)movePizzaNumber:(NSInteger)pizzaNumber fromPizzaChef:(JSDPizzaChef *)pizzaChef {
    
    
}

- (void)start {
    
    
}

- (void)makePizza {
    
    JSDOperation* makePizzaOperation = [[JSDOperation alloc] init];
    self.operation = makePizzaOperation;
    self.operation.pizzaChef = self;
    [self.operationQueue addOperation:makePizzaOperation];
    [self.operation main];
}

- (void)makePizzaOperation {
    
    if (self.waitMakePizzas.count) {
        NSLog(@"%@ 开始制作披萨 %@", self.name, self.waitMakePizzas.firstObject.nameNumber);
        self.waitMakePizzas.firstObject.status = JSDCookiesMakeStatusBeing;
        sleep(self.spped);
        [self.completionPizzas addObject:self.waitMakePizzas.firstObject];
        [self.waitMakePizzas removeObject:self.waitMakePizzas.firstObject];
        self.waitMakePizzas.firstObject.status = JSDCookiesMakeStatusComplection;
        NSLog(@"%@ ---制作完成披萨咯--- %@, 当前完成总数 %ld, 剩余完成总数 %ld", self.name, self.completionPizzas.firstObject.nameNumber, self.completionPizzas.count, self.waitMakePizzas.count);
        [self.operation isFinished];
        [self makePizza];
    } else {
//        self.operation = nil;
//        [self.operation isFinished];
//        self.operation = nil;
    }
}


- (void)pause {
    
    
}

- (void)switchStatus {
    
}

- (NSMutableArray<JSDPizza *> *)pizzaSum {
    
    if (!_pizzaSum) {
        _pizzaSum = [NSMutableArray new];
    }
    return _pizzaSum;
}

- (NSMutableArray<JSDPizza *> *)waitMakePizzas {
    
    if (!_waitMakePizzas) {
        _waitMakePizzas = [NSMutableArray new];
    }
    return _waitMakePizzas;
}

- (NSMutableArray<JSDPizza *> *)completionPizzas {
    
    if (!_completionPizzas) {
        _completionPizzas = [NSMutableArray new];
    }
    return _completionPizzas;
}

@end
