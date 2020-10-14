//
//  YMQueueConfig.h
//  YMMicQueueView
//
//  Created by aio on 2020/8/21.
//  Copyright © 2020 aio. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YMQueueConfig : YMObject


//@property (strong, nonatomic,readwrite) NSString *waveGif;
//
//@property (strong, nonatomic,readwrite) NSString *emceeFrameImg;
//
//@property (strong, nonatomic,readwrite) NSString *bossFrameImg;
//
//@property (strong, nonatomic,readwrite) NSString *normalFrameImg;

@property (assign, nonatomic,readwrite) CGFloat waveMulty;


@property (strong, nonatomic,readwrite) NSString *micBanedImg;





+ (instancetype)config;

+ (void)destory;




@end

NS_ASSUME_NONNULL_END
