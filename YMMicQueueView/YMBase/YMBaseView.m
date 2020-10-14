//
//  YMBaseView.m
//  YMMicQueueView
//
//  Created by aio on 2020/8/22.
//  Copyright © 2020 aio. All rights reserved.
//

#import "YMBaseView.h"

@implementation YMBaseView

#ifdef YM_ENV_VAR_DEBUG
- (void)dealloc {
    DLog(@"%@ has been dealloced",[self class]);
}
#endif

@end
