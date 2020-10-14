//
//  YMMicSequenceViewDelegate.h
//  YMMicQueueView
//
//  Created by aio on 2020/8/22.
//  Copyright © 2020 aio. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class YMMicView,YMMicSequenceInfo;
@protocol YMMicSequenceViewDelegate <NSObject>

- (void)selectedMicView:(YMMicView *)view atIndex:(NSUInteger)index withData:(YMMicSequenceInfo *)data;



@end

NS_ASSUME_NONNULL_END
