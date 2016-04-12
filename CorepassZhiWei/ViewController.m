//
//  ViewController.m
//  CorepassZhiWei
//
//  Created by 杨松辉 on 16/3/22.
//  Copyright © 2016年 YANG. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,assign)NSString *string1;
@property (nonatomic,assign)NSString *string2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //NSOperationQueue
    
    self.string1= @"string1";
    self.string2=self.string1;
    self.string1=nil;
    
    NSLog(@"string2 = %@",self.string2);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
