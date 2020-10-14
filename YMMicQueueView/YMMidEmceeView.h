//
//  YMEmceeView.h
//  YMMicQueueView
//
//  Created by aio on 2020/8/21.
//  Copyright © 2020 aio. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YMMidEmceeView : YMBaseView

@property (strong, nonatomic,readwrite) NSString *headFrameImgName;

@property (strong, nonatomic,readwrite) NSString *headImgName;

@property (strong, nonatomic,readwrite) NSString *placeholderImgName;

@property (assign, nonatomic,readwrite) CGPoint frameOffset;



@property (assign, nonatomic,readwrite) BOOL wave;

- (void)setNull;

@end

NS_ASSUME_NONNULL_END
