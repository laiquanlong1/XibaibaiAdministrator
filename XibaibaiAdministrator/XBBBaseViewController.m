//
//  ViewController.m
//  XibaibaiAdministrator
//
//  Created by xbb01 on 16/1/4.
//  Copyright © 2016年 xbb01. All rights reserved.
//

#import "XBBBaseViewController.h"
#import "Reachability.h"

@interface XBBBaseViewController ()
{
    Reachability *_reachability;
}
@end

@implementation XBBBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = BG_COLOR;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(haveChangeStateNet:) name:kReachabilityChangedNotification object:nil];
    _reachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus status = [_reachability currentReachabilityStatus];
    if (status == NotReachable) {
        [self netHasChageState:NetStateDisConnect];
    }else
    {
        [self netHasChageState:NetStateConnect];
    }
    
    
    
    [_reachability startNotifier];
}

- (IBAction)haveChangeStateNet:(id)sender
{
    NetworkStatus status = [_reachability currentReachabilityStatus];
    if (status == NotReachable) {
        [self netHasChageState:NetStateDisConnect];
    }else
    {
        [self netHasChageState:NetStateConnect];
    }
}

- (void)netHasChageState:(NetState)netState
{
    /** 子类重写 */
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
