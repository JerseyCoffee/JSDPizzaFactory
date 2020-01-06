//
//  JSDPizzaFactory.h
//  JSDPiSaProcessing
//
//  Created by Jersey on 6/1/2020.
//  Copyright © 2020 Jersey. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^voidBlock)(void);

@protocol JSDMakePizza <NSObject>

@required

- (void)customMakePizzeCount:(NSInteger)pizzeCount completionBlock:(voidBlock _Nullable )complectionBlock;
- (void)switchWorkStatus;
- (void)switchChefStatus:(int)chefNumber;

@optional

@end

NS_ASSUME_NONNULL_BEGIN

@interface JSDPizzaFactory : NSObject

@property(nonatomic, weak) id<JSDMakePizza> delegate;
@property(nonatomic, assign, getter=isWork) BOOL workSwitch;

- (void)addMakePizzaCount:(NSInteger)pizzaCount completionBlock:(voidBlock)complectionBlock;
- (void)willSwitchWorkStatus;
- (void)willSwitchChefStatus:(int)chefNumber;

@end

NS_ASSUME_NONNULL_END
