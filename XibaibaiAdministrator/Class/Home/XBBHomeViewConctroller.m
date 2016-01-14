//
//  XBBHomeViewConctroller.m
//  XibaibaiAdministrator
//
//  Created by xbb01 on 16/1/5.
//  Copyright © 2016年 xbb01. All rights reserved.
//

#import "XBBHomeViewConctroller.h"
#import "XBBLoginViewController.h"
#import "XBBOrderTableViewCell.h"
#import "XBBObject.h"
#import "XbbPopView.h"
#import "XBBPopViewDelegate.h"
#import "XBBNotDataView.h"


@interface XBBHomeViewConctroller () <UITableViewDataSource,UITableViewDelegate,XBBPopViewDelegate>
{
    UIButton *rightBarButton;
    UISegmentedControl *segment; /** 选择下单方式*/
    NSInteger selectIndex; /** 选择的下单方式 */
    
    UISegmentedControl *selectTimeSegment; /** 下单时间 */
    NSInteger page; /** 选择的下单页数 */
    NSInteger selectState; /** 选择的单子状态 */

    XbbPopView *popView;
    XBBNotDataView *nodataView;
    BOOL isFooterRefreach;
    
    
}
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *presentDatas;
@property (nonatomic, strong) NSMutableArray *dataSource;

@end

static NSString *identifier = @"cell_1";

@implementation XBBHomeViewConctroller


#pragma mark dataFeach

- (void)sortCellDatas:(NSInteger)state
{
    if (self.presentDatas == nil) {
        self.presentDatas = [NSMutableArray array];
    }
    if (isFooterRefreach) {
        isFooterRefreach = NO;
        
        /** 添加数据 */
        for (XBBObject *dataSourceOc in self.dataSource) {
            if (self.presentDatas.count > 0) {
                BOOL isEq = YES;
                for (XBBObject *presentDataOc in self.presentDatas) {
                    if ([dataSourceOc.orderid isEqualToString:presentDataOc.orderid]) {
                        isEq = NO;
                    }
                }
                if (isEq) {
                    if ([dataSourceOc.order_state integerValue] == state) {
                        if (selectTimeSegment.selectedSegmentIndex == 0) {
                            if ([dataSourceOc.order_type isEqualToString:@"即刻"]) {
                                [self.presentDatas addObject:dataSourceOc];
                                NSIndexPath *ind = [NSIndexPath indexPathForRow:self.presentDatas.count-1 inSection:0];
                                [self.tableView insertRowsAtIndexPaths:@[ind] withRowAnimation:UITableViewRowAnimationMiddle];
                            }
                        }else
                        {
                            if (![dataSourceOc.order_type isEqualToString:@"即刻"]) {
                                [self.presentDatas addObject:dataSourceOc];
                                NSIndexPath *ind = [NSIndexPath indexPathForRow:self.presentDatas.count-1 inSection:0];
                                [self.tableView insertRowsAtIndexPaths:@[ind] withRowAnimation:UITableViewRowAnimationMiddle];
                            }
                        }
                    }
                }
            }else
            {
                if ([dataSourceOc.order_state integerValue] == state) {
                    if (selectTimeSegment.selectedSegmentIndex == 0) {
                        if ([dataSourceOc.order_type isEqualToString:@"即刻"]) {
                            [self.presentDatas addObject:dataSourceOc];
                            NSIndexPath *ind = [NSIndexPath indexPathForRow:self.presentDatas.count-1 inSection:0];
                            [self.tableView insertRowsAtIndexPaths:@[ind] withRowAnimation:UITableViewRowAnimationMiddle];
                        }
                    }else
                    {
                        if (![dataSourceOc.order_type isEqualToString:@"即刻"]) {
                            [self.presentDatas addObject:dataSourceOc];
                            NSIndexPath *ind = [NSIndexPath indexPathForRow:self.presentDatas.count-1 inSection:0];
                            [self.tableView insertRowsAtIndexPaths:@[ind] withRowAnimation:UITableViewRowAnimationMiddle];
                        }
                    }
                }
                
            }
        }
        
        if (self.presentDatas.count >0) {
            nodataView.alpha = 0;
        }else
        {
            nodataView.alpha = 1;
        }
        if (self.presentDatas.count == 0) {
            [self.tableView.footer setHidden:YES];
        }else
        {
            [self.tableView.footer setHidden:NO];
        }
        
        return;
    }
    
    
    
    /** 刷新数据 */
    if (self.presentDatas.count > 0) {
        NSMutableArray *deleteCell = [NSMutableArray array];
        for (int i = 0; i < self.presentDatas.count; i ++) {
            NSIndexPath *index = [NSIndexPath indexPathForRow:i inSection:0];
            [deleteCell addObject:index];
        }
        [self.presentDatas removeAllObjects];
        [self.tableView deleteRowsAtIndexPaths:deleteCell withRowAnimation:UITableViewRowAnimationMiddle];
    }
    
    /** 添加数据 */
    if (state == 111) {
        for (XBBObject *ob in self.dataSource) {
            if (selectTimeSegment.selectedSegmentIndex == 0) {
                if ([ob.order_type isEqualToString:@"即刻"]) {
                    [self.presentDatas addObject:ob];
                    NSIndexPath *ind = [NSIndexPath indexPathForRow:self.presentDatas.count-1 inSection:0];
                    [self.tableView insertRowsAtIndexPaths:@[ind] withRowAnimation:UITableViewRowAnimationMiddle];
                }
            }else
            {
                if (![ob.order_type isEqualToString:@"即刻"]) {
                    [self.presentDatas addObject:ob];
                    NSIndexPath *ind = [NSIndexPath indexPathForRow:self.presentDatas.count-1 inSection:0];
                    [self.tableView insertRowsAtIndexPaths:@[ind] withRowAnimation:UITableViewRowAnimationMiddle];
                }
            }
        }
    }else
    {
        NSMutableArray *arr_in = [NSMutableArray array];
        for (XBBObject *ob in self.dataSource) {
            if ([ob.order_state integerValue] == state) {
                if (selectTimeSegment.selectedSegmentIndex == 0) {
                    if ([ob.order_type isEqualToString:@"即刻"]) {
                        [self.presentDatas addObject:ob];
                    }
                }else
                {
                    if (![ob.order_type isEqualToString:@"即刻"]) {
                        [self.presentDatas addObject:ob];
                    }
                }
            }
        }
        
        for (int i = 0; i < self.presentDatas.count; i ++) {
            NSIndexPath *ind = [NSIndexPath indexPathForRow:i inSection:0];
            [arr_in addObject:ind];
        }
        [self.tableView insertRowsAtIndexPaths:arr_in withRowAnimation:UITableViewRowAnimationMiddle];
    }
    
    if (self.presentDatas.count >0) {
        nodataView.alpha = 0;
    }else
    {
        nodataView.alpha = 1;
    }
    if (self.presentDatas.count == 0) {
        [self.tableView.footer setHidden:YES];
    }else
    {
        [self.tableView.footer setHidden:NO];
    }
}


