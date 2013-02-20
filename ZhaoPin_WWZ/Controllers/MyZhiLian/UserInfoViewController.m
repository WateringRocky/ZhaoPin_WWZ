//
//  UserInfoViewController.m
//  ZhaoPin_WWZ
//
//  Created by Ibokan on 13-2-19.
//  Copyright (c) 2013年 Ibokan. All rights reserved.
//

#import "UserInfoViewController.h"
#import "LogInViewController.h"
#import "DetailInfoViewController.h"

@interface UserInfoViewController ()

@end

@implementation UserInfoViewController
@synthesize showLabel;
-(void)dealloc
{
    [_tableView release];
    [_imageArray release];
    [_textArray release];
    [super dealloc];
}
-(id)init
{
    self = [super init];
    if (self)
    {
        _imageArray = [NSMutableArray arrayWithObjects:[UIImage imageNamed:@"unreader"],
                       [UIImage imageNamed:@"favorite"],
                       [UIImage imageNamed:@"job_record"],
                       [UIImage imageNamed:@"searchSubscribeViewController"],nil];
        _textArray = [NSMutableArray arrayWithObjects:@"人事经理来信",@"职位申请记录",@"职位收藏夹",@"搜索与订阅", nil];
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
    UIButton *scanButton = [UIButton buttonWithType:UIButtonTypeCustom];
    scanButton.frame = CGRectMake(10, 44, 90, 66);
    [scanButton setTitle:@"浏览" forState:UIControlStateNormal];
    [scanButton addTarget:self action:@selector(scanInfo) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:scanButton];
    
    UIButton *rereshButton = [UIButton buttonWithType:UIButtonTypeCustom];
    rereshButton.frame = CGRectMake(100, 44, 50, 66);
    [rereshButton setImage:[UIImage imageNamed:@"reresh_resume_button"] forState:UIControlStateHighlighted];
    [rereshButton setTitle:@"刷新" forState:UIControlStateNormal];
    [rereshButton addTarget:self action:@selector(rereshInfo) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:rereshButton];
    
    UIButton *searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
    searchButton.frame = CGRectMake(200, 44, 100, 66);
    [searchButton setImage:[UIImage imageNamed:@"search_result_unselected"] forState:UIControlEventTouchUpInside];
    [searchButton setImage:[UIImage imageNamed:@"search_result_selected"] forState:UIControlEventTouchUpOutside];
    [searchButton addTarget:self action:@selector(settingUpDefaults) forControlEvents:UIControlEventTouchUpInside];
    [searchButton addTarget:self action:@selector(callOffDefaults) forControlEvents:UIControlEventTouchUpOutside];
    [self.view addSubview:searchButton];
    
    //TableView
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(10, 170, 300, 160)
                                             style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    return indexPath;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIndexPath = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndexPath];
    if (cell == nil)
    {
        cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndexPath]autorelease];
    }
    cell.imageView.image = [_imageArray objectAtIndex:indexPath.row];
    cell.textLabel.text = [_textArray objectAtIndex:indexPath.row];
    cell.textLabel.backgroundColor = [UIColor clearColor];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    //showLabel = [[UILabel alloc]initWithFrame:CGRectMake(200, 180, 50, 20)];
    
    
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailInfoViewController *derailInfoContoller = [DetailInfoViewController new];
    [self.navigationController pushViewController:derailInfoContoller animated:YES];
    [derailInfoContoller release];
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

#pragma mark -search按钮的一些方法-
//浏览按钮的方法
-(void)scanInfo
{

}
//刷新按钮的方法
-(void)rereshInfo
{

}
//设置默认简历的方法
-(void)settingUpDefaults
{
    UIAlertView *setAlert = [[UIAlertView alloc]initWithTitle:nil message:@"默认简历只能设置一份，确定设置该份简历为默认简历吗？" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [setAlert show];
    [setAlert release];
}
//取消默认简历的方法
-(void)callOffDefaults
{
    UIAlertView *callOffAlert = [[UIAlertView alloc]initWithTitle:nil message:@"改简历为默认简历，确认取消吗？" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [callOffAlert show];
    [callOffAlert release];
}

@end
