//
//  UserInfoViewController.m
//  ZhaoPin_WWZ
//
//  Created by Ibokan on 13-2-19.
//  Copyright (c) 2013年 Ibokan. All rights reserved.
//

#import "UserInfoViewController.h"
#import "LogInViewController.h"

@interface UserInfoViewController ()

@end

@implementation UserInfoViewController
-(void)dealloc
{
    [_tableView release];
    [super dealloc];
}
-(id)init
{
    self = [super init];
    if (self)
    {
        
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    //注销提示按钮
    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc]initWithTitle:@"注销" style:UIBarButtonItemStyleDone target:self action:@selector(cancelDidSomething)];
    self.navigationItem.rightBarButtonItem = rightBarButton;
    [rightBarButton release];
    
    //标题：
    UILabel *textLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    textLabel.text = @"用户名";//TODO:注册用户数据；
    [self.view addSubview:textLabel];
    [textLabel release];
    
    //searcherBgView：浏览，刷新，默认设置等功能
    UIImageView *searcherBgView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 44, 300, 66)];
    searcherBgView.image = [UIImage imageNamed:@"searcherBg"];
    [self.view addSubview:searcherBgView];
    [searcherBgView release];
    //TODO:三个Button
    
    //TableView
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(10, 170, 300, 160)
                                             style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
    

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//注销提示
-(void)cancelDidSomething
{
    UIAlertView *cencelAlertView = [[UIAlertView alloc]initWithTitle:nil message:@"是否确定注销？" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [cencelAlertView show];
    [cencelAlertView release];
}
#pragma mark -alertViewDelgete-
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1)
    {
        LogInViewController *loginControllor = [LogInViewController new];
        [self.navigationController pushViewController:loginControllor animated:YES];
        [loginControllor release];
    }
}


@end
