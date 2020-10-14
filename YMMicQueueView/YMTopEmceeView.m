//
//  YMTopEmceeView.m
//  YMMicQueueView
//
//  Created by aio on 2020/8/21.
//  Copyright © 2020 aio. All rights reserved.
//

#import "YMTopEmceeView.h"
#import "YMMicView.h"
#import <YMTool/YMMacro.h>
#import "YMMicSequenceInfo.h"
#import "YMTopEmceeViewDelegate.h"


#define YM_MARGIN_LEFT 60.0


@interface YMTopEmceeView () {
    YMQueueType _type;
    CGSize _itemSize;
}

@property (strong, nonatomic,readwrite) NSMutableArray *views;

@property (weak, nonatomic,readwrite) NSArray<YMMicSequenceInfo *> *mics;

@property (strong, nonatomic,readwrite) UIView *middleOrderNumView;

@property (weak, nonatomic,readwrite) UILabel *numLbl;




@end


@implementation YMTopEmceeView

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (instancetype)init {
    self = [super init];
    if (self) {
         _type = YMQueueTypeNormal;
        _itemSize = CGSizeZero;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {

    }
    return self;
}

- (void)setupWithType:(YMQueueType)type size:(CGSize)size {
    _type = type;
    _itemSize = size;
    [self setupUI];
}

- (void)updateDataWith:(NSArray *)datas {
    _mics = datas;
    if (_views.count != datas.count) {
        DLog(@"普通麦位数据错误");
        return;
    }
//    __weak typeof(self) weakself = self;
    [_views enumerateObjectsUsingBlock:^(YMMicView * _Nonnull view, NSUInteger idx, BOOL * _Nonnull stop) {
        YMMicSequenceInfo *sequence = [datas objectAtIndex:idx];
        [view updateViewWith:sequence];
    }];
}


- (NSMutableArray *)views {
    if (!_views) {
        _views = [[NSMutableArray alloc] init];
    }
    return _views;
}

- (void)setupUI {
    switch (_type) {
        case YMQueueTypeNone: {
            [_views makeObjectsPerformSelector:@selector(removeFromSuperview)];
            _views = nil;
        }
            break;
        case YMQueueTypeNormal: {
            UIView *view = [self getEmceeView:0];
            view.frame = CGRectMake(0, 0, _itemSize.width, _itemSize.height);
            view.center = self.center;
            [self addSubview:view];
            [self.views addObject:view];
        }
            break;
        case YMQueueTypeOrder: {
            UIView *view1 = [self getEmceeView:0];
            view1.frame = CGRectMake(YM_MARGIN_LEFT, 0, _itemSize.width, _itemSize.height);
            [self addSubview:view1];
            
            UIView *view2 = [self getEmceeView:1];
            view2.frame = CGRectMake(SCREEN_WIDTH - YM_MARGIN_LEFT - _itemSize.width, 0, _itemSize.width, _itemSize.height);
            [self addSubview:view2];
        }
            break;
            
        default:
            break;
    }
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

- (void)micViewEvent:(YMMicView *)sender {
    if (_delegate && [_delegate respondsToSelector:@selector(selectedMicView:atIndex:withData:)]) {
        NSUInteger index = [self.views indexOfObject:sender];
        if (index != NSNotFound) {
            YMMicSequenceInfo *sequence = [_mics objectAtIndex:index];
            [_delegate selectedMicView:sender atIndex:index withData:sequence];
        }
    }
}

//- (UIView *)middleOrderNumView {
//    if (!_middleOrderNumView) {
//        _middleOrderNumView = [[UIView alloc] init];
//        UILabel *lbl = [[UILabel alloc] init];
//        lbl.text = @"最近7日";
//        lbl.textColor = [UIColor colorWithWhite:1 alpha:0.4];
//        lbl.font = [UIFont systemFontOfSize:12 weight:UIFontWeightMedium];
//        lbl.textAlignment = NSTextAlignmentCenter;
//        [lbl sizeToFit];
//        [_middleOrderNumView addSubview:lbl];
//        
//        UILabel *numLbl = [[UILabel alloc] init];
//        _numLbl = numLbl;
//        numLbl.text = @"派单次数0";
//        numLbl.textColor = [UIColor whiteColor];
//        numLbl.font = [UIFont systemFontOfSize:12 weight:UIFontWeightMedium];
//        numLbl.textAlignment = NSTextAlignmentCenter;
//        [numLbl sizeToFit];
//        [_middleOrderNumView addSubview:numLbl];
//        
//        UIButton *orderBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//        orderBtn.titleLabel.text = @"一键派单";
//        orderBtn.titleLabel.font = [UIFont systemFontOfSize:12 weight:UIFontWeightMedium];
//        [orderBtn setTitleColor:gHex(@"#00FFD3") forState:UIControlStateNormal];
//        orderBtn.contentEdgeInsets = UIEdgeInsetsMake(5, 10, 5, 10);
//        [orderBtn sizeToFit];
//        [_middleOrderNumView addSubview:orderBtn];
//    }
//    return _middleOrderNumView;
//}



@end
