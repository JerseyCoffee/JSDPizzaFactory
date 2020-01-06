//
//  JSDChefStatusView.h
//  JSDPiSaProcessing
//
//  Created by Jersey on 6/1/2020.
//  Copyright © 2020 Jersey. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JSDPizzaChef;

NS_ASSUME_NONNULL_BEGIN

@interface JSDChefStatusView : UIView

- (void)updateFromChef:(JSDPizzaChef* )chef index:(NSInteger)index;
@property(nonatomic, copy) void(^switchCallback)(NSInteger chefIndex, BOOL status);

@end

NS_ASSUME_NONNULL_END
