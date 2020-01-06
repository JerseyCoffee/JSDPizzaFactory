//
//  JSDChef.h
//  JSDPiSaProcessing
//
//  Created by Jersey on 6/1/2020.
//  Copyright © 2020 Jersey. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JSDChef : NSObject

@property(nonatomic, copy) NSString *name;
@property(nonatomic, assign) int spped;

- (instancetype)initWithName:(NSString *)name spped:(int)spped;

@end

NS_ASSUME_NONNULL_END
