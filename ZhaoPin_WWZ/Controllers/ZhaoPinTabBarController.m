//
//  ZhaoPinTabBarController.m
//  ZhaoPin_WWZ
//
//  Created by Ibokan on 13-2-19.
//  Copyright (c) 2013年 Ibokan. All rights reserved.
//

#import "ZhaoPinTabBarController.h"
#import "JobGuideNaviController.h"
#import "JobSearchNaviController.h"
#import "SalaryQueryNaviController.h"
#import "RealTimeRecommendNaviController.h"
#import "MyZhiLianNaviController.h"

@interface ZhaoPinTabBarController ()

@end

@implementation ZhaoPinTabBarController

-(id)init
{
    if (self = [super init])
    {
        UIImage *searchjobTabImage = [UIImage imageNamed:@"searchjob.png"];
        UIImage *searchjobTabSelectedImage = [UIImage imageNamed:@"searchjob_s.png"];
        UIImage *myzhilianTabImage = [UIImage imageNamed:@"myzl.png"];
        UIImage *myzhilianTabSelectedImage = [UIImage imageNamed:@"myzl_s.png"];
        UIImage *realtimeTabImage = [UIImage imageNamed:@"realtime.png"];
        UIImage *realtimeTabSelectedImage = [UIImage imageNamed:@"realtime_s.png"];
        UIImage *searchsalaryTabImage = [UIImage imageNamed:@"searchsalary.png"];
        UIImage *serchsalaryTabselectedImage = [UIImage imageNamed:@"searchsalary_s.png"];
        UIImage *jobguideTabImage = [UIImage imageNamed:@"jobguide.png"];
        UIImage *jobguideTabselectedImage = [UIImage imageNamed:@"jobguide_s.png"];
        
        firImagesArray = [[NSArray alloc]initWithObjects:searchjobTabImage,myzhilianTabImage,realtimeTabImage,searchsalaryTabImage,jobguideTabImage,serchsalaryTabselectedImage, nil];
        secImagesArray = [[NSArray alloc] initWithObjects:searchjobTabSelectedImage,myzhilianTabSelectedImage,realtimeTabSelectedImage,serchsalaryTabselectedImage,jobguideTabselectedImage,nil];
        
        NSMutableArray *controllerArray = [NSMutableArray array];
        
        JobGuideNaviController *aJobGuideNaviController = [[JobGuideNaviController alloc] init];
        JobSearchNaviController *aJobSearchNaviController = [[JobSearchNaviController alloc] init];
        SalaryQueryNaviController *aSalaryQueryNaviController = [[SalaryQueryNaviController alloc] init];
        RealTimeRecommendNaviController *aRealTimeRecommendNaviController = [[RealTimeRecommendNaviController alloc] init];
        MyZhiLianNaviController *aMyZhiLianNaviController = [[MyZhiLianNaviController alloc] init];
        
        [controllerArray addObject:aJobSearchNaviController];
        [controllerArray addObject:aMyZhiLianNaviController];
        [controllerArray addObject:aRealTimeRecommendNaviController];
        [controllerArray addObject:aSalaryQueryNaviController];
        [controllerArray addObject:aJobGuideNaviController];
        
        [aJobSearchNaviController release];
        [aJobGuideNaviController release];
        [aSalaryQueryNaviController release];
        [aRealTimeRecommendNaviController release];
        [aMyZhiLianNaviController release];
        
        self.tabBar.backgroundImage = [UIImage imageNamed:@"bottombar.png"];
        self.viewControllers = controllerArray;
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImage *aBackImage = [UIImage imageNamed:@"filterbg.png"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:aBackImage];
    for (int i = 0; i<5; i++)
    {
        UIButton *tabButtons = [UIButton buttonWithType:UIButtonTypeCustom];
        tabButtons.frame = CGRectMake(64*i, 480-49, 64, 49);
        [tabButtons setImage:[firImagesArray objectAtIndex:i] forState:0];
        [tabButtons setImage:[secImagesArray objectAtIndex:i] forState:UIControlStateSelected];
        [tabButtons addTarget:self action:@selector(changeController:) forControlEvents:UIControlEventTouchUpInside];
        tabButtons.tag = 1100+i;
        [self.view addSubview:tabButtons];
    }
	
}
#pragma mark -
#pragma mark -Custom Methods-
-(void)changeController:(UIButton *)sender
{
    if ([_targetBtn isEqual:sender])
    {
        return;
    }
    switch (sender.tag)
    {
        case 1100:
        {
            self.selectedIndex = 0;
            break;
        }
        case 1101:
        {
            self.selectedIndex = 1;
            break;
        }
        case 1102:
        {
            self.selectedIndex = 2;
            break;
        }
        case 1103:
        {
            self.selectedIndex = 3;
            break;
        }
        case 1104:
        {
            self.selectedIndex = 4;
            break;
        }
        default:
        break;
    }
        
        _targetBtn.selected = NO;
        _targetBtn = sender;
        _targetBtn.selected = YES;
}

#pragma mark -
#pragma mark -Memory Managament-
-(void)dealloc
{
    [super dealloc];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
