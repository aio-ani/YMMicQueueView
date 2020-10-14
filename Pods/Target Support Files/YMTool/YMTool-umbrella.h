#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "UIImage+YMImage.h"
#import "UIView+YMView.h"
#import "YMDLog.h"
#import "YMMacro.h"
#import "YMTool.h"

FOUNDATION_EXPORT double YMToolVersionNumber;
FOUNDATION_EXPORT const unsigned char YMToolVersionString[];

