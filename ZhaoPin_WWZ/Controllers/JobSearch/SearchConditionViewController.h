//
//  SearchConditionViewController.h
//  ZhaoPin_WWZ
//
//  Created by Ibokan on 13-2-19.
//  Copyright (c) 2013年 Ibokan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchConditionViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    NSArray * sectionNameArray;
    
    UIButton *navigationBarButton;
}
@property (nonatomic,retain) UITableView *tableView;

@end
