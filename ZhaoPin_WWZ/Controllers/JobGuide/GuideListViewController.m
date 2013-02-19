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
    self.view.backgroundColor = [UIColor yellowColor];
    
    self.tableView = [[[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 480-20-44-49) style:UITableViewStyleGrouped]autorelease];
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
    headerView.backgroundColor = [UIColor redColor];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(250, 5, 40, 30);
    [btn setTitle:@"更多" forState:UIControlStateNormal];
    btn.tag = 1000+section;
    [btn addTarget:self action:@selector(moreAction:) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:btn];
    
    return headerView;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 8;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSLog(@"%@",sectionNameArray);
    return [sectionNameArray objectAtIndex:section];
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
