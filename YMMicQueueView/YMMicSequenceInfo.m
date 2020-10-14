//
//  YMMicSequence.m
//  YMMicQueueView
//
//  Created by aio on 2020/8/21.
//  Copyright © 2020 aio. All rights reserved.
//

#import "YMMicSequenceInfo.h"
#import "YMMicSequenceDelegate.h"
#import <objc/runtime.h>


@interface YMMicSequenceInfo ()

@property (weak, nonatomic,readwrite) id<YMMicSequenceDelegate> bind;


@end

@implementation YMMicSequenceInfo

- (void)setWave:(BOOL)wave {
    id<YMMicSequenceDelegate> bind = [self getBindDelegate];
    if (bind && [bind respondsToSelector:@selector(setWave:)]) {
        [bind setWave:wave];
    }
}

- (void)setMagic:(YMMagicInfo *)magic {
    id<YMMicSequenceDelegate> bind = [self getBindDelegate];
    if (bind && [bind respondsToSelector:@selector(setMagic:)]) {
        [bind setMagic:magic];
    }
}

- (id)getBindDelegate {
    id<YMMicSequenceDelegate> bind = objc_getAssociatedObject(self, @"bindkey");
    return bind;
}

- (void)setNull {
    _headUrl = nil;
    _levelFrame = nil;
    _desc = nil;
    id<YMMicSequenceDelegate> bind = [self getBindDelegate];
    if (bind && [bind respondsToSelector:@selector(updateViewWith:)]) {
        [bind updateViewWith:self];
    }
    self.wave = false;
}

- (void)setHeadUrl:(NSString *)headUrl {
    _headUrl = headUrl;
    id<YMMicSequenceDelegate> bind = [self getBindDelegate];
    if (bind && [bind respondsToSelector:@selector(updateViewWith:)]) {
        [bind updateViewWith:self];
    }
}

- (void)setLevelFrame:(NSString *)levelFrame {
    _levelFrame = levelFrame;
    id<YMMicSequenceDelegate> bind = [self getBindDelegate];
    if (bind && [bind respondsToSelector:@selector(updateViewWith:)]) {
        [bind updateViewWith:self];
    }
}

- (void)setDesc:(NSAttributedString *)desc {
    _desc = desc;
    id<YMMicSequenceDelegate> bind = [self getBindDelegate];
    if (bind && [bind respondsToSelector:@selector(updateViewWith:)]) {
        [bind updateViewWith:self];
    }
}

- (void)setMicBaned:(BOOL)micBaned {
    _micBaned = micBaned;
    id<YMMicSequenceDelegate> bind = [self getBindDelegate];
    if (bind && [bind respondsToSelector:@selector(setMicBaned:)]) {
        [bind setMicBaned:_micBaned];
    }
}

@end
