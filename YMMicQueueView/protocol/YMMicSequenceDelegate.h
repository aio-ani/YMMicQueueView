//
//  YMMicSequenceDelegate.h
//  YMMicQueueView
//
//  Created by aio on 2020/8/21.
//  Copyright © 2020 aio. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class YMMagicInfo;
@protocol YMMicSequenceDelegate <NSObject>

/// 声纹展示
- (void)setWave:(BOOL)wave;

- (void)setMagic:(YMMagicInfo *)magic;

- (void)updateViewWith:(id)data;

- (void)setHeadUrl:(NSString *)headUrl;

- (void)setLevelFrame:(NSString *)levelFrame;

- (void)setDesc:(NSAttributedString *)desc;

- (void)setMicBaned:(BOOL)ban;



@end

NS_ASSUME_NONNULL_END
