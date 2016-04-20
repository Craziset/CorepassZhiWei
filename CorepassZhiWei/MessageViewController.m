//
//  MessageViewController.m
//  CorepassZhiWei
//
//  Created by 杨松辉 on 16/4/11.
//  Copyright © 2016年 YANG. All rights reserved.
//

#import "MessageViewController.h"

@interface MessageViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *msgTableVC;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentControl;

@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _msgTableVC.delegate=self;
    
    _msgTableVC.dataSource=self;
}
//-(void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:YES];
//}
//-(void)viewWillDisappear:(BOOL)animated
//{
//    self.hidesBottomBarWhenPushed=NO;
//    self.navigationController.navigationBarHidden=NO;
//}
#pragma mark ---tableView data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellID=@"cellID";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell==nil)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
    }
    cell.textLabel.text=[NSString stringWithFormat:@"cell%ld",indexPath.row+21];
    cell.imageView.image=[UIImage imageNamed:@"head.jpg"];
    cell.detailTextLabel.text=[NSString stringWithFormat:@"2016-4-%ld",indexPath.row+1];
    return cell;
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
