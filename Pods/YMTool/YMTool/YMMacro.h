
//
//  YMMacro.h
//  YMTool
//
//  Created by aio on 2020/8/21.
//  Copyright © 2020 aio. All rights reserved.
//

#ifndef YMMacro_h
#define YMMacro_h


/// 调试模式
//#define YM_ENV_VAR_DEBUG 1

#define SCREEN_WIDTH (UIScreen.mainScreen.bounds.size.width)
#define SCREEN_HEIGHT (UIScreen.mainScreen.bounds.size.height)

#define gRGBA(__r,__g,__b,__a) [UIColor colorWithRed:(__r)/255.0f green:(__g)/255.0f blue:(__b)/255.0f alpha:__a]
#define gRGB(__r,__g,__b) gRGBA(__r, __g, __b, 1.0)
// Hex string that looks like @"#FF0000" or @"FF0000"
#define gHexA(__hex, __a) ({unsigned rgbValue = 0; \
NSString *hexString = [__hex stringByReplacingOccurrencesOfString:@"#" withString:@""]; \
[[NSScanner scannerWithString:hexString] scanHexInt:&rgbValue]; \
[UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:__a];})
#define gHex(__hex) gHexA(__hex, 1.0)



#endif /* YMMacro_h */
