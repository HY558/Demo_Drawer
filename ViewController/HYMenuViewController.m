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
    _menusContainerView = [[UIView alloc] init];
    [self.view addSubview:_menusContainerView];
    NSDictionary *views = @{@"menusContainerView":_menusContainerView};
    [self.menusContainerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[menusContainerView(100)]" options:kNilOptions metrics:0 views:views]];
    [self.menusContainerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[menusContainerView]|" options:kNilOptions metrics:0 views:views]];
    
    if (_menuList) {
        _menuButtonList = [[NSMutableArray alloc] initWithCapacity:1];
        for (NSString *title in _menuList) {
            UIButton *menu = [UIButton buttonWithType:UIButtonTypeCustom];
            [menu setTitle:title forState:UIControlStateNormal];
            [menu setBackgroundColor:[UIColor blueColor]];
            [_menuButtonList addObject:menu];
        }
    }
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
