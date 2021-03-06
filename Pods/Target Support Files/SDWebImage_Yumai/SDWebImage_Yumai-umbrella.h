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

#import "NSButton+WebCache.h"
#import "NSData+ImageContentType.h"
#import "NSImage+Compatibility.h"
#import "SDAnimatedImage.h"
#import "SDAnimatedImagePlayer.h"
#import "SDAnimatedImageRep.h"
#import "SDAnimatedImageView+WebCache.h"
#import "SDAnimatedImageView.h"
#import "SDDiskCache.h"
#import "SDGraphicsImageRenderer.h"
#import "SDImageAPNGCoder.h"
#import "SDImageAWebPCoder.h"
#import "SDImageCache.h"
#import "SDImageCacheConfig.h"
#import "SDImageCacheDefine.h"
#import "SDImageCachesManager.h"
#import "SDImageCoder.h"
#import "SDImageCoderHelper.h"
#import "SDImageCodersManager.h"
#import "SDImageFrame.h"
#import "SDImageGIFCoder.h"
#import "SDImageGraphics.h"
#import "SDImageHEICCoder.h"
#import "SDImageIOAnimatedCoder.h"
#import "SDImageIOCoder.h"
#import "SDImageLoader.h"
#import "SDImageLoadersManager.h"
#import "SDImageTransformer.h"
#import "SDMemoryCache.h"
#import "SDWebImageCacheKeyFilter.h"
#import "SDWebImageCacheSerializer.h"
#import "SDWebImageCompat.h"
#import "SDWebImageDefine.h"
#import "SDWebImageDownloader.h"
#import "SDWebImageDownloaderConfig.h"
#import "SDWebImageDownloaderDecryptor.h"
#import "SDWebImageDownloaderOperation.h"
#import "SDWebImageDownloaderRequestModifier.h"
#import "SDWebImageDownloaderResponseModifier.h"
#import "SDWebImageError.h"
#import "SDWebImageIndicator.h"
#import "SDWebImageManager.h"
#import "SDWebImageOperation.h"
#import "SDWebImageOptionsProcessor.h"
#import "SDWebImagePrefetcher.h"
#import "SDWebImageTransition.h"
#import "UIButton+WebCache.h"
#import "UIImage+ExtendedCacheData.h"
#import "UIImage+ForceDecode.h"
#import "UIImage+GIF.h"
#import "UIImage+MemoryCacheCost.h"
#import "UIImage+Metadata.h"
#import "UIImage+MultiFormat.h"
#import "UIImage+Transform.h"
#import "UIImageView+HighlightedWebCache.h"
#import "UIImageView+WebCache.h"
#import "UIView+WebCache.h"
#import "UIView+WebCacheOperation.h"
#import "NSBezierPath+SDRoundedCorners.h"
#import "SDAssociatedObject.h"
#import "SDAsyncBlockOperation.h"
#import "SDDeviceHelper.h"
#import "SDDisplayLink.h"
#import "SDFileAttributeHelper.h"
#import "SDImageAssetManager.h"
#import "SDImageCachesManagerOperation.h"
#import "SDImageIOAnimatedCoderInternal.h"
#import "SDInternalMacros.h"
#import "SDmetamacros.h"
#import "SDWeakProxy.h"
#import "SDWebImageTransitionInternal.h"
#import "UIColor+SDHexString.h"
#import "SDWebImage.h"

FOUNDATION_EXPORT double SDWebImage_YumaiVersionNumber;
FOUNDATION_EXPORT const unsigned char SDWebImage_YumaiVersionString[];

