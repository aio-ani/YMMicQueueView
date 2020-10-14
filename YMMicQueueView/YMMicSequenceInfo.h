//
//  YMMicSequence.h
//  YMMicQueueView
//
//  Created by aio on 2020/8/21.
//  Copyright © 2020 aio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YMObject.h"

NS_ASSUME_NONNULL_BEGIN

//typedef NS_ENUM(NSInteger, YMMicType) {
//    /// 顶部
//    YMMicTypeTop = 0,
//
//    /// 中间
//    YMMicTypeNormal,
//};

@class YMMagicInfo;
@interface YMMicSequenceInfo : YMObject

//@property (assign, nonatomic,readwrite) YMMicType micType;

@property (weak, nonatomic,readwrite) id bindData;

@property (strong, nonatomic,readwrite) NSString *identify;

/// 麦位填充图
@property (strong, nonatomic,readwrite) NSString *placeholderImg;

/// 头像
@property (strong, nonatomic,readwrite) NSString *headUrl;

/// 头像框
@property (strong, nonatomic,readwrite,nullable) NSString *levelFrame;

/// 麦位描述
@property (strong, nonatomic,readwrite) NSAttributedString *desc;

/// 麦序
@property (assign, nonatomic,readwrite) NSInteger position;

/// 麦序填充简称
@property (strong, nonatomic,readwrite) NSAttributedString *positionAbb;

/// 闭麦
@property (assign, nonatomic,readwrite) BOOL micBaned;

/// 声波
@property (assign, nonatomic,readwrite,setter=setWave:) BOOL wave;

/// 框偏移
@property (assign, nonatomic,readwrite) CGPoint frameOffset;


/// gif动画
//@property (strong, nonatomic,readwrite) NSString *magicGif;




- (void)setMagic:(YMMagicInfo *)magic;

- (void)setNull;

@end

NS_ASSUME_NONNULL_END
