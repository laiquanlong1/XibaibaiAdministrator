//
//  XbbPopView.h
//  XibaibaiAdministrator
//
//  Created by xbb01 on 16/1/7.
//  Copyright © 2016年 xbb01. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XBBPopViewDelegate.h"

@interface XbbPopView : UIView

@property (nonatomic, weak) id <XBBPopViewDelegate> delegate;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, assign) BOOL hasPressent;
- (void)initWithItems:(NSArray *)items; /** Nsstrings */
@end
