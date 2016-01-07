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


#define orders_list [NSString stringWithFormat:@"%@/orderList",adminAPI]

#define orders_app [NSString stringWithFormat:@"%@/appOrder",adminAPI] /** featOrders */
#define orders_dp [NSString stringWithFormat:@"%@/dpOrder",adminAPI] /** featOrders */
#define orders_weChat [NSString stringWithFormat:@"%@/wxOrder",adminAPI] /** featOrders */



#endif /* APPServiceMacro_h */
