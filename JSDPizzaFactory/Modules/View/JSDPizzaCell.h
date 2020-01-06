//
//  JSDPizzaCell.h
//  JSDPiSaProcessing
//
//  Created by Jersey on 6/1/2020.
//  Copyright © 2020 Jersey. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JSDPizza;
NS_ASSUME_NONNULL_BEGIN

@interface JSDPizzaCell : UITableViewCell

@property(nonatomic, strong) JSDPizza *pizza;

- (void)reloadPizzeColor:(NSInteger)chefNumber;
- (void)reloadViewFromPizza:(JSDPizza *)pizza;
@end

NS_ASSUME_NONNULL_END
