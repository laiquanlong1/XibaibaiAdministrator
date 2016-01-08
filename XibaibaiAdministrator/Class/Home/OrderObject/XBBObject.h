//
//  XBBObject.h
//  XibaibaiAdministrator
//
//  Created by xbb01 on 16/1/8.
//  Copyright © 2016年 xbb01. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface XBBObject : NSManagedObject


// Insert code here to declare functionality of your managed object subclass
-  (NSString *)getStateString;

@end

NS_ASSUME_NONNULL_END

#import "XBBObject+CoreDataProperties.h"
