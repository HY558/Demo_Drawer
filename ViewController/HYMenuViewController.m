//
//  HYMenuViewController.m
//  Demo_Drawer
//
//  Created by HanYang on 2017/5/10.
//  Copyright © 2017年 Han Yang. All rights reserved.
//

#import "HYMenuViewController.h"

@interface HYMenuViewController ()

@property (nonatomic ,strong) UIView *menusContainerView;
@property (nonatomic, strong) NSMutableArray<UIButton *> *menuButtonList;

@end

@implementation HYMenuViewController

- (instancetype)initWithMenuList:(NSArray<NSString *> *)menuList
{
    self = [super init];
    if (self) {
        _menuList = menuList;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setHYMenuViewController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setHYMenuViewController
{
    self.view.backgroundColor = [UIColor yellowColor];
    
    _menusContainerView = [[UIView alloc] init];
    _menusContainerView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:_menusContainerView];
    NSDictionary *views = @{@"menusContainerView":_menusContainerView};
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-2-[menusContainerView(==100)]" options:kNilOptions metrics:0 views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-40-[menusContainerView]|" options:kNilOptions metrics:0 views:views]];
    
    if (_menuList) {
        _menuButtonList = [[NSMutableArray alloc] initWithCapacity:1];
        NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:16.f],
                                     NSForegroundColorAttributeName:[UIColor whiteColor]};
        for (NSString *title in _menuList) {
            UIButton *lastMenu = self.menuButtonList.lastObject;

            UIButton *menu = [UIButton buttonWithType:UIButtonTypeCustom];
            NSAttributedString *attributedTitle = [[NSAttributedString alloc] initWithString:title attributes:attributes];
            [menu setAttributedTitle:attributedTitle forState:UIControlStateNormal];
            [menu setBackgroundColor:[UIColor blueColor]];
            menu.layer.cornerRadius = 3.f;
            menu.layer.shadowOffset = CGSizeMake(1, 1);
            menu.layer.shadowColor = [UIColor blackColor].CGColor;
            menu.layer.shadowOpacity = 0.5;
            menu.translatesAutoresizingMaskIntoConstraints = NO;
            [menu addTarget:self action:@selector(clickedMenuButton:) forControlEvents:UIControlEventTouchUpInside];
            [self.menusContainerView addSubview:menu];
            
            [_menuButtonList addObject:menu];
            if (lastMenu) {
                [self.menusContainerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[lastMenu]-2-[menuButton(==40)]" options:kNilOptions metrics:0 views:@{@"lastMenu":lastMenu, @"menuButton":menu}]];
            } else {
                [self.menusContainerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-2-[menuButton(==40)]" options:kNilOptions metrics:0 views:@{@"menuButton":menu}]];
            }
            [self.menusContainerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[menu]|" options:kNilOptions metrics:0 views:@{@"menu":menu}]];
        }
    }
}

#pragma mark - Action handler
- (void)clickedMenuButton:(id)sender
{
    if (self.delegate && [self.delegate conformsToProtocol:@protocol(HYMenuViewControllerDelegate)]) {
        if ([self.delegate respondsToSelector:@selector(menuViewController:didSelectedMenuAtIndex:)]) {
            if (_menuButtonList) {
                NSInteger index = [_menuButtonList indexOfObject:sender];
                [self.delegate menuViewController:self didSelectedMenuAtIndex:index];
            }
        }
    }
}

@end
