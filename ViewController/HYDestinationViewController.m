//
//  HYDestinationViewController.m
//  Demo_Drawer
//
//  Created by HanYang on 2017/5/10.
//  Copyright © 2017年 Han Yang. All rights reserved.
//

#import "HYDestinationViewController.h"

@interface HYDestinationViewController ()

@property (nonatomic, strong) UILabel *detailLabel;

@end

@implementation HYDestinationViewController

- (instancetype)initWithDetail:(NSString *)detail
{
    self = [super init];
    if (self) {
        _detail = detail;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    _detailLabel = [[UILabel alloc] initWithFrame:self.view.bounds];
    _detailLabel.textColor = [UIColor purpleColor];
    _detailLabel.font = [UIFont boldSystemFontOfSize:42.f];
    _detailLabel.textAlignment = NSTextAlignmentCenter;
    _detailLabel.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
    _detailLabel.text = _detail;
    [self.view addSubview:_detailLabel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
