//
//  JSDFactoryView.h
//  JSDPiSaProcessing
//
//  Created by Jersey on 6/1/2020.
//  Copyright © 2020 Jersey. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JSDFactoryView : UIView

@property(nonatomic, copy) void(^addPizzaCallback)(void);
@property(nonatomic, copy) void(^addMorePizzaCallback)(void);

- (void)updatePizzaSummaryChefNumber:(NSInteger)chefNumber pizzaCount:(NSInteger)pizzaCount;

@end

NS_ASSUME_NONNULL_END
