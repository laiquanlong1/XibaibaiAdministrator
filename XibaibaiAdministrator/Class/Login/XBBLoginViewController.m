//
//  XBBLoginViewController.m
//  XibaibaiAdministrator
//
//  Created by xbb01 on 16/1/5.
//  Copyright © 2016年 xbb01. All rights reserved.
//

#import "XBBLoginViewController.h"
#import "XBBHomeViewConctroller.h"
@interface XBBLoginViewController () <UITextFieldDelegate>
{
    UIScrollView *_controlScrollView;
    UIView *_controlView;
    UITextField *phoneField;
    UITextField *pwdField;
}
@end

@implementation XBBLoginViewController

#pragma mark loadDisposed
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loginViewSetupUI];


}

#pragma mark view
- (void)loginViewSetupUI
{
//    UIImage *image = [UIImage imageNamed:@"loginBg"];
//    UIImageView *bgImageView = [[UIImageView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    bgImageView.image = image;
//    [self.view addSubview:bgImageView];
    _controlScrollView = [[UIScrollView alloc] initWithFrame:ScreenBounds];
    self.view.backgroundColor = [UIColor blackColor];
 
    [self.view addSubview:_controlScrollView];
    [self setUpTextFieldUI];
}

- (void)setUpTextFieldUI
{
    
    _controlView = [[UIView alloc] initWithFrame:ScreenBounds];
    [_controlScrollView addSubview:_controlView];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hiddenKey:)];
    [_controlView addGestureRecognizer:tap];
    
    phoneField = [[UITextField alloc] initWithFrame:CGRectMake(ScreenBounds_width/10, 150,ScreenBounds_width - ScreenBounds_width/10*2, 44)];
    phoneField.backgroundColor = [UIColor whiteColor];
    phoneField.alpha = 0.7;
    phoneField.placeholder = NSLocalizedString(@"loginPhone", nil);
    phoneField.keyboardType = UIKeyboardTypeNumberPad;
    [_controlView addSubview:phoneField];
    
    
    pwdField = [[UITextField alloc] initWithFrame:CGRectMake(ScreenBounds_width/10, phoneField.frame.origin.y+phoneField.frame.size.height + 10,ScreenBounds_width - ScreenBounds_width/10*2, 44)];
    pwdField.alpha = 0.7;
    pwdField.placeholder = NSLocalizedString(@"loginPwd", nil);
    pwdField.backgroundColor = [UIColor whiteColor];
    [_controlView addSubview:pwdField];
    
    UIButton *sureButton = [[UIButton alloc] initWithFrame:CGRectMake(ScreenBounds_width/10, pwdField.frame.origin.y+pwdField.frame.size.height + 30,ScreenBounds_width - ScreenBounds_width/10*2, 44)];
    [_controlView addSubview:sureButton];
    
    [sureButton setTitle:NSLocalizedString(@"loginSureButton", nil) forState:UIControlStateNormal];
    [sureButton setBackgroundColor:[UIColor orangeColor]];
    [sureButton addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
    
    pwdField.delegate = self;
    phoneField.delegate = self;
}

#pragma mark action
- (IBAction)hiddenKey:(id)sender
{
    [phoneField resignFirstResponder];
    [pwdField resignFirstResponder];
}

- (IBAction)login:(id)sender
{
    [phoneField resignFirstResponder];
    [pwdField resignFirstResponder];
    
    if ([phoneField.text length] != 11) {
        [SVProgressHUD showErrorWithStatus:NSLocalizedString(@"loginSurePhone", nil)];
        return;
    }
    if ([pwdField.text length] < 6.) {
        [SVProgressHUD showErrorWithStatus:NSLocalizedString(@"loginSurePwd", nil)];
        return;
    }
    [SVProgressHUD show];
    [NetworkHelper postWithAPI:Login parameter:@{@"account":phoneField.text,@"pwd":pwdField} successBlock:^(id response) {
        [SVProgressHUD showSuccessWithStatus:NSLocalizedString(@"loginSuccess", nil)];
        DLog(@"%@",response)
        if ([response[@"code"] integerValue] == 1) {
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:ISLOGIN];
            [[NSUserDefaults standardUserDefaults] synchronize];
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                XBBBaseNavigationViewController *nav = [[XBBBaseNavigationViewController alloc] initWithRootViewController:[[XBBHomeViewConctroller alloc] init]];
                self.view.window.rootViewController = nav;
            });
        }
    } failBlock:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:[error description]];
    }];
    
}

#pragma mark textfiledDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    
    NSString *subString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    if ([textField isEqual:phoneField]) {
        if ([subString length]>11) {
            [SVProgressHUD showInfoWithStatus:NSLocalizedString(@"loginPhoneLengthMax", nil)];
            return NO;
        }
    }
    
    if ([textField isEqual:pwdField]) {
        if ([subString length] > 16) {
            [SVProgressHUD showInfoWithStatus:NSLocalizedString(@"loginPwdLengthMax", nil)];
            return NO;
        }
    }
    
    DLog(@"%@",subString)
    
    
    
    return YES;
}


@end
