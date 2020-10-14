//
//  YMMicSequenceView.m
//  YMMicQueueView
//
//  Created by aio on 2020/8/21.
//  Copyright © 2020 aio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YMMicSequenceView.h"
#import "YMMicSequenceInfo.h"
#import <YMTool/YMTool.h>
#import "YMMicView.h"
#import "YMTopEmceeView.h"
#import "YMMicSequenceViewDelegate.h"
#import "YMTopEmceeViewDelegate.h"
#import "YMQueueConfig.h"

/// 左右
#define YM_MIC_MARGIN_LEFT 8
/// 上
#define YM_MIC_MARGIN_TOP 0
/// 下
#define YM_MIC_MARGIN_BOTTOM 3
/// 内部左右
#define YM_MIC_PADDING_LEFT 10
/// 内部上下
#define YM_MIC_PADDING_TOP 0


#define YM_COLUMN_COUNT 4


//#define YM_HEIGHT_MULFY 1.3

@interface YMMicSequenceView () <YMTopEmceeViewDelegate> {
    CGFloat _width,_height;
    int _column,_row;
}

@property (strong, nonatomic,readwrite) YMTopEmceeView *topEmceeView;
@property (strong, nonatomic,readwrite) UIView *normalEmceeView;


@property (strong, nonatomic,readonly) NSArray<YMMicSequenceInfo *> *micQueue;
@property (strong, nonatomic,readonly) NSArray<YMMicSequenceInfo *> *emceeQueue;

@property (strong, nonatomic,readwrite) NSMutableArray *views;



@end

@implementation YMMicSequenceView

- (void)dealloc {
    [YMQueueConfig destory];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self initialConfig];
    [self setupUI];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initialConfig];
        [self setupUI];
    }
    return self;
}

- (CGFloat)posHeight {
    return _height;
}

- (void)initialConfig {
    _width = (self.width - YM_MIC_MARGIN_LEFT * 2 - (YM_COLUMN_COUNT - 1) * YM_MIC_PADDING_LEFT)/YM_COLUMN_COUNT;
    _height = YM_IMG_MARGIN_BOTTOM + YM_IMG_MARGIN_TOP + (_width - YM_IMG_MARGIN_LEFT * 2) + YM_DESC_FONT * 2;
}

- (NSMutableArray *)views {
    if (!_views) {
        _views = [[NSMutableArray alloc] init];
    }
    return _views;
}

- (void)realoadSequenceWith:(NSArray *)micQueue topQueue:(NSArray *)topQueue {
    _micQueue = micQueue;
    _emceeQueue = topQueue;
    [self loadUI];
    [self updateFrame];
    [self updateData];
}

- (YMTopEmceeView *)topEmceeView {
    if (!_topEmceeView) {
        _topEmceeView = [[YMTopEmceeView alloc] initWithFrame:CGRectMake(0, 0, self.width, 0)];
        _topEmceeView.delegate = self;
    }
    return _topEmceeView;
}

- (UIView *)normalEmceeView {
    if (!_normalEmceeView) {
        _normalEmceeView = [[UIView alloc] initWithFrame:CGRectMake(0, _topEmceeView.bottom, self.width, 0)];
    }
    return _normalEmceeView;
}

- (void)setupUI {
    self.clipsToBounds = false;
    self.clearsContextBeforeDrawing = false;
    [self.topEmceeView setupWithType:YMQueueTypeOrder size:CGSizeMake(_width, _height)];
    [self addSubview:self.topEmceeView];
    [self addSubview:self.normalEmceeView];

}

- (void)loadUI {
    int count = (int)_micQueue.count;
    _column = YM_COLUMN_COUNT;
    _row = count/_column + (count%2==0 ? 0:1);
    for (int r = 0; r < _row; r++) {
        for (int c = 0; c < _column; c++) {
            NSUInteger index = r*YM_COLUMN_COUNT + c;
            CGFloat x = YM_MIC_MARGIN_LEFT + (_width+YM_MIC_PADDING_LEFT)*c;
            CGFloat y = YM_MIC_MARGIN_TOP + (_height + YM_MIC_PADDING_TOP)*r;
            UIView *view = [self getEmceeView:index];
            view.frame = CGRectMake(x, y, _width, _height);
            [self.normalEmceeView addSubview:view];
        }
    }
}

- (void)updateFrame {
    CGFloat topHeight = 0;
    if (_emceeQueue.count) {
        topHeight = _height;
    }
    self.topEmceeView.height = topHeight;
    int row = (_row - 1 < 0 ? 0 : _row);
    CGFloat height = YM_MIC_MARGIN_TOP + YM_MIC_MARGIN_BOTTOM + row * _height + (row - 1) * YM_MIC_PADDING_TOP;
    self.normalEmceeView.frame = CGRectMake(0, _topEmceeView.bottom, self.width, height);
    self.frame = CGRectMake(self.left, self.top, self.width, self.normalEmceeView.bottom);
}

- (UIView *)getEmceeView:(NSUInteger)index {
    NSUInteger c = self.views.count;
    if (index >= c) {
        YMMicView *view = [[YMMicView alloc] init];
        [view addTarget:self action:@selector(micViewEvent:) forControlEvents:UIControlEventTouchUpInside];
        [self.views addObject:view];
    }
    return [self.views objectAtIndex:index];
}

- (void)updateData {
    if (_views.count != _micQueue.count) {
        DLog(@"普通麦位数据错误");
        return;
    }
    __weak typeof(self) weakself = self;
    [_views enumerateObjectsUsingBlock:^(YMMicView * _Nonnull view, NSUInteger idx, BOOL * _Nonnull stop) {
        YMMicSequenceInfo *sequence = [weakself.micQueue objectAtIndex:idx];
        [view updateViewWith:sequence];
    }];
    
    [_topEmceeView updateDataWith:_emceeQueue];
}

- (void)micViewEvent:(YMMicView *)sender {
    if (_delegate && [_delegate respondsToSelector:@selector(selectedMicView:atIndex:withData:)]) {
        NSUInteger index = [self.views indexOfObject:sender];
        if (index != NSNotFound) {
            YMMicSequenceInfo *sequence = [_micQueue objectAtIndex:index];
            [_delegate selectedMicView:sender atIndex:index withData:sequence];
        }
    }
}


#pragma mark - YMTopEmceeViewDelegate

- (void)selectedMicView:(YMMicView *)view atIndex:(NSUInteger)index withData:(YMMicSequenceInfo *)data {
    if (_delegate && [_delegate respondsToSelector:@selector(selectedMicView:atIndex:withData:)]) {
        [_delegate selectedMicView:view atIndex:index withData:data];
    }
}





@end
