//
//  XbbPopView.m
//  XibaibaiAdministrator
//
//  Created by xbb01 on 16/1/7.
//  Copyright © 2016年 xbb01. All rights reserved.
//

#import "XbbPopView.h"

@implementation XbbPopView

- (void)initWithItems:(NSArray *)items
{
    DLog(@"%@",items)
    
    self.layer.cornerRadius = 5;
    self.layer.borderWidth = 0.5;
    self.layer.borderColor = [UIColor blueColor].CGColor;
    self.layer.masksToBounds = YES;
    UIScrollView *backScrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    [self addSubview:backScrollView];
    for (int i = 0; i < items.count; i++) {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, i*44, self.bounds.size.width, 44)];
        if (i == 0) {
            button.tag = 111;
        }else
        {
            button.tag = i - 1;
        }
        [button setTitle:items[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [backScrollView addSubview:button];
        [backScrollView setContentSize:CGSizeMake(0, button.frame.origin.y + 44)];
        [button addTarget:self action:@selector(actions:) forControlEvents:UIControlEventTouchUpInside];
    }
}
- (IBAction)actions:(id)sender
{
    UIButton *button = sender;
    if ([self.delegate respondsToSelector:@selector(selectIndexState:andTitle:)]) {
        [self.delegate selectIndexState:button.tag andTitle:button.titleLabel.text];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
