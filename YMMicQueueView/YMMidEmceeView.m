//
//  YMEmceeView.m
//  YMMicQueueView
//
//  Created by aio on 2020/8/21.
//  Copyright © 2020 aio. All rights reserved.
//

#import "YMMidEmceeView.h"
#import <YMTool/UIView+YMView.h>
#import <SDAnimatedImageView.h>
#import <SDWebImage_Yumai/SDWebImage.h>
#import <YMWaterWave/YMWaterWave.h>
#import "YMQueueConfig.h"


#define YM_HEAD_MARGIN 6.0

@interface YMMidEmceeView ()

/// 波纹
@property (strong, nonatomic,readwrite) YMWaterVaveView *waveImg;

/// 头像框
@property (strong, nonatomic,readwrite) SDAnimatedImageView *headFrameImg;

/// 头像
@property (strong, nonatomic,readwrite) SDAnimatedImageView *headImg;

@property (strong, nonatomic,readwrite) SDAnimatedImageView *placeholderImg;



@end


@implementation YMMidEmceeView

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    self.clipsToBounds = false;
    self.clearsContextBeforeDrawing = false;
    _waveImg = [[YMWaterVaveView alloc] initWithFrame:CGRectMake(0, 0, self.width*0.5, self.width*0.5)];
    _waveImg.hidden = true;
    _waveImg.circles = 5;
    _waveImg.duration = 4;
    _waveImg.indicatorColor = [UIColor colorWithRed:0 green:1.0 blue:0xd4/255.0 alpha:0.1];
    
    _headFrameImg = [[SDAnimatedImageView alloc] initWithFrame:self.bounds];
    _headImg = [[SDAnimatedImageView alloc] init];
    _placeholderImg = [[SDAnimatedImageView alloc] init];
    [self addSubview:_waveImg];
    [self addSubview:_placeholderImg];
    [self addSubview:_headImg];
    [self addSubview:_headFrameImg];
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    [self updateFrame];
}

- (void)updateFrame {
    _headFrameImg.frame = self.bounds;
    CGFloat width = self.width - YM_HEAD_MARGIN * 2;
    CGRect rect = CGRectMake(YM_HEAD_MARGIN, YM_HEAD_MARGIN, width, width);
    _headImg.frame = rect;
    _headImg.layer.cornerRadius = _headImg.width * 0.5;
    _headImg.layer.masksToBounds = true;
    
    _placeholderImg.frame = _headImg.frame;
//    CGPoint center = self.headImg.center;
//    self.headFrameImg.center = center;

    _waveImg.frame = CGRectMake(0, 0, self.width*0.5, self.width*0.5);
    _waveImg.center = _headImg.ym_center;
    _waveImg.maxWidth = self.width * YMQueueConfig.config.waveMulty;
}

- (void)setHeadImgName:(NSString *)headImgName {
    if (![_headImgName isEqualToString:headImgName]) {
        _headImgName = headImgName;
        if (_headImgName) {
            [_headImg sd_setImageWithURL:[NSURL URLWithString:_headImgName] placeholderImage:[UIImage imageNamed:@"placeholder_icon"] options:0];
        } else {
            _headImg.image = nil;
        }
    }
}

- (void)setPlaceholderImgName:(NSString *)placeholderImgName {
    if (![_placeholderImgName isEqualToString:placeholderImgName]) {
        _placeholderImgName = placeholderImgName;
        if (_placeholderImgName) {
            _placeholderImg.image = [UIImage imageNamed:placeholderImgName];
        } else {
            _placeholderImg.image = nil;
        }
    }
}

- (void)setHeadFrameImgName:(NSString *)headFrameImgName {
    if (![_headFrameImgName isEqualToString:headFrameImgName]) {
        _headFrameImgName = headFrameImgName;
        if (_headFrameImgName) {
            if ([headFrameImgName containsString:@"http"]) {
                __weak typeof(self) weakself = self;
                [_headFrameImg sd_setImageWithURL:[NSURL URLWithString:headFrameImgName] placeholderImage:nil completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
                    CGSize size = image.size;
                    CGFloat scale = (image.size.width - weakself.frameOffset.x * 2)/weakself.headImg.size.width;
                    weakself.headFrameImg.size = CGSizeMake(size.width/scale, size.height/scale);
                    
                    CGPoint center = weakself.headImg.center;
                    weakself.headFrameImg.center = center;
                }];
            } else {
                _headFrameImg.image = [UIImage imageNamed:_headFrameImgName];
            }
        } else {
            _headFrameImg.image = nil;
        }
    }
}

- (void)setFrameOffset:(CGPoint)frameOffset {
    _frameOffset = frameOffset;
//    _headFrameImg.origin = CGPointMake(frameOffset.x, frameOffset.y);
}

- (void)setWave:(BOOL)wave {
    _waveImg.hidden = !wave;
    _waveImg.wave = wave;
}

- (void)setNull {
    self.headFrameImgName = nil;
    self.headImgName = nil;
}






@end
