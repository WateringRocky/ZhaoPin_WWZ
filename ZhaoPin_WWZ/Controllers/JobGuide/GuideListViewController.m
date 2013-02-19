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
    
    self.tableView = [[[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 460) style:UITableViewStyleGrouped]autorelease];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    //self.tableView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.tableView];

}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
}
#pragma mark -
#pragma mark -tableView Delegate-
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
    return 60;
}
//-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
//{
//    
//}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //push
    NSLog(@"~~~~~~~~~~~~~~~~~~~~");
}
#pragma mark -
#pragma mark -Memory Managament- 
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
