//
//  MineViewCollectionViewCell.m
//  CorepassZhiWei
//
//  Created by 杨松辉 on 16/4/12.
//  Copyright © 2016年 YANG. All rights reserved.
//

#import "MineViewCollectionViewCell.h"


#import "MissionTableViewController.h"

#define initVCFromSTB(VC) [[UIStoryboard storyboardWithName:@"CollectionViewCellClick" bundle:[NSBundle mainBundle]]instantiateViewControllerWithIdentifier:VC];

@implementation MineViewCollectionViewCell
- (IBAction)btnClick:(id)sender {
   
    UIViewController *modeVC=nil;
    MissionTableViewController *vcMission=initVCFromSTB(@"MissionTableViewController");
    vcMission.str=self.mineTipLabel.text;
    
    UITableViewController *vcAcount=initVCFromSTB(@"AcountSafeTableViewController");
    UITableViewController *vcIdentifyAuth=initVCFromSTB(@"IdentityAuthTableViewController");
    UITableViewController *vcCertificate=initVCFromSTB(@"CertificateTableViewController");
    
    switch (self.mineImageBtn.tag)
    {
        case 0:
            modeVC=vcMission;
            break;
        case 4:
            modeVC=vcAcount;
            break;
        case 5:
            modeVC=vcIdentifyAuth;
            break;
        case 6:
            modeVC=vcCertificate;
            break;
            
        default:
            modeVC=vcMission;
            break;
    }
    if (modeVC)
    {
       [self.nav pushViewController:modeVC animated:YES ];
    }
    
}

@end
