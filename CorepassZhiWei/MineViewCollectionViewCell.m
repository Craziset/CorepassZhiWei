//
//  MineViewCollectionViewCell.m
//  CorepassZhiWei
//
//  Created by 杨松辉 on 16/4/12.
//  Copyright © 2016年 YANG. All rights reserved.
//

#import "MineViewCollectionViewCell.h"
#import "MissionTableViewController.h"
#import "MineViewCollectionViewCell.h"
@implementation MineViewCollectionViewCell
- (IBAction)btnClick:(id)sender {
   
    MissionTableViewController *vc=[[UIStoryboard storyboardWithName:@"CollectionViewCellClick" bundle:[NSBundle mainBundle]]instantiateViewControllerWithIdentifier:@"MissionTableViewController"];
    vc.str=self.mineTipLabel.text;
    [self.nav pushViewController:vc animated:YES ];
    
}

@end
