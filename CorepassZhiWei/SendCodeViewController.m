//
//  SendCodeViewController.m
//  CorepassZhiWei
//
//  Created by 杨松辉 on 16/4/11.
//  Copyright © 2016年 YANG. All rights reserved.
//

#import "SendCodeViewController.h"
#import "RegistViewController.h"
#import "FindPwdViewController.h"
@interface SendCodeViewController ()

@end

@implementation SendCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)sendCode:(id)sender {
   
    
    RegistViewController *registVC=[[UIStoryboard storyboardWithName:@"Login" bundle:[NSBundle mainBundle]]instantiateViewControllerWithIdentifier:@"RegistViewController"];
    FindPwdViewController *finPwdVC=[[UIStoryboard storyboardWithName:@"Login" bundle:[NSBundle mainBundle]]instantiateViewControllerWithIdentifier:@"FindPwdViewController"];
    if (self.flag)
    {
        [self.navigationController pushViewController:registVC animated:YES];
    }else
    {
        [self.navigationController pushViewController:finPwdVC animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
   }


@end
