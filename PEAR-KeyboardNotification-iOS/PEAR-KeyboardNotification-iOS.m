//
//  PEAR-KeyboardNotification-iOS.m
//  KeyboardNotification
//
//  Created by hirokiumatani on 2015/11/03.
//  Copyright © 2015年 hirokiumatani. All rights reserved.
//

#import "PEAR-KeyboardNotification-iOS.h"
@interface PEAR_KeyboardNotification_iOS()

@end

@implementation PEAR_KeyboardNotification_iOS
static PEAR_KeyboardNotification_iOS * _sharedInstance = nil;
#pragma mark - KeyboardNotification
+ (PEAR_KeyboardNotification_iOS *)sharedInstance
{
    if(_sharedInstance)
        return _sharedInstance;
    
    _sharedInstance = [self new];
    return _sharedInstance;
}

- (void)setKeyBoardReciveNotification
{
    NSNotificationCenter *notificationCenter = NSNotificationCenter.defaultCenter;
    
    [notificationCenter addObserver:self
                           selector:@selector(keyboardWillShow:)
                               name:UIKeyboardWillShowNotification
                             object:nil];
    [notificationCenter addObserver:self
                           selector:@selector(keyboardWillHide:)
                               name:UIKeyboardWillHideNotification
                             object:nil];
}

- (void)removeKeyBoardNotification
{
    NSNotificationCenter *notificationCenter = NSNotificationCenter.defaultCenter;
    [notificationCenter removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [notificationCenter removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    
    _bottomConstraint = nil;
    _updateView = nil;
    _offset = 0.0f;
}

- (void)keyboardWillShow:(NSNotification *)notification
{
    CGRect keyboardRect = [[[notification userInfo]
                            objectForKey:UIKeyboardFrameEndUserInfoKey]
                           CGRectValue];
    CGFloat keyboardHeight = keyboardRect.size.height;
    
    _bottomConstraint.constant = keyboardHeight+_offset;
    [UIView animateKeyframesWithDuration:0.6
                                   delay:0.0
                                 options:UIViewKeyframeAnimationOptionLayoutSubviews
                              animations:^
     {
         [_updateView layoutIfNeeded];
     }
                              completion:^(BOOL finished)
     {
         
     }];
}

- (void)keyboardWillHide:(NSNotification *)notification
{
    _bottomConstraint.constant = 0;
    [UIView animateKeyframesWithDuration:0.6
                                   delay:0.0
                                 options:UIViewKeyframeAnimationOptionLayoutSubviews
                              animations:^
     {
         [_updateView layoutIfNeeded];
     }
                              completion:^(BOOL finished)
     {
         
     }];
}
@end
