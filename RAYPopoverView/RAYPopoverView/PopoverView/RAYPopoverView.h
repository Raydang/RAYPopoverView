//
//  RAYPopoverView.h
//  RAYPopoverView
//
//  Created by richerpay on 15/6/2.
//  Copyright (c) 2015年 richerpay. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, RAYPopoverOrientations) {
    RAYPopoverOrientationTop = 0,
    RAYPopoverOrientationBottom,
    RAYPopoverOrientationLeft,
    RAYPopoverOrientationRight,
    RAYPopoverOrientationMax,
};

typedef NS_ENUM(NSInteger, RAYPopoverStyles) {
    RAYPopoverStyleLeft = 0,
    RAYPopoverStyleCenter,
    RAYPopoverStyleRight,
    RAYPopoverStyleMax,
};

@interface RAYPopoverView : UIView


- (void)presentFromRect:(CGRect)rect
                 inView:(UIView *)containerView
         tipOrientation:(RAYPopoverOrientations)orientation
               tipStyle:(RAYPopoverStyles)style;

- (void)presentFromBarButtonItem:(UIBarButtonItem *)item
                  tipOrientation:(RAYPopoverOrientations)orientation
                        tipStyle:(RAYPopoverStyles)style;
- (void)disappear;

@end
