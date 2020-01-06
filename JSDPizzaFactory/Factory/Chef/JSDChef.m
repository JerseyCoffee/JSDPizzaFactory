//
//  JSDChef.m
//  JSDPiSaProcessing
//
//  Created by Jersey on 6/1/2020.
//  Copyright © 2020 Jersey. All rights reserved.
//

#import "JSDChef.h"

@implementation JSDChef

- (instancetype)initWithName:(NSString *)name spped:(int)spped {
    
    self = [super init];
    if (!self) {
        return nil;
    }
    _name = name;
    _spped = spped;
    
    return self;
}

@end
