//
//  APPServiceMacro.h
//  XibaibaiAdministrator
//
//  Created by xbb01 on 16/1/5.
//  Copyright © 2016年 xbb01. All rights reserved.
//

#ifndef APPServiceMacro_h
#define APPServiceMacro_h

#define adminAPI @"http://xbbwx.marnow.com/Api/Backend"


#define Login [NSString stringWithFormat:@"%@/login",adminAPI] /** login */
#define orders_list [NSString stringWithFormat:@"%@/orderList",adminAPI] /** orderList */





#define BaiPushApiKey @"xseEbHb7loGQHUBduMk6oOqL" /** 百度推送key */

#endif /* APPServiceMacro_h */