- (void)feachaDataWithType:(NSInteger)type page:(NSInteger)pageIndex com:(void(^)(void))isok
{
    [SVProgressHUD show];
    nodataView.alpha = 0;
    [NetworkHelper postWithAPI:orders_list parameter:@{@"p":@(pageIndex),@"type":@(type)} successBlock:^(id response) {
        if ([response[@"code"] integerValue] == 0) {
            NSArray *arr = response[@"result"];
            if (self.dataSource==nil) {
                self.dataSource = [NSMutableArray array];
            }
            for (NSDictionary *dic in arr) {
                NSFetchRequest *fetch = [[NSFetchRequest alloc] initWithEntityName:@"XBBObject"];
                NSArray *objects = [[AppDelegat managedObjectContext] executeFetchRequest:fetch error:nil];
                
                if (objects.count == 0) {
                    XBBObject *ob_1 = (XBBObject *)[NSEntityDescription insertNewObjectForEntityForName:@"XBBObject" inManagedObjectContext:[AppDelegat managedObjectContext]];
                    if ([dic[@"order_state"] integerValue] <= 1) {
                        ob_1.isNew = YES;
                    }else
                    {
                        ob_1.isNew = NO;
                    }
                    
                    [ob_1 setValuesForKeysWithDictionary:dic];
                    [AppDelegat saveContext];
                }else
                {
                    BOOL isOk = YES;
                    for (XBBObject *ob_2 in objects) {
                        if ([ob_2.orderid isEqualToString:dic[@"orderid"]]) {
                            isOk = NO;
                        }
                    }
                    if (isOk) {
                        /** 保存数据 */
                        XBBObject *ob = (XBBObject *)[NSEntityDescription insertNewObjectForEntityForName:@"XBBObject" inManagedObjectContext:[AppDelegat managedObjectContext]];
                        if ([dic[@"order_state"] integerValue] <= 1) {
                            ob.isNew = YES;
                        }else
                        {
                            ob.isNew = NO;
                        }
                        [ob setValuesForKeysWithDictionary:dic];
                        [AppDelegat saveContext];
                    }
                }
            }
            
        }
        
        if (self.dataSource.count > 0) {
            [self.dataSource removeAllObjects];
        }
        
        NSFetchRequest *fetch = [[NSFetchRequest alloc] initWithEntityName:@"XBBObject"];
        NSArray *objects = [[AppDelegat managedObjectContext] executeFetchRequest:fetch error:nil];
        for (XBBObject *oc  in objects) {
            switch (selectIndex) {
                case 0:
                {
                    if ([oc.order_way isEqualToString:@"APP订单"]) {
                         [self.dataSource addObject:oc];
                    }
                }
                    break;
                case 1:
                {
                    if ([oc.order_way isEqualToString:@"微信订单"]) {
                        [self.dataSource addObject:oc];
                    }
                }
                    break;
                case 2:
                {
                    if ([oc.order_way isEqualToString:@"大众点评订单"]) {
                        [self.dataSource addObject:oc];
                    }
                }
                    break;
                    
                default:
                    break;
            }
        }
        
        if (isok) {
            isok();
        }
    } failBlock:^(NSError *error) {
        if (isok) {
            isok();
        }
    }];
}

