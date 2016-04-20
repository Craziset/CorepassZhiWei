//
//  MineTableViewController.m
//  CorepassZhiWei
//
//  Created by 杨松辉 on 16/4/12.
//  Copyright © 2016年 YANG. All rights reserved.

#import "MineTableViewController.h"
#import "MineViewCollectionViewCell.h"
#define RGB(r,g,b,a)  [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:r]
@interface MineTableViewController ()<UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource>
{
    NSArray *collectionViewCellTipAry;
   
}
@property (weak, nonatomic) IBOutlet UICollectionView *mineCollectionView;

@end

@implementation MineTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
  
    
  UIView *stateView=[[UIView alloc]initWithFrame:CGRectMake(0, -20, self.view.frame.size.width, 20)];
    stateView.backgroundColor=RGB(245, 245, 255, 1);
    [self.view addSubview:stateView];

    
   
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.navigationController.navigationBar.backgroundColor=[UIColor greenColor];
        collectionViewCellTipAry =[[NSArray alloc]initWithObjects:@"我的任务",@"抵用券",@"积分",@"账号绑定",@"账号安全",@"身份认证",@"资质认证",@"信用管理",@"帮助", nil];
    _mineCollectionView.delegate=self;
    _mineCollectionView.dataSource=self;
}
//-(void)viewWillAppear:(BOOL)animated
//{
//    self.navigationController.navigationBarHidden=YES;
//    self.hidesBottomBarWhenPushed=YES;
//    
//}
//-(void)viewWillDisappear:(BOOL)animated
//{
//    self.hidesBottomBarWhenPushed=NO;
//    self.navigationController.navigationBarHidden=NO;
//}


#pragma mark - collectionView data source
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    
    return UIEdgeInsetsMake(5, 5, 5, 5);
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return 9;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    MineViewCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"minecollectionViewCellID" forIndexPath:indexPath];
    cell.mineTipLabel.text=collectionViewCellTipAry[indexPath.row];
    cell.mineImageBtn.tag=indexPath.row;
    cell.nav=self.navigationController;

    return cell;
    
}

#pragma mark --Method


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
