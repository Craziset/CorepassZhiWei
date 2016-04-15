//
//  ZWPaiCollectionView.m
//  CorepassZhiWei
//
//  Created by 杨松辉 on 16/4/14.
//  Copyright © 2016年 YANG. All rights reserved.
//

#import "ZWPaiCollectionView.h"


#import "TestCollectionViewCell.h"
#import "BusinessCenterCollectionViewCell.h"
#import "LibraryCollectionViewCell.h"
@implementation ZWPaiCollectionView




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)awakeFromNib
{
    businessNameAry=@[@"发布任务",@"任务管理",@"评价管理",@"资金管理",@"交易记录"];
    
    self.dataSource=self;
    self.delegate=self;

    [self registerNib:[UINib nibWithNibName:@"TestCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"testID"];
    [self registerNib:[UINib nibWithNibName:@"BusinessCenterCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"BusinessCenterCollectionViewCell"];
    [self registerNib:[UINib nibWithNibName:@"LibraryCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"LibraryCollectionViewCell"];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if([collectionView.restorationIdentifier isEqualToString:@"ZWPaiCollectionViewBusiness"])
    {
        return 5;
    }
    else{
    return 3;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([collectionView.restorationIdentifier isEqualToString:@"ZWPaiCollectionViewBusiness"])
    {
        BusinessCenterCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"BusinessCenterCollectionViewCell" forIndexPath:indexPath];
        [cell.businessBtn setTitle:businessNameAry[indexPath.row] forState:UIControlStateNormal];
        return cell;
        
        
    }else if ([collectionView.restorationIdentifier isEqualToString:@"libraryBusiness"])
    {
        LibraryCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"LibraryCollectionViewCell" forIndexPath:indexPath];
        cell.title.text=@"企业名称";
        cell.detail.text=@"企业介绍企业介绍企业介绍企业介绍企业介绍";
        cell.libraryImg.image=[UIImage imageNamed:@"2.jpg"];
        return cell;
        
    }else if ([collectionView.restorationIdentifier isEqualToString:@"libraryPerson"])
    {
        LibraryCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"LibraryCollectionViewCell" forIndexPath:indexPath];
        cell.title.text=@"运维师";
        cell.detail.text=@"个人介绍详情个人介绍详情个人介绍详情个人介绍详情个人介绍详情";
        cell.libraryImg.image=[UIImage imageNamed:@"11.jpg"];
        return cell;
    }
    
    else
    {
    TestCollectionViewCell *cell
    =[collectionView dequeueReusableCellWithReuseIdentifier:@"testID" forIndexPath:indexPath];
   cell.title.text=@"任务标题";
    cell.detail.text=@"简介简介简介简介简介简介简介";
    cell.layer.borderWidth=1;
    cell.layer.borderColor=[UIColor lightGrayColor].CGColor;
    cell.img.image=[UIImage imageNamed:@"1.jpg"];
    return cell;
    }
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if ([collectionView.restorationIdentifier isEqualToString:@"ZWPaiCollectionViewBusiness"])
    {
        return CGSizeMake(100,100);
    }else
    return CGSizeMake(self.frame.size.width/3-7, 140);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    if ([collectionView.restorationIdentifier isEqualToString:@"ZWPaiCollectionViewBusiness"])
    return UIEdgeInsetsMake(10, 10, 10, 10);
    else
        return UIEdgeInsetsMake(0, 0, 0, 0);
}




@end
