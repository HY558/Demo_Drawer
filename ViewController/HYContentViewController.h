//
//  HYContentViewController.h
//  Demo_Drawer
//
//  Created by HanYang on 2017/5/10.
//  Copyright © 2017年 Han Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HYContentViewController;
@protocol HYContentViewControllerDelegate <NSObject>

@optional
- (void)contentViewController:(HYContentViewController *)viewController receiveGestureRecognizer:(UIGestureRecognizer *)recognizer;

@end

@interface HYContentViewController : UIViewController

@property (nonatomic, weak) id<HYContentViewControllerDelegate> delegate;

@end
