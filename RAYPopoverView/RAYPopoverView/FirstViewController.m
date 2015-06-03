//
//  FirstViewController.m
//  RAYPopoverView
//
//  Created by richerpay on 15/6/2.
//  Copyright (c) 2015年 richerpay. All rights reserved.
//

#import "FirstViewController.h"
#import "RAYPopoverView.h"

@interface FirstViewController ()

@property (nonatomic ,strong) UIButton *button;
@property (nonatomic ,strong) RAYPopoverView *popoverView;


@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.button];

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.button.bounds = CGRectMake(0, 0, 100, 40);
    self.button.center = CGPointMake(self.view.center.x, self.view.center.y-50);
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)clickButton {

    [self.popoverView presentFromRect:self.button.frame
                     inView:self.view
                       tipOrientation:RAYPopoverOrientationTop tipStyle:RAYPopoverStyleCenter];
}

- (UIButton *)button {
    
    if (_button == nil) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        [_button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_button setTitle:@"Popover" forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
        
        _button.layer.borderWidth = 2;
        _button.layer.borderColor = [UIColor grayColor].CGColor;
        _button.layer.cornerRadius = 4;
    }
    return _button;
}

- (RAYPopoverView *)popoverView {
    if (_popoverView == nil) {
        _popoverView = [[RAYPopoverView alloc]initWithFrame:CGRectZero];
    }
    return _popoverView;
}

@end
