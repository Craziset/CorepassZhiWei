//
//  CustomTabBarViewController.m
//  CorepassZhiWei
//
//  Created by 杨松辉 on 16/4/15.
//  Copyright © 2016年 YANG. All rights reserved.
//

#import "CustomTabBarViewController.h"

@interface CustomTabBarViewController ()

@end

@implementation CustomTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    NSLog(@"%@",self.viewControllers);
//        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(hidBar) name:@"hidnavigationBar" object:nil];
}
//-(void)hidBar
//{
//    for (UIViewController *vc in self.viewControllers)
//    {
//        if ([vc performSelector:@selector(viewWillAppear:)]) {
//            vc.navigationController.navigationBarHidden=NO;
//        }else if ([vc performSelector:@selector(viewWillDisappear:)]) {
//            vc.navigationController.navigationBarHidden=YES;
//        }
//    }
// 
//}
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
