//
//  YMQueueConfig.m
//  YMMicQueueView
//
//  Created by aio on 2020/8/21.
//  Copyright © 2020 aio. All rights reserved.
//

#import "YMQueueConfig.h"
#import "YMObject.h"


@interface YMQueueConfig ()



@end


@implementation YMQueueConfig

static YMQueueConfig *shared;
static dispatch_once_t oneToken;
+ (instancetype)config {
    dispatch_once(&oneToken, ^{
        shared = [[YMQueueConfig alloc]init];
    });
    return shared;
}

+ (void)destory {
    oneToken = 0;
    shared = nil;
}






@end
