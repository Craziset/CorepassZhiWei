//
//  SearchTableViewController.m
//  CorepassZhiWei
//
//  Created by 杨松辉 on 16/4/15.
//  Copyright © 2016年 YANG. All rights reserved.
//

#import "SearchTableViewController.h"

@interface SearchTableViewController ()<UISearchBarDelegate,UISearchResultsUpdating>
{
    
    
}
@property (weak, nonatomic) IBOutlet UISearchBar *mySearchBar;
@property (copy,nonatomic) NSDictionary * names;
@property (copy,nonatomic) NSArray * keys;

@property (nonatomic,strong) UISearchController * searchController;
@property (nonatomic,strong) NSMutableArray * dataList;
@property (nonatomic,strong) NSMutableArray * searchList;
@property (nonatomic,strong) NSMutableArray * dataBase;

@end

@implementation SearchTableViewController
static NSString * const searchCellID = @"searchCellID";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    NSString * filePath = [[NSBundle mainBundle] pathForResource:@"city" ofType:@"plist"];
    self.names = [NSDictionary dictionaryWithContentsOfFile:filePath];
    self.keys = [[self.names allKeys] sortedArrayUsingSelector:@selector(compare:)];
//    UISearchController
    
    _dataList=[NSMutableArray arrayWithArray:self.keys];
    _dataBase=[NSMutableArray arrayWithArray:self.keys];
    //[self createSearchBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.keys.count;
//    if (self.searchController.active) {
//        return [self.searchList count]/3;
//    }else{
//        return [self.dataList count];
//    }
    

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSString * key = self.keys[section];
    NSArray * nameSection = self.names[key];
    return [nameSection count];
}
-(NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return self.keys;
}


//返回每个索引的内容
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    
    if (self.searchController.active) {
        return [[_searchList objectAtIndex:section] uppercaseString];
    }else{
        return [_dataList objectAtIndex:section];
    }
    
    
}

//响应点击索引时的委托方法
-(NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    NSInteger count = 0;
    
    NSLog(@"%@-%ld",title,(long)index);
    
    for(NSString *character in _dataList)
    {
        if([character isEqualToString:title])
        {
            return count;
        }
        count ++;
    }
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:searchCellID forIndexPath:indexPath];
    NSString *key = self.keys[indexPath.section];
    NSArray * nameSection = self.names[key];
    cell.textLabel.text = nameSection[indexPath.row];
//    if (self.searchController.active) {
//        [cell.textLabel setText:self.searchList[indexPath.row]];
//    }
//    else{
//        [cell.textLabel setText:self.dataBase[indexPath.section * 3+indexPath.row]];
//    }

    return cell;
}


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

#pragma mark searchViewcontroller
- (void)createSearchBar{
    
    //    UISearchBar * searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0,0,self.view.bounds.size.width,64)];
    
    
    _searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    _searchController.searchResultsUpdater = self;
    _searchController.dimsBackgroundDuringPresentation = NO;
    _searchController.hidesNavigationBarDuringPresentation = NO;
    _searchController.searchBar.frame = CGRectMake(self.searchController.searchBar.frame.origin.x, self.searchController.searchBar.frame.origin.y, self.searchController.searchBar.frame.size.width, 44.0);
    
    self.searchController.searchBar.delegate = self;
    
    self.searchController.searchBar.keyboardType = UIKeyboardTypeDefault;
    
    
    self.tableView.tableHeaderView = self.searchController.searchBar;
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    searchBar.text=@"";
    [searchBar setShowsCancelButton:NO animated:YES];
    [searchBar resignFirstResponder];
    self.tableView.allowsSelection=YES;
    self.tableView.scrollEnabled=YES;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    //
    //    NSArray *results;
    [searchBar setShowsCancelButton:NO animated:YES];
    [searchBar resignFirstResponder];
    self.tableView.allowsSelection=YES;
    self.tableView.scrollEnabled=YES;
    //
    //    [self.dataList removeAllObjects];
    //    [self.dataList addObjectsFromArray:results];
    //
    //    [self.tableView reloadData];
    NSPredicate *preicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[c] %@", searchBar.text];
    if (self.searchList!= nil) {
        [self.searchList removeAllObjects];
    }
    //过滤数据
    self.searchList= [NSMutableArray arrayWithArray:[_dataBase filteredArrayUsingPredicate:preicate]];
    //刷新表格
    [self.tableView reloadData];
    //
}

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    
    NSLog(@"搜索begin");
    
    self.searchController.searchBar.showsCancelButton = YES;
    
    
    return YES;
}
- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar{
    
    NSLog(@"搜索end");
    
    //刷新表格
    [self.tableView reloadData];
    [searchBar setShowsCancelButton:NO animated:YES];
    [searchBar resignFirstResponder];
    
    
    return YES;
}
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    
    NSString *searchString = [self.searchController.searchBar text];
    NSPredicate *preicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[c] %@", searchString];
    if (self.searchList!= nil) {
        [self.searchList removeAllObjects];
    }
    
    //过滤数据
    self.searchList= [NSMutableArray arrayWithArray:[_dataBase filteredArrayUsingPredicate:preicate]];
    //刷新表格
    [self.tableView reloadData];
    
    
}


@end
