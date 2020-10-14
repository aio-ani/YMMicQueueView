//
//  UIImage+YMImage.h
//  YMTool
//
//  Created by aio on 2020/9/12.
//  Copyright © 2020 aio. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (YMImage)

- (UIImage *)ym_scaleToSize:(CGSize)size;

- (UIImage *)capResize;

- (UIImage *)capResize:(CGFloat)percent;

- (UIImage *)capResizeWithScreenScale;

- (UIImage *)capResizeWithMinScreenScale:(CGFloat)sizeWidth;


/// 根据图片和屏幕的大小判断是几倍图,然后做放缩
- (UIImage *)capResizeByScreenScale;




@end

NS_ASSUME_NONNULL_END
