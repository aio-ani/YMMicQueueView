//
//  YMMicView.h
//  YMMicQueueView
//
//  Created by aio on 2020/8/21.
//  Copyright © 2020 aio. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#define YM_IMG_MARGIN_BOTTOM 3.0
#define YM_IMG_MARGIN_TOP 3.0
#define YM_IMG_MARGIN_LEFT 8.0

#define YM_DESC_FONT 15.0

@interface YMMicView : YMBaseView

- (void)updateViewWith:(id)data;

@end

NS_ASSUME_NONNULL_END