#pragma mark view
- (void)initUI
{
    [self segment];
    [self addTableViews];
}
- (void)segment
{
    
    NSString *one = NSLocalizedString(@"one", nil);
    NSString *two = NSLocalizedString(@"two", nil);
    NSString *tree = NSLocalizedString(@"tree", nil);
    segment = [[UISegmentedControl alloc] initWithItems:@[one,two,tree]];
    [segment setFrame:CGRectMake(10,TopBarHeight+5, ScreenBounds_width-20, 30.)];
    segment.selectedSegmentIndex = 0;
    [segment addObserver:self forKeyPath:@"selectedSegmentIndex" options:NSKeyValueObservingOptionNew context:@"way"];
    [self.view addSubview:segment];
    
    selectTimeSegment = [[UISegmentedControl alloc] initWithItems:@[NSLocalizedString(@"justOrder", nil),NSLocalizedString(@"planOrder", nil)]];
    [selectTimeSegment setFrame:CGRectMake(10,TopBarHeight+35, ScreenBounds_width-20, 30.)];
    selectTimeSegment.selectedSegmentIndex = 0;
    [selectTimeSegment addObserver:self forKeyPath:@"selectedSegmentIndex" options:NSKeyValueObservingOptionNew context:@"time"];
    [self.view addSubview:selectTimeSegment];
}


- (void)addTableViews
{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, TopBarHeight+10+30+10+20, ScreenBounds_width, ScreenBounds_height - (TopBarHeight+10+30+10+20)) style:UITableViewStyleGrouped];
    [self.tableView setContentInset:UIEdgeInsetsMake(-40, 0, -80, 0)];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    nodataView = [[XBBNotDataView alloc] initWithFrame:self.tableView.bounds withImage:[UIImage imageNamed:@"noorderImage"] withString:NSLocalizedString(@"nodataString", nil)];
    self.tableView.backgroundView = nodataView;
    [self.tableView registerNib:[UINib nibWithNibName:@"XBBOrderTableViewCell" bundle:nil] forCellReuseIdentifier:identifier];
    
    self.tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        page ++;
        [self feachaDataWithType:selectIndex page:page com:^{
            [self.tableView.footer endRefreshing];
            [SVProgressHUD dismiss];
            isFooterRefreach = YES;
            [self sortCellDatas:selectState];
        }];
    }];
}


