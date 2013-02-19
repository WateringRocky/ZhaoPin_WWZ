//
//  RealTimeRecommendNaviController.m
//  ZhaoPin_WWZ
//
//  Created by Ibokan on 13-2-19.
//  Copyright (c) 2013年 Ibokan. All rights reserved.
//

#import "RealTimeRecommendNaviController.h"
#import "JobRecommendViewController.h"

@interface RealTimeRecommendNaviController ()

@end

@implementation RealTimeRecommendNaviController

-(id)init
{
    if (self = [super init])
    {
        JobRecommendViewController *aJobRecommendViewController = [[JobRecommendViewController alloc] init];
        [self initWithRootViewController:aJobRecommendViewController];
        [aJobRecommendViewController release];
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
