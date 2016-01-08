//
//  ViewController.h
//  XibaibaiAdministrator
//
//  Created by xbb01 on 16/1/4.
//  Copyright © 2016年 xbb01. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

typedef NS_ENUM(NSUInteger,NetState) {
    NetStateConnect,
    NetStateDisConnect,
};

@interface XBBBaseViewController : UIViewController
- (void)netHasChageState:(NetState)netState;
@end

