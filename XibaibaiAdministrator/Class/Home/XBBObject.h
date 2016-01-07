//
//  XBBObject.h
//  XibaibaiAdministrator
//
//  Created by xbb01 on 16/1/7.
//  Copyright © 2016年 xbb01. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XBBObject : NSObject

@property (nullable, nonatomic, retain) NSString *iphone;
@property (nullable, nonatomic, retain) NSString *location;
@property (nullable, nonatomic, retain) NSString *order_name;
@property (nullable, nonatomic, retain) NSString *order_state;
@property (nullable, nonatomic, retain) NSString *order_time;
@property (nullable, nonatomic, retain) NSString *order_type;
@property (nullable, nonatomic, retain) NSString *order_way;
@property (nullable, nonatomic, retain) NSString *orderid;
@property (nullable, nonatomic, retain) NSString *ordernum;
@property (nullable, nonatomic, retain) NSString *pay_num;

- (nullable NSString *)getStateString;
@end
