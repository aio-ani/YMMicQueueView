//
//  DDWaterVaveView.h
//  WaterWaveTest
//
//  Created by Dry on 2017/7/28.
//  Copyright © 2017年 Dry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YMWaterVaveView : UIView

@property (assign, nonatomic,readwrite) float duration;

@property (assign, nonatomic,readwrite) NSUInteger circles;

@property (assign, nonatomic,readwrite) CGFloat maxWidth;

@property (strong, nonatomic,readwrite) UIColor *indicatorColor;


@property (assign, nonatomic,readwrite) BOOL wave;


@end
