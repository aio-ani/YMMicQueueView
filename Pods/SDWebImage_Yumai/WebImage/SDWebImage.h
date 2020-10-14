/*
 * This file is part of the SDWebImage package.
 * (c) Olivier Poitrey <rs@dailymotion.com>
 * (c) Florent Vilmart
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

#import <SDWebImage_Yumai/SDWebImageCompat.h>

//! Project version number for SDWebImage.
FOUNDATION_EXPORT double SDWebImageVersionNumber;

//! Project version string for SDWebImage.
FOUNDATION_EXPORT const unsigned char SDWebImageVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <SDWebImage/PublicHeader.h>

#import <SDWebImage_Yumai/SDWebImageManager.h>
#import <SDWebImage_Yumai/SDWebImageCacheKeyFilter.h>
#import <SDWebImage_Yumai/SDWebImageCacheSerializer.h>
#import <SDWebImage_Yumai/SDImageCacheConfig.h>
#import <SDWebImage_Yumai/SDImageCache.h>
#import <SDWebImage_Yumai/SDMemoryCache.h>
#import <SDWebImage_Yumai/SDDiskCache.h>
#import <SDWebImage_Yumai/SDImageCacheDefine.h>
#import <SDWebImage_Yumai/SDImageCachesManager.h>
#import <SDWebImage_Yumai/UIView+WebCache.h>
#import <SDWebImage_Yumai/UIImageView+WebCache.h>
#import <SDWebImage_Yumai/UIImageView+HighlightedWebCache.h>
#import <SDWebImage_Yumai/SDWebImageDownloaderConfig.h>
#import <SDWebImage_Yumai/SDWebImageDownloaderOperation.h>
#import <SDWebImage_Yumai/SDWebImageDownloaderRequestModifier.h>
#import <SDWebImage_Yumai/SDWebImageDownloaderResponseModifier.h>
#import <SDWebImage_Yumai/SDWebImageDownloaderDecryptor.h>
#import <SDWebImage_Yumai/SDImageLoader.h>
#import <SDWebImage_Yumai/SDImageLoadersManager.h>
#import <SDWebImage_Yumai/UIButton+WebCache.h>
#import <SDWebImage_Yumai/SDWebImagePrefetcher.h>
#import <SDWebImage_Yumai/UIView+WebCacheOperation.h>
#import <SDWebImage_Yumai/UIImage+Metadata.h>
#import <SDWebImage_Yumai/UIImage+MultiFormat.h>
#import <SDWebImage_Yumai/UIImage+MemoryCacheCost.h>
#import <SDWebImage_Yumai/UIImage+ExtendedCacheData.h>
#import <SDWebImage_Yumai/SDWebImageOperation.h>
#import <SDWebImage_Yumai/SDWebImageDownloader.h>
#import <SDWebImage_Yumai/SDWebImageTransition.h>
#import <SDWebImage_Yumai/SDWebImageIndicator.h>
#import <SDWebImage_Yumai/SDImageTransformer.h>
#import <SDWebImage_Yumai/UIImage+Transform.h>
#import <SDWebImage_Yumai/SDAnimatedImage.h>
#import <SDWebImage_Yumai/SDAnimatedImageView.h>
#import <SDWebImage_Yumai/SDAnimatedImageView+WebCache.h>
#import <SDWebImage_Yumai/SDAnimatedImagePlayer.h>
#import <SDWebImage_Yumai/SDImageCodersManager.h>
#import <SDWebImage_Yumai/SDImageCoder.h>
#import <SDWebImage_Yumai/SDImageAPNGCoder.h>
#import <SDWebImage_Yumai/SDImageGIFCoder.h>
#import <SDWebImage_Yumai/SDImageIOCoder.h>
#import <SDWebImage_Yumai/SDImageFrame.h>
#import <SDWebImage_Yumai/SDImageCoderHelper.h>
#import <SDWebImage_Yumai/SDImageGraphics.h>
#import <SDWebImage_Yumai/SDGraphicsImageRenderer.h>
#import <SDWebImage_Yumai/UIImage+GIF.h>
#import <SDWebImage_Yumai/UIImage+ForceDecode.h>
#import <SDWebImage_Yumai/NSData+ImageContentType.h>
#import <SDWebImage_Yumai/SDWebImageDefine.h>
#import <SDWebImage_Yumai/SDWebImageError.h>
#import <SDWebImage_Yumai/SDWebImageOptionsProcessor.h>
#import <SDWebImage_Yumai/SDImageIOAnimatedCoder.h>
#import <SDWebImage_Yumai/SDImageHEICCoder.h>
#import <SDWebImage_Yumai/SDImageAWebPCoder.h>

// Mac
#if __has_include(<SDWebImage_Yumai/NSImage+Compatibility.h>)
#import <SDWebImage_Yumai/NSImage+Compatibility.h>
#endif
#if __has_include(<SDWebImage_Yumai/NSButton+WebCache.h>)
#import <SDWebImage_Yumai/NSButton+WebCache.h>
#endif
#if __has_include(<SDWebImage_Yumai/SDAnimatedImageRep.h>)
#import <SDWebImage_Yumai/SDAnimatedImageRep.h>
#endif

// MapKit
#if __has_include(<SDWebImage_Yumai/MKAnnotationView+WebCache.h>)
#import <SDWebImage_Yumai/MKAnnotationView+WebCache.h>
#endif
