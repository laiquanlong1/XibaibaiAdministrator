//
//  APPSystemMacro.h
//  XibaibaiAdministrator
//
//  Created by xbb01 on 16/1/5.
//  Copyright © 2016年 xbb01. All rights reserved.
//

#ifndef APPSystemMacro_h
#define APPSystemMacro_h

/** 输出语句 */
#ifdef DEBUG
#define DLog(fmt, ...) NSLog((@"%s [Line %d]" fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define DLog(...)
#endif

/** appdelegate */

#define AppDelegat ((AppDelegate *) [[UIApplication sharedApplication] delegate])



#endif /* APPSystemMacro_h */
