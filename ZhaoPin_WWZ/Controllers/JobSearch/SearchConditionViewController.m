//
//  SearchConditionViewController.m
//  ZhaoPin_WWZ
//
//  Created by Ibokan on 13-2-19.
//  Copyright (c) 2013年 Ibokan. All rights reserved.
//

#import "SearchConditionViewController.h"

@interface SearchConditionViewController ()

@end

@implementation SearchConditionViewController

-(id)init
{
    if (self = [super init])
    {
        
        self.navigationItem.title = @"快速搜索";
        sectionNameArray = [[NSArray alloc] initWithObjects:@"选择职位搜索条件",@"我的历史搜索", nil];
    }
    return self;
}

-(void)loadView
{
    self.view = [[[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds]autorelease];
    self.view.backgroundColor = [UIColor clearColor];
    //?
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"高级搜索" style:UIBarButtonItemStyleBordered target:self action:@selector(changeViewAction:)];
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
    [rightBarButtonItem release];
    
    self.tableView = [[[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 480-20-44-49) style:UITableViewStyleGrouped]autorelease];
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
    UILabel *sectionNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 5, 200, 40)];
    [sectionNameLabel setTextColor:[UIColor whiteColor]];
    sectionNameLabel.backgroundColor = [UIColor clearColor];
    [sectionNameLabel setFont:[UIFont systemFontOfSize:18]];
    sectionNameLabel.text = [sectionNameArray objectAtIndex:section];
    [headerView addSubview:sectionNameLabel];
    [sectionNameLabel release];
    
    if (section == 1)
    {
        UILabel *numberLabel = [[UILabel alloc] initWithFrame:CGRectMake(240, 5,60, 40)];
        [numberLabel setTextColor:[UIColor whiteColor]];
        [numberLabel setBackgroundColor:[UIColor clearColor]];
        [numberLabel setFont:[UIFont systemFontOfSize:18]];
        //根据数据源 修改显示
        numberLabel.text = @"3 条";
        [headerView addSubview:numberLabel];
        [numberLabel release];
        
        UIImageView *searchHistoryImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"searchHistoryArrowDown.png"]];
        searchHistoryImageView.center = CGPointMake(headerView.frame.size.width - 30 , headerView.frame.size.height/2);
        [headerView addSubview:searchHistoryImageView];
        [searchHistoryImageView release];
    }
    
    return [headerView autorelease];
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 60)];
    footerView.backgroundColor = [UIColor clearColor];
    if (section == 0)
    {
        UIButton *searchBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        searchBtn.frame = CGRectMake(80, 15, 160, 35);
        [searchBtn setBackgroundImage:[UIImage imageNamed:@"button_bg_normal.png"] forState:UIControlStateNormal];
        [searchBtn setBackgroundImage:[UIImage imageNamed:@"button_bg_press.png"] forState:UIControlStateSelected];
        [searchBtn setTintColor:[UIColor whiteColor]];
        [searchBtn setTitle:@"查询" forState:0];
        [searchBtn addTarget:self action:@selector(searchAction:) forControlEvents:UIControlEventTouchUpInside];
        [footerView addSubview:searchBtn];
        
        UIImageView *aLineImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"contentSprarator.png"]];
        aLineImageView.center = CGPointMake(footerView.center.x, footerView.frame.size.height+5);
        [footerView addSubview:aLineImageView];
        [aLineImageView release];
    }
    
    return [footerView autorelease];
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 5;
    }
    else
    {
        return 3;//数据源
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIndentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
    }
    
    cell.textLabel.text = @"测试";
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 60;
    }
    else
    {
        return 0;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //push
    NSLog(@"~~~~~~~~~~~~~~~~~~~~");
}
#pragma mark -
#pragma mark -Custom Methods-

-(void)changeViewAction:(UIBarButtonItem *)sender
{
    
}
-(void)searchAction:(UIButton *)sender
{
    //查询功能
}

#pragma mark -
#pragma mark -Memory Managament-
-(void)dealloc
{
    [sectionNameArray release];
    [super dealloc];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
