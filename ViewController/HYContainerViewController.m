//
//  HYContainerViewController.m
//  Demo_Drawer
//
//  Created by HanYang on 2017/5/10.
//  Copyright © 2017年 Han Yang. All rights reserved.
//

#import "HYContainerViewController.h"
#import "HYMenuViewController.h"
#import "HYContentViewController.h"
#import "HYDestinationViewController.h"

@interface HYContainerViewController () <HYMenuViewControllerDelegate, HYContentViewControllerDelegate>

@property (nonatomic, strong) HYMenuViewController *menuVC;
@property (nonatomic, strong) NSArray<NSString *> *menuList;

@property (nonatomic, strong) HYContentViewController *contentVC;

@property (nonatomic) BOOL menuListOpened;

@end

@implementation HYContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationBar];
    
    _menuList = @[@"菜单一", @"菜单二", @"菜单三", @"菜单四", @"菜单5⃣️"];
    
    [self setMenuViewController];
    [self setContentViewController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self clickedLeftButtonItem];
}

- (void)setNavigationBar
{
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.frame = CGRectMake(0, 0, 40, 40);
    [leftButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [leftButton setTitle:@"X" forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(clickedLeftButtonItem) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = leftButtonItem;
    
    self.navigationItem.title = @"Drawer";
}

- (void)setMenuViewController
{
    _menuVC = [[HYMenuViewController alloc] initWithMenuList:_menuList];
    _menuVC.delegate = self;
    [self addChildViewController:_menuVC];
    [self.view addSubview:_menuVC.view];
}

- (void)setContentViewController
{
    _contentVC = [[HYContentViewController alloc] init];
    _contentVC.delegate = self;
    [self addChildViewController:_contentVC];
    [self.view addSubview:_contentVC.view];
}

- (void)clickedLeftButtonItem
{
    if (!_menuListOpened) {
        [UIView animateWithDuration:0.3 animations:^{
            self.contentVC.view.transform = CGAffineTransformMakeTranslation(105, 0);
            self.navigationController.navigationBar.transform = CGAffineTransformMakeTranslation(105, 0);
            _menuListOpened = YES;
        }];
    } else {
        [UIView animateWithDuration:0.3 animations:^{
            self.contentVC.view.transform = CGAffineTransformMakeTranslation(0, 0);
            self.navigationController.navigationBar.transform = CGAffineTransformMakeTranslation(0, 0);
            _menuListOpened = NO;
        }];
    }
}

#pragma mark - HYMenuViewControllerDelegate
- (void)menuViewController:(HYMenuViewController *)viewController didSelectedMenuAtIndex:(NSInteger)index
{
    HYDestinationViewController *destinationVC = [[HYDestinationViewController alloc] initWithDetail:self.menuList[index]];
    [self.navigationController pushViewController:destinationVC animated:YES];
}

#pragma mark - HYContentViewControllerDelegate
- (void)tappedBackgroundViewHandler:(HYContentViewController *)viewController
{
    if (_menuListOpened) {
        [self clickedLeftButtonItem];
    }
}

@end
