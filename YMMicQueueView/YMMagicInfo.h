//
//  YMMagicInfo.h
//  YMMicQueueView
//
//  Created by aio on 2020/8/22.
//  Copyright © 2020 aio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YMObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface YMMagicInfo : YMObject

@property (strong, nonatomic,readwrite) NSString *magicName;

@property (assign, nonatomic,readwrite) int magicCount;

@property (assign, nonatomic,readwrite) NSTimeInterval delay;

@property (strong, nonatomic,readwrite) NSString *completedImg;



@end

NS_ASSUME_NONNULL_END
