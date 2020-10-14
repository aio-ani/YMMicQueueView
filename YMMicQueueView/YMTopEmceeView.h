//
//  YMTopEmceeView.h
//  YMMicQueueView
//
//  Created by aio on 2020/8/21.
//  Copyright © 2020 aio. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


typedef NS_ENUM(NSInteger, YMQueueType) {
    
    YMQueueTypeNone = 0,

    YMQueueTypeNormal,
    
    /// 派单
    YMQueueTypeOrder,
};

@protocol YMTopEmceeViewDelegate;
@interface YMTopEmceeView : YMBaseView

@property (weak, nonatomic,readwrite) id<YMTopEmceeViewDelegate> delegate;


- (void)setupWithType:(YMQueueType)type size:(CGSize)size;

- (void)updateDataWith:(NSArray *)datas;


@end

NS_ASSUME_NONNULL_END
