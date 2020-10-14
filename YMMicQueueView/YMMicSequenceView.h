//
//  YMMicSequenceView.h
//  YMMicQueueView
//
//  Created by aio on 2020/8/21.
//  Copyright © 2020 aio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YMBaseView.h"


NS_ASSUME_NONNULL_BEGIN

@protocol YMMicSequenceViewDelegate;
@interface YMMicSequenceView : YMBaseView

@property (weak, nonatomic,readwrite) id<YMMicSequenceViewDelegate> delegate;

@property (assign, nonatomic,readonly) CGFloat posHeight;


/// 刷新麦序
- (void)realoadSequenceWith:(NSArray *)micQueue topQueue:(NSArray *)topQueue;

/// 刷新某个麦位
- (void)reloadMicAt:(NSInteger)position;


@end

NS_ASSUME_NONNULL_END
