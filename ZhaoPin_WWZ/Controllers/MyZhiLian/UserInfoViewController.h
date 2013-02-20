//
//  UserInfoViewController.h
//  ZhaoPin_WWZ
//
//  Created by Ibokan on 13-2-19.
//  Copyright (c) 2013年 Ibokan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserInfoViewController : UIViewController<UIAlertViewDelegate,UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    NSMutableArray *_imageArray;
    NSMutableArray *_textArray;
    
}
@property(nonatomic,readonly)UILabel *showLabel;
@end
