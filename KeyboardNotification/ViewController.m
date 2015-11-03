//
//  ViewController.m
//  KeyboardNotification
//
//  Created by hirokiumatani on 2015/11/03.
//  Copyright © 2015年 hirokiumatani. All rights reserved.
//

#import "ViewController.h"
#import "PEAR-KeyboardNotification-iOS.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomConstraint;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic)PEAR_KeyboardNotification_iOS *keyboardNotification;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _keyboardNotification = [PEAR_KeyboardNotification_iOS sharedInstance];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    _keyboardNotification.updateView = self.view;
    _keyboardNotification.bottomConstraint = _bottomConstraint;
    [_keyboardNotification setKeyBoardReciveNotification];
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [_keyboardNotification removeKeyBoardNotification];
    [super viewWillDisappear:animated];
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
@end
