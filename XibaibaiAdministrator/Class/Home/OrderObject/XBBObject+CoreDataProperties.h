//
//  XBBObject+CoreDataProperties.h
//  XibaibaiAdministrator
//
//  Created by xbb01 on 16/1/8.
//  Copyright © 2016年 xbb01. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "XBBObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface XBBObject (CoreDataProperties)
@property (nonatomic, assign) BOOL isNew;
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

@end

NS_ASSUME_NONNULL_END
