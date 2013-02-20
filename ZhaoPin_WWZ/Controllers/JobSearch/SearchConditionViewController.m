//
//  SearchConditionViewController.m
//  ZhaoPin_WWZ
//
//  Created by Ibokan on 13-2-19.
//  Copyright (c) 2013年 Ibokan. All rights reserved.
//

#import "SearchConditionViewController.h"

@interface SearchConditionViewController ()
{
    BOOL openChoice;
    NSArray *_testArray;
}
@end


@implementation SearchConditionViewController

-(id)init
{
    if (self = [super init])
    {
        sectionNameArray = [[NSArray alloc] initWithObjects:@"选择职位搜索条件",@"我的历史搜索", nil];
        openChoice = NO;
        
    }
    return self;
}

-(void)loadView
{
    self.view = [[[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds]autorelease];
    self.view.backgroundColor = [UIColor clearColor];
    //定义navigationbar
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationbar_bg.png"] forBarMetrics:UIBarMetricsDefault];
    self.navigationItem.title = @"快速搜索";
    
    navigationBarButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    navigationBarButton.exclusiveTouch = YES;
    navigationBarButton.frame = CGRectMake(240, 6, 70, 32);
    [navigationBarButton.titleLabel setFont:[UIFont systemFontOfSize:14]];
    [navigationBarButton setTitle:@"高级搜索" forState:0];
    [navigationBarButton setTitleColor:[UIColor whiteColor] forState:0];
    [navigationBarButton setBackgroundImage:[UIImage imageNamed:@"setting-button-click.png" ] forState:0];
    [navigationBarButton addTarget:self action:@selector(changeViewAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightBarbutton = [[[UIBarButtonItem alloc] initWithCustomView:navigationBarButton]autorelease];
    self.navigationItem.rightBarButtonItem = rightBarbutton;
    
    self.tableView = [[[UITableView alloc] initWithFrame:CGRectMake(0,0, 320, 480-20-44-49) style:UITableViewStyleGrouped]autorelease];
    UIImageView *aBackImageView = [[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)]autorelease];
    aBackImageView.backgroundColor = [UIColor clearColor];
    self.tableView.backgroundView = aBackImageView;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.tableView];
    
    //自定义navigation
    /*
    UIImageView *naviImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0 , 320, 44)];
    [naviImageView.layer setShadowOffset:CGSizeMake(1, 1)];
    [naviImageView.layer setShadowOpacity:0.5];
    [naviImageView.layer setShadowColor:[UIColor blackColor].CGColor];
    [naviImageView.layer setShadowRadius:2];

    naviImageView.image = [UIImage imageNamed:@"navigationbar_bg.png"];
    naviImageView.userInteractionEnabled = YES;
    [self.view addSubview:naviImageView];
    UILabel *titileLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 44)];
    titileLabel.center = CGPointMake(naviImageView.center.x, naviImageView.center.y);
    titileLabel.textColor = [UIColor whiteColor];
    [titileLabel setFont:[UIFont systemFontOfSize:20]];
    titileLabel.backgroundColor = [UIColor clearColor];
    titileLabel.text = @"快速搜索";
    [naviImageView addSubview:titileLabel];
    [titileLabel release];
    
    UIButton *navigationBarButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    navigationBarButton.frame = CGRectMake(240, 6, 70, 32);
    [navigationBarButton.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [navigationBarButton setTitle:@"高级搜索" forState:0];
    [navigationBarButton setTitleColor:[UIColor whiteColor] forState:0];
    [navigationBarButton setBackgroundImage:[UIImage imageNamed:@"setting-button-click.png" ] forState:0];
    [navigationBarButton addTarget:self action:@selector(changeViewAction:) forControlEvents:UIControlEventTouchUpInside];
    [naviImageView addSubview:navigationBarButton];
    */
    
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
        searchBtn.frame = CGRectMake(80, 15, 160, 40);
        [searchBtn.titleLabel setFont:[UIFont systemFontOfSize:18]];
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
    if (openChoice == YES)
    {
        if (section == 0)
        {
            return 12;
        }
        else
        {
            return 3;
        }
    }
    else
    {
        if (section == 0)
        {
            return 6;
        }
        else
        {
            return 3;//数据源
        }
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
    return 42;
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
    if ([self.navigationItem.title isEqualToString:@"快速搜索"])
    {
        [navigationBarButton setTitle:@"快速搜索" forState:0];
        self.navigationItem.title = @"高级搜索";
    }
    else
    {
        [navigationBarButton setTitle:@"高级搜索" forState:0];
        self.navigationItem.title = @"快速搜索";
    }
    
    if (openChoice == NO)
    {
        openChoice = YES;
    }
    else
    {
        openChoice = NO;
    }
    [self.tableView reloadData];
    
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
