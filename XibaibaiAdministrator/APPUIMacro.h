//
//  APPUIMacro.h
//  XibaibaiAdministrator
//
//  Created by xbb01 on 16/1/5.
//  Copyright © 2016年 xbb01. All rights reserved.
//

#ifndef APPUIMacro_h
#define APPUIMacro_h


/** rect */
#define ScreenBounds [[UIScreen mainScreen] bounds]
#define ScreenBounds_width  ScreenBounds.size.width
#define ScreenBounds_height ScreenBounds.size.height

#define statusRect [[UIApplication sharedApplication] statusBarFrame]
#define statusHeight statusRect.size.height

#define naviRect self.navigationController.navigationBar.frame
#define naviHeight naviRect.size.height

#define TopBarHeight (statusHeight+naviHeight)

/** color */
#define BG_COLOR [UIColor whiteColor]


#endif /* APPUIMacro_h */
