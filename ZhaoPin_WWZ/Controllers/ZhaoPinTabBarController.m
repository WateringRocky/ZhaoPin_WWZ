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
        NSMutableArray *controllerArray = [NSMutableArray array];
        
        JobGuideNaviController *aJobGuideNaviController = [[JobGuideNaviController alloc] init];
        JobSearchNaviController *aJobSearchNaviController = [[JobSearchNaviController alloc] init];
        SalaryQueryNaviController *aSalaryQueryNaviController = [[SalaryQueryNaviController alloc] init];
        RealTimeRecommendNaviController *aRealTimeRecommendNaviController = [[RealTimeRecommendNaviController alloc] init];
        MyZhiLianNaviController *aMyZhiLianNaviController = [[MyZhiLianNaviController alloc] init];
        
        [controllerArray addObject:aJobGuideNaviController];
        [controllerArray addObject:aJobSearchNaviController];
        [controllerArray addObject:aSalaryQueryNaviController];
        [controllerArray addObject:aRealTimeRecommendNaviController];
        [controllerArray addObject:aMyZhiLianNaviController];
        
        [aJobSearchNaviController release];
        [aJobGuideNaviController release];
        [aSalaryQueryNaviController release];
        [aRealTimeRecommendNaviController release];
        [aMyZhiLianNaviController release];
        
        self.viewControllers = controllerArray;
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
