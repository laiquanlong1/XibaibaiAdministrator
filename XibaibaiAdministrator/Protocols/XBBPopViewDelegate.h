//
//  XBBPopViewDelegate.h
//  XibaibaiAdministrator
//
//  Created by xbb01 on 16/1/7.
//  Copyright © 2016年 xbb01. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol XBBPopViewDelegate <NSObject>
- (void)selectIndexState:(NSInteger)state andTitle:(NSString *)title;
@end
