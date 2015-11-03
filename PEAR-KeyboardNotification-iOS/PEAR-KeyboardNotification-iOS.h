//
//  PEAR-KeyboardNotification-iOS.h
//  KeyboardNotification
//
//  Created by hirokiumatani on 2015/11/03.
//  Copyright © 2015年 hirokiumatani. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface PEAR_KeyboardNotification_iOS : NSObject
@property (nonatomic,strong) NSLayoutConstraint *bottomConstraint;
@property (nonatomic,strong) UIView *updateView;
@property (nonatomic,assign) CGFloat offset;
+ (PEAR_KeyboardNotification_iOS *)sharedInstance;
- (void)setKeyBoardReciveNotification;
- (void)removeKeyBoardNotification;

@end
