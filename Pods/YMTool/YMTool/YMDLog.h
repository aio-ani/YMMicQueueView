//
//  Dlog.h
//  YMSVGA
//
//  Created by aio on 2020/8/14.
//  Copyright © 2020 aio. All rights reserved.
//

#import <Availability.h>


#ifdef YM_ENV_VAR_DEBUG
#define DLog(...) NSLog(@"%s(%p) %@", __PRETTY_FUNCTION__, self, [NSString stringWithFormat:__VA_ARGS__])
#else
#define DLog(...)
#endif


