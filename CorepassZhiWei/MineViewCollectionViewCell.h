//
//  MineViewCollectionViewCell.h
//  CorepassZhiWei
//
//  Created by 杨松辉 on 16/4/12.
//  Copyright © 2016年 YANG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MineViewCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIButton *mineImageBtn;
@property (weak, nonatomic) IBOutlet UILabel *mineTipLabel;
@property(nonatomic,strong)UINavigationController *nav;
@end
