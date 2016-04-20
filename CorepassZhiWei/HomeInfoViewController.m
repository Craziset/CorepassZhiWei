//
//  HomeInfoViewController.m
//  CorepassZhiWei
//
//  Created by 杨松辉 on 16/4/19.
//  Copyright © 2016年 YANG. All rights reserved.
//

#import "HomeInfoViewController.h"
#import "XLSphereView.h"
@interface HomeInfoViewController ()

@property (nonatomic,strong) XLSphereView *sphereView;

@end

@implementation HomeInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title=@"智维资讯";
    self.view.backgroundColor = [UIColor whiteColor];
    CGFloat sphereViewW = self.view.frame.size.width - 30 * 2;
    CGFloat sphereViewH = sphereViewW;
    _sphereView = [[XLSphereView alloc] initWithFrame:CGRectMake(30, 100, sphereViewW, sphereViewH)];
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:0];
    for (NSInteger i = 0; i < 40; i ++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        [btn setTitle:[NSString stringWithFormat:@"智维资讯%ld", i] forState:UIControlStateNormal];
        btn.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255. green:arc4random_uniform(255)/255. blue:arc4random_uniform(255)/255. alpha:1.];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:13.];
        btn.frame = CGRectMake(0, 0, 80, 30);
        btn.layer.cornerRadius = 3;
        btn.clipsToBounds = YES;
        [btn addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [array addObject:btn];
        [_sphereView addSubview:btn];
    }
    [_sphereView setItems:array];
    [self.view addSubview:_sphereView];

}
- (void)buttonPressed:(UIButton *)btn
{
    [_sphereView timerStop];
    
    [UIView animateWithDuration:0.3 animations:^{
        btn.transform = CGAffineTransformMakeScale(2., 2.);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3 animations:^{
            btn.transform = CGAffineTransformMakeScale(1., 1.);
        } completion:^(BOOL finished) {
            if (finished) {
                [_sphereView timerStart];
            }
            
        }];
    }];
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
