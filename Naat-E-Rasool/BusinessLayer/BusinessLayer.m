//
//  BusinessLayer.m
//  Naat-E-Rasool
//
//  Created by Matloob Hasnain on 27/08/2014.
//  Copyright (c) 2014 terabyteLogixs. All rights reserved.
//

#import "BusinessLayer.h"

@implementation BusinessLayer


+(BusinessLayer *)sharedLayer {
    
    static BusinessLayer *_sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedManager = [[self alloc] init];
    });
    
    return _sharedManager;
}

@end
