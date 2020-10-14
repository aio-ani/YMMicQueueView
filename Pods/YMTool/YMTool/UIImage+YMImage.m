//
//  UIImage+YMImage.m
//  YMTool
//
//  Created by aio on 2020/9/12.
//  Copyright © 2020 aio. All rights reserved.
//

#import "UIImage+YMImage.h"


@implementation UIImage (YMImage)

- (UIImage *)ym_scaleToSize:(CGSize)size{
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    CGFloat scale = [UIScreen mainScreen].scale;
//    CGSize size2 = CGSizeMake(scale * size.width, scale * size.height);
    
    if(scale > 1.0) {
        UIGraphicsBeginImageContextWithOptions(size, NO, scale);
    } else {
        UIGraphicsBeginImageContext(size);
    }
    
    // 绘制改变大小的图片
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    // 返回新的改变大小后的图片
    return scaledImage;
}

- (UIImage *)capResize {
    return [self capResize:0.5];
//    CGFloat top = self.size.height * 0.5; // 顶端盖高度
//    CGFloat bottom = self.size.height * 0.5 ; // 底端盖高度
//    CGFloat left = self.size.width * 0.5; // 左端盖宽度
//    CGFloat right = self.size.width * 0.5; // 右端盖宽度
//    UIEdgeInsets insets = UIEdgeInsetsMake(top, left, bottom, right);
//    UIImage *nImg = [self resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];
//    return nImg;
}

- (UIImage *)capResize:(CGFloat)percent {
    if (percent > 1.0) {
        percent = 0.5;
    }
    CGFloat top = self.size.height * percent; // 顶端盖高度
    CGFloat bottom = self.size.height * percent ; // 底端盖高度
    CGFloat left = self.size.width * percent; // 左端盖宽度
    CGFloat right = self.size.width * percent; // 右端盖宽度
    UIEdgeInsets insets = UIEdgeInsetsMake(top, left, bottom, right);
    UIImage *nImg = [self resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];
    return nImg;
}

- (UIImage *)capResizeWithScreenScale {
    CGFloat scale = [UIScreen mainScreen].scale;
    CGFloat width = self.size.width;
    CGFloat height = self.size.height;
    UIImage *zoomImage = [self ym_scaleToSize:CGSizeMake(width/scale, height/scale)];

    width = zoomImage.size.width;
    height = zoomImage.size.height;
    CGFloat top = height * 0.5; // 顶端盖高度
    CGFloat bottom = height * 0.5 ; // 底端盖高度
    CGFloat left = width * 0.5; // 左端盖宽度
    CGFloat right = width * 0.5; // 右端盖宽度
    UIEdgeInsets insets = UIEdgeInsetsMake(top, left, bottom, right);
    UIImage *nImg = [zoomImage resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];
    return nImg;
}

- (UIImage *)capResizeWithMinScreenScale:(CGFloat)sizeWidth {
    CGFloat scale = [UIScreen mainScreen].scale;
    CGFloat width = self.size.width;
    CGFloat height = self.size.height;
    
    CGFloat wscale = scale;
////    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    wscale = width/sizeWidth;
////    while (width/wscale > sizeWidth) {
////        wscale += 1;
////    }
    CGFloat sheight = self.size.height * sizeWidth/self.size.width;
    UIImage *zoomImage = [self ym_scaleToSize:CGSizeMake(sizeWidth, sheight)];
    width = zoomImage.size.width;
    height = zoomImage.size.height;
    CGFloat top = height * 0.5; // 顶端盖高度
    CGFloat bottom = height * 0.5 ; // 底端盖高度
    CGFloat left = width * 0.5; // 左端盖宽度
    CGFloat right = width * 0.5; // 右端盖宽度
    UIEdgeInsets insets = UIEdgeInsetsMake(top, left, bottom, right);
    UIImage *nImg = [zoomImage resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];
    return nImg;
}

- (UIImage *)capResizeByScreenScale {
    CGFloat scale = [UIScreen mainScreen].scale;
    CGFloat width = self.size.width;
    CGFloat height = self.size.height;
    
//    CGFloat wscale = scale;
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat realMuty = ceil(width/screenWidth);
//    wscale = width/screenWidth;
    
////    while (width/wscale > sizeWidth) {
////        wscale += 1;
////    }
//    CGFloat sheight = self.size.height * sizeWidth/self.size.width;
    UIImage *zoomImage = [self ym_scaleToSize:CGSizeMake(width/realMuty, height/realMuty)];
    width = zoomImage.size.width;
    height = zoomImage.size.height;
    CGFloat top = height * 0.3; // 顶端盖高度
    CGFloat bottom = height * 0.7 ; // 底端盖高度
    CGFloat left = width * 0.2; // 左端盖宽度
    CGFloat right = width * 0.8; // 右端盖宽度
    UIEdgeInsets insets = UIEdgeInsetsMake(top, left, bottom, right);
    UIImage *nImg = [zoomImage resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];
    return nImg;
}


@end
