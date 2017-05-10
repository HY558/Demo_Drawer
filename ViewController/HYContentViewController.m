//
//  HYContentViewController.m
//  Demo_Drawer
//
//  Created by HanYang on 2017/5/10.
//  Copyright © 2017年 Han Yang. All rights reserved.
//

#import "HYContentViewController.h"

@interface HYContentViewController ()

@property (nonatomic, strong) UILabel *label;

@end

@implementation HYContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.view.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gestureRecognizerHandler:)];
    [self.view addGestureRecognizer:tapRecognizer];
    
    UIScreenEdgePanGestureRecognizer *edgePanRecognizer = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(gestureRecognizerHandler:)];
    edgePanRecognizer.edges = UIRectEdgeLeft;
    [self.view addGestureRecognizer:edgePanRecognizer];
        
    _label = [[UILabel alloc] init];
    _label.font = [UIFont boldSystemFontOfSize:36.f];
    _label.textColor = [UIColor blackColor];
    _label.textAlignment = NSTextAlignmentCenter;
    _label.text = @"Hello World!";
    _label.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.label];

    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.label attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[label]|" options:kNilOptions metrics:0 views:@{@"label":self.label}]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.label attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:40]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)gestureRecognizerHandler:(UIGestureRecognizer *)recognizer
{
    if (self.delegate && [self.delegate conformsToProtocol:@protocol(HYContentViewControllerDelegate)]) {
        if ([self.delegate respondsToSelector:@selector(contentViewController:receiveGestureRecognizer:)]) {
            [self.delegate contentViewController:self receiveGestureRecognizer:recognizer];
        }
    }
}

@end
