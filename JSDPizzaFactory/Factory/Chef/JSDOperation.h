//
//  JSDOperation.h
//  JSDPiSaProcessing
//
//  Created by Jersey on 6/1/2020.
//  Copyright © 2020 Jersey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSDPizzaChef.h"

NS_ASSUME_NONNULL_BEGIN

@interface JSDOperation : NSOperation

@property(nonatomic, strong) JSDPizzaChef *pizzaChef;

@end

NS_ASSUME_NONNULL_END
