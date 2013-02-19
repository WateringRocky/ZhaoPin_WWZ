//
//  GuideListViewController.m
//  ZhaoPin_WWZ
//
//  Created by Ibokan on 13-2-19.
//  Copyright (c) 2013年 Ibokan. All rights reserved.
//

#import "GuideListViewController.h"

@interface GuideListViewController ()

@end

@implementation GuideListViewController
@synthesize tableView = _tableView;

-(id)init
{
    if (self = [super init])
    {
    }
    return self;
}
-(void)loadView
{
    self.view = [[[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds]autorelease];
    self.view.backgroundColor = [UIColor yellowColor];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView = [[[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 460) style:UITableViewStyleGrouped]autorelease];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
