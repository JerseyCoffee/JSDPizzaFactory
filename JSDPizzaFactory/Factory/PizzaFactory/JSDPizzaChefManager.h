//
//  JSDPizzaChefManager.h
//  JSDPiSaProcessing
//
//  Created by Jersey on 6/1/2020.
//  Copyright © 2020 Jersey. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JSDPizzaChef;
//@class JSDPizzaFactory;
#import "JSDPizzaFactory.h"

NS_ASSUME_NONNULL_BEGIN

@interface JSDPizzaChefManager : NSObject <JSDMakePizza>

@property(nonatomic, copy) NSArray<JSDPizzaChef* > *chefs;

- (instancetype)initWithChefCount:(NSInteger)chefCount;

@end

NS_ASSUME_NONNULL_END
