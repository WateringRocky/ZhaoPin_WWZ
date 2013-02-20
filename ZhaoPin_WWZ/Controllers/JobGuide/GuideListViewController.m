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
        self.navigationItem.title = @"求职指导";
        self.tabBarItem.title = @"职业查询";
        sectionNameArray = [[NSArray alloc]initWithObjects:@"网申",@"职场健康",@"毕业生",@"职场聚焦",@"简历",@"职业规划",@"薪酬",@"面试", nil];
        
    }
    return self;
}
-(void)dealloc
{
    [sectionNameArray release];
    [super dealloc];
}
-(void)loadView
{
    self.view = [[[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds]autorelease];
    self.view.backgroundColor = [UIColor clearColor];
    
    self.tableView = [[[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 480-20-44-49) style:UITableViewStyleGrouped]autorelease];
    //平铺图片
    UIImageView *aBackImageView = [[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)]autorelease];
    aBackImageView.backgroundColor = [UIColor clearColor];
    self.tableView.backgroundView = aBackImageView;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.tableView];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
}
#pragma mark -
#pragma mark -tableView Delegate-
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    headerView.backgroundColor = [UIColor clearColor];
    //更多 button
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setBackgroundImage:[UIImage imageNamed:@"moreNormal.png"] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:@"moreSelected.png"] forState:UIControlStateSelected];
    [btn setTitle:@"更多" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.frame = CGRectMake(230,13, 60, 30);
    btn.tag = 1000+section;
    [btn addTarget:self action:@selector(moreAction:) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:btn];
    //头部 title label
    UILabel *sectionNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, 100, 40)];
    [sectionNameLabel setTextColor:[UIColor whiteColor]];
    sectionNameLabel.backgroundColor = [UIColor clearColor];
    [sectionNameLabel setFont:[UIFont systemFontOfSize:20]];
    sectionNameLabel.text = [sectionNameArray objectAtIndex:section];
    [headerView addSubview:sectionNameLabel];
    [sectionNameLabel release];
    
    return [headerView autorelease];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 8;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIndentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
    }
    
    cell.accessoryView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"accessoryArrow.png"]]autorelease];
    
    cell.textLabel.text = @"测试";
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;
}
//-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
//{
//    
//}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //push
    NSLog(@"~~~~~~~~~~~~~~~~~~~~");
}
#pragma mark -
#pragma mark -Custom Methods-

-(void)moreAction:(UIButton *)sender
{
    
}

#pragma mark -
#pragma mark -Memory Managament- 
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
