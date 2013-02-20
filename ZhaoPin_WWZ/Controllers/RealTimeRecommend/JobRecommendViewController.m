//
//  JobRecommendViewController.m
//  ZhaoPin_WWZ
//
//  Created by Ibokan on 13-2-19.
//  Copyright (c) 2013年 Ibokan. All rights reserved.
//

#import "JobRecommendViewController.h"
#import "LogInViewController.h"

@interface JobRecommendViewController ()

@end

@implementation JobRecommendViewController

-(id)init
{
    self = [super init];
    if (self)
    {
        
    }
    return self;
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"您尚未登陆，无法推荐职位" delegate:self cancelButtonTitle:@"放弃" otherButtonTitles:@"登陆", nil];
    [alertView show];
    [alertView release];
}
-(void)loadView
{
    self.view = [[[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds]autorelease];
    self.view.backgroundColor = [UIColor clearColor];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationbar_bg.png"] forBarMetrics:UIBarMetricsDefault];
     self.navigationItem.title = @"实时推荐";
    
    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc]initWithTitle:@"申请"
                                                                      style:UIBarButtonItemStyleDone
                                                                     target:self
                                                                     action:@selector(applyForPosition)];
    self.navigationItem.rightBarButtonItem = rightBarButton;
    [rightBarButton release];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
}
-(void)applyForPosition
{
//TODO:判断登陆情况1:没有登陆2：已经登陆过了
    UIAlertView *applyAlertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"您尚未登陆，无法推荐职位" delegate:self cancelButtonTitle:@"放弃" otherButtonTitles:@"登陆", nil];
    [applyAlertView show];
    [applyAlertView release];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark -UIAlertViewDelegate方法-
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1)
    {
        LogInViewController *loginController = [[LogInViewController alloc]init];
        [self.navigationController pushViewController:loginController animated:YES];
        [loginController release];
    }
 }
@end
