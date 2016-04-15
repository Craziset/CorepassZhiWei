//
//  LibraryCollectionViewCell.h
//  CorepassZhiWei
//
//  Created by 杨松辉 on 16/4/14.
//  Copyright © 2016年 YANG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LibraryCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *libraryImg;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *detail;

@end
