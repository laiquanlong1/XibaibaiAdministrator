//
//  XBBObject.m
//  XibaibaiAdministrator
//
//  Created by xbb01 on 16/1/7.
//  Copyright © 2016年 xbb01. All rights reserved.
//

#import "XBBObject.h"

@implementation XBBObject

- (nullable NSString *)getStateString
{
    switch ([self.order_state integerValue]) {
        case 0:
        {
            return NSLocalizedString(@"orderStateZone", nil);
        }
            break;
        case 1:
        {
             return NSLocalizedString(@"orderStateOne", nil);
        }
            break;
        case 2:
        {
             return NSLocalizedString(@"orderStateTwo", nil);
        }
            break;
        case 3:
        {
             return NSLocalizedString(@"orderStateThree", nil);
        }
            break;
        case 4:
        {
             return NSLocalizedString(@"orderStateFour", nil);
        }
            break;
        case 5:
        {
             return NSLocalizedString(@"orderStateFive", nil);
        }
            break;
        case 6:
        {
             return NSLocalizedString(@"orderStateSix", nil);
        }
            break;
            
            case 7:
        {
            return NSLocalizedString(@"orderStateSeven", nil);
        }
        default:
            break;
    }
    return nil;
}
@end
