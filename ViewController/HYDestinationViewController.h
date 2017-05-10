//
//  HYDestinationViewController.h
//  Demo_Drawer
//
//  Created by HanYang on 2017/5/10.
//  Copyright © 2017年 Han Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HYDestinationViewController : UIViewController

@property (nonatomic, strong, readonly) NSString *detail;

- (instancetype)initWithDetail:(NSString *)detail;

@end
