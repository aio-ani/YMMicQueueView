//
//  YMMicView.m
//  YMMicQueueView
//
//  Created by aio on 2020/8/21.
//  Copyright © 2020 aio. All rights reserved.
//

#import <objc/runtime.h>
#import "YMMicView.h"
#import "YMMidEmceeView.h"
#import <YMTool/UIView+YMView.h>
#import "YMMicSequenceInfo.h"
#import "YMTool/YMMacro.h"
#import "YMMicSequenceDelegate.h"
#import <SDWebImage/SDWebImage.h>
#import "YMMagicInfo.h"
#import "YMQueueConfig.h"


#define YM_MAGIC_PADDING 20.0

#define YM_PLACEHOLDER_FONT_SIZE 12.0


@interface YMMicView () <YMMicSequenceDelegate,SDAnimatedImageViewDelegate> {
    
    NSUInteger _imagesCount;

}


@property (strong, nonatomic,readwrite) YMMidEmceeView *emceeView;

@property (strong, nonatomic,readwrite) SDAnimatedImageView *magicImg;

@property (strong, nonatomic,readwrite) UIImageView *banMicImg;

@property (strong, nonatomic,readwrite) UILabel *attributeLbl;

@property (strong, nonatomic,readwrite) YMMagicInfo *magic;




@end

@implementation YMMicView

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
#ifdef YM_ENV_VAR_DEBUG
        self.backgroundColor = [UIColor systemPinkColor];
#endif
    }
    return self;
}

- (void)setupUI {
    self.clipsToBounds = false;
    self.clearsContextBeforeDrawing = false;
    _emceeView = [[YMMidEmceeView alloc] init];
    _emceeView.userInteractionEnabled = false;
    [self addSubview:_emceeView];
    
    _attributeLbl = [[UILabel alloc] init];
    _attributeLbl.font = [UIFont systemFontOfSize:YM_PLACEHOLDER_FONT_SIZE];
    _attributeLbl.textAlignment = NSTextAlignmentCenter;
    _attributeLbl.numberOfLines = 2;
    _attributeLbl.lineBreakMode = NSLineBreakByTruncatingTail;
    _attributeLbl.textColor = [UIColor whiteColor];
#ifdef YM_ENV_VAR_DEBUG
    _attributeLbl.backgroundColor = [UIColor darkGrayColor];
#endif
    [self addSubview:_attributeLbl];
    
    _banMicImg = [[UIImageView alloc] init];
    _banMicImg.hidden = true;
    [self addSubview:_banMicImg];

    _magicImg = [[SDAnimatedImageView alloc] init];
    _magicImg.delegate = self;
    _magicImg.hidden = true;
    [self addSubview:_magicImg];
}

- (void)didMoveToSuperview {
    [super didMoveToSuperview];
    if (self.superview) {
        [self updateFrame];
    }
}

- (void)updateFrame {
    CGFloat imgWidth = self.width - YM_IMG_MARGIN_LEFT * 2;
    CGRect imgFrame = CGRectMake(0, YM_IMG_MARGIN_TOP, imgWidth, imgWidth);
    _emceeView.frame = imgFrame;
    _emceeView.centerX = self.width*0.5;
    
    CGRect frame = CGRectMake(0, _emceeView.bottom + YM_IMG_MARGIN_BOTTOM, self.width, YM_DESC_FONT * 2);
    _attributeLbl.frame = frame;
    
    _magicImg.size = CGSizeMake(_emceeView.width - YM_MAGIC_PADDING, _emceeView.height - YM_MAGIC_PADDING);
    _magicImg.center = _emceeView.ym_center;
    NSString *banImg = YMQueueConfig.config.micBanedImg;
    UIImage *img = [UIImage imageNamed:banImg];
    _banMicImg.image = img;
    _banMicImg.size = CGSizeMake(img.size.width, img.size.height);
    _banMicImg.center = _emceeView.center;
    _banMicImg.origin = CGPointMake(_emceeView.right - _banMicImg.width, _emceeView.top + _banMicImg.height * 0.5);
}

- (void)updateViewWith:(YMMicSequenceInfo *)data {
    [self reset];
    if (data.desc.length) {
        _attributeLbl.attributedText = data.desc;
    } else {
        _attributeLbl.attributedText = data.positionAbb;
    }
    _emceeView.headImgName = data.headUrl;
    _emceeView.placeholderImgName = data.placeholderImg;
    _emceeView.frameOffset = data.frameOffset;
    _emceeView.headFrameImgName = data.levelFrame;
    [self setMicBaned:data.micBaned];
    objc_setAssociatedObject(data, @"bindkey", self, OBJC_ASSOCIATION_ASSIGN);
}

- (void)hideMagic {
    [_magicImg stopAnimating];
    _magicImg.image = nil;
    _magicImg.hidden = true;
}

- (void)reset {
    [self hideMagic];
    _emceeView.wave = false;
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(hideMagic) object:nil];
}

#pragma mark - YMMicSequenceDelegate

- (void)setWave:(BOOL)wave {
    _emceeView.wave = wave;
}

- (void)setMagic:(YMMagicInfo *)magic {
    [self reset];
    _magic = magic;
    _magicImg.hidden = false;
    _magicImg.animationRepeatCount = magic.magicCount;
    _magicImg.shouldCustomLoopCount = true;
    SDAnimatedImage *animeImage = [SDAnimatedImage imageNamed:magic.magicName];
    _imagesCount = animeImage.animatedImageFrameCount;
    _magicImg.image = animeImage;
}

- (void)setHeadUrl:(NSString *)headUrl {
    _emceeView.headImgName = headUrl;
}

- (void)setLevelFrame:(NSString *)levelFrame {
    _emceeView.headFrameImgName = levelFrame;
}

- (void)setDesc:(NSAttributedString *)desc {
    _attributeLbl.attributedText = desc;
}

- (void)setMicBaned:(BOOL)ban {
    _banMicImg.hidden = ban ? false : true;
}

//- (void)setNull {
//    [self reset];
//    _attributeLbl.attributedText = nil;
//    [_emceeView setNull];
//}

#pragma mark - SDAnimatedImageViewDelegate

- (void)animetionEnded:(NSUInteger)loopCount {
    NSString *completeImg = _magic.completedImg;
    if (completeImg.length) {
        _magicImg.image = [UIImage imageNamed:completeImg];
    }
    [self performSelector:@selector(hideMagic) withObject:nil afterDelay:_magic.delay];
    
}








@end








