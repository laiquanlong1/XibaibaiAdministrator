//
//  XBBOrderTableViewCell.h
//  XibaibaiAdministrator
//
//  Created by xbb01 on 16/1/6.
//  Copyright © 2016年 xbb01. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XBBOrderTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *orderTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *orderStateLabel;
@property (weak, nonatomic) IBOutlet UILabel *orderlocationLabel;
@property (weak, nonatomic) IBOutlet UILabel *orderNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *orderTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *orderIdLabel;
@property (weak, nonatomic) IBOutlet UILabel *orderPayWayLabel;
@property (weak, nonatomic) IBOutlet UILabel *orderNumLabel;
@property (weak, nonatomic) IBOutlet UILabel *orderPayPriceLabel;
@property (weak, nonatomic) IBOutlet UIButton *orderButton;

@end