#pragma mark loadDespose
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = NSLocalizedString(@"one", nil);
    UIBarButtonItem *bar = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(toExit:)];
    rightBarButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBarButton setFrame:CGRectMake(0, 0, 100, 30)];
    [rightBarButton.titleLabel setFont:[UIFont systemFontOfSize:15.]];
    [rightBarButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [rightBarButton setTitle:NSLocalizedString(@"orderStateAll", nil) forState:UIControlStateNormal];
    selectState = 111; /** 选择的状态 */
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:rightBarButton];
    [rightBarButton addTarget:self action:@selector(changeStateSelect:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = item;
    self.navigationItem.leftBarButtonItem = bar;
    [self initUI];
    page = 1;

    [self feachaDataWithType:1 page:page com:^{
        [SVProgressHUD dismiss];
        [self sortCellDatas:selectState];
    }];
    

    
  
}


#pragma mark nets
- (void)netHasChageState:(NetState)netState
{
    switch (netState) {
        case NetStateConnect:
        {
            DLog(@"链接")
            
        }
            break;
        case NetStateDisConnect:
        {
            DLog(@"未链接")
        }
            break;
        default:
            break;
    }
}

#pragma mark Action

- (void)hiddenAndPresentPopView
{
    [UIView animateWithDuration:0.25 animations:^{
        if (popView.hasPressent) {
            popView.hasPressent = NO;
            [popView setFrame:CGRectMake(ScreenBounds_width-20, TopBarHeight + 10, 0, 0)];
            self.tableView.userInteractionEnabled = YES;
            segment.userInteractionEnabled = YES;
        }else
        {
            popView.hasPressent = YES;
            self.tableView.userInteractionEnabled = NO;
            segment.userInteractionEnabled = NO;
            [popView setFrame:CGRectMake(ScreenBounds_width/2, TopBarHeight + 10,ScreenBounds_width/2-20,200.)];
        }
    }];
}

- (void)selectIndexState:(NSInteger)state
                andTitle:(NSString *)title
{
    selectState = state;
    [rightBarButton setTitle:title forState:UIControlStateNormal];
    [self hiddenAndPresentPopView];
    [self sortCellDatas:selectState];
}

- (IBAction)changeStateSelect:(id)sender
{
    /** 改变筛选状态 */
    if (popView == nil) {
        popView = [[XbbPopView alloc] init];
        popView.backgroundColor = [UIColor whiteColor];
        [popView setFrame:CGRectMake(ScreenBounds_width/2, TopBarHeight + 10,ScreenBounds_width/2-20,200.)];
        [popView initWithItems:@[NSLocalizedString(@"orderStateAll", nil),NSLocalizedString(@"orderStateZone", nil),NSLocalizedString(@"orderStateOne", nil),NSLocalizedString(@"orderStateTwo", nil),NSLocalizedString(@"orderStateThree", nil),NSLocalizedString(@"orderStateFour", nil),NSLocalizedString(@"orderStateFive", nil),NSLocalizedString(@"orderStateSix", nil),NSLocalizedString(@"orderStateSeven", nil)]];
        [popView setFrame:CGRectMake(ScreenBounds_width-20, TopBarHeight + 10,0,0)];
        popView.hasPressent = NO;
        popView.delegate = self;
        [self.view addSubview:popView];
    }
     [self hiddenAndPresentPopView];


}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object
                        change:(NSDictionary<NSString *,id> *)change
                       context:(void *)context
{
    if ([(__bridge NSString *)context isEqualToString:@"way"]) {
        NSDictionary *dic = change;
        NSInteger interger = [dic[@"new"] integerValue];
        if (selectIndex == interger)
            return;
        selectIndex = interger;
        
        
        if (self.dataSource.count > 0) {
            [self.dataSource removeAllObjects];
        }
        
        page = 1;
        [self feachaDataWithType:selectIndex+1 page:page com:^{
            [SVProgressHUD dismiss];
            [self sortCellDatas:selectState];
            
        }];
        switch (interger) {
            case 0:
            {
                self.title = NSLocalizedString(@"one", nil);
            }
                break;
            case 1:
            {
                self.title = NSLocalizedString(@"two", nil);
                
            }
                break;
            case 2:
            {
                self.title = NSLocalizedString(@"tree", nil);
            }
                break;
            default:
                break;
        }
    }else if ([(__bridge NSString *)context isEqualToString:@"time"])
    {
        [self sortCellDatas:selectState];

    }
    
}

- (IBAction)toExit:(id)sender
{
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:ISLOGIN];
    [[NSUserDefaults standardUserDefaults]synchronize];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.view.window.rootViewController = [[XBBLoginViewController alloc] init];
    });
}

#pragma mark tableViewDataSource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 300.;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.presentDatas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XBBOrderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[XBBOrderTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    XBBObject *o = self.presentDatas[indexPath.row];
    if (o.isNew) {
        [cell.orderButton setTitle:@"New Production" forState:UIControlStateNormal];
        cell.orderButton.alpha = 1;
    }else
    {
        [cell.orderButton setTitle:@"Old Production" forState:UIControlStateNormal];
        cell.orderButton.alpha = 0;
    }
    cell.orderTimeLabel.text  = o.order_time;
    cell.orderStateLabel.text = [o getStateString];
    cell.orderPayPriceLabel.text = o.pay_num;
    cell.orderNameLabel.text = o.order_name;
    cell.orderlocationLabel.text = o.location;
    cell.orderNumLabel.text = o.ordernum;
    cell.orderPayWayLabel.text = o.order_way;
    cell.orderIdLabel.text = o.orderid;
    cell.orderTypeLabel.text = o.order_type;
    
    return cell;
}

@end
