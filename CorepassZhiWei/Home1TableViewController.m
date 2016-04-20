//
//  Home1TableViewController.m
//  CorepassZhiWei
//
//  Created by 杨松辉 on 16/4/18.
//  Copyright © 2016年 YANG. All rights reserved.
//

#import "Home1TableViewController.h"

#import "ZXScroll.h"
#import "AnotherSearchViewController.h"

#define screenSize [UIScreen mainScreen].bounds.size
#define topImageViewH 350

@interface Home1TableViewController ()<ZXScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *ContView;
@property (weak,nonatomic) UIPageControl *pageControl;
@property (weak, nonatomic) IBOutlet UIButton *cityNameBtn;
@end

@implementation Home1TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    //    UIView
    
    //    self.tableView.contentInset = UIEdgeInsetsMake(10, 0, 0, 0);
    
    [self buildScrollView];
    
    
}

-(void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:YES];
//    if (self.cityName!=nil) {
//        [self.cityNameBtn setTitle:self.cityName forState:UIControlStateNormal];
//        
//    }
    
}
//-(void)
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark --ZXScrollViewDelegate
- (void)pageControlReset:(NSInteger)aCount {
    self.pageControl.currentPage = aCount;
}

#pragma mark - Table view data source
//- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//
//    topImgView = [[UIImageView alloc] init];
//    topImgView.backgroundColor=[UIColor greenColor];
//    topImgView.image = [UIImage imageNamed:@"1.png"];
//    topImgView.frame = CGRectMake(0, 0, screenSize.width, 40);
//    topImgView.contentMode = UIViewContentModeScaleAspectFill;
//    //return topImgView;
////    }
////    else
////    {
////        return nil;
////    }
//}

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
#pragma mark --scrollView delegate
//
//-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
//
//    CGFloat down = - scrollView.contentOffset.y -(topImageViewH * 0.5);
//    if (down < 0) {
//        down = 0;
//    }
//
////    NSLog(@"---%f",down);
//    CGRect frame = topImgView.frame;
//    frame.size.height = down + topImageViewH;
//    topImgView.frame = frame;
//}

#pragma mark --self method
-(void)buildScrollView
{
    ZXScrollView *showMsgScrol=[[ZXScrollView alloc]initWithFrame:self.ContView.frame];
    NSArray *imgAry=@[@"1.jpg",@"2.jpg",@"1.jpg",@"2.jpg"];
    showMsgScrol.imageArray=imgAry;
    showMsgScrol.pageDelegate=self;
    showMsgScrol.isAutomatic=YES;
    showMsgScrol.isCycle=YES;
    [self.ContView addSubview:showMsgScrol];
    
}
- (IBAction)selectCityClick:(id)sender {
    AnotherSearchViewController *another = [[AnotherSearchViewController alloc]init];
    another.homeTableVC=self;
    [self.navigationController pushViewController:another animated:YES];
    
}


@end
