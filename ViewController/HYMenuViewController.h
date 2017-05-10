//
//  HYMenuViewController.h
//  Demo_Drawer
//
//  Created by HanYang on 2017/5/10.
//  Copyright © 2017年 Han Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HYMenuViewController;
@protocol HYMenuViewControllerDelegate <NSObject>

@optional
- (void)menuViewController:(HYMenuViewController *)viewController didSelectedMenuAtIndex:(NSInteger)index;

@end

@interface HYMenuViewController : UIViewController

@property (nonatomic, strong, readonly) NSArray<NSString *> *menuList;

@property (nonatomic, weak) id<HYMenuViewControllerDelegate> delegate;

- (instancetype)initWithMenuList:(NSArray<NSString *> *)menuList;

@end
