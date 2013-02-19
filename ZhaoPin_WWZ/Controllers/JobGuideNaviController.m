//
//  JobGuideNaviController.m
//  ZhaoPin_WWZ
//
//  Created by Ibokan on 13-2-19.
//  Copyright (c) 2013年 Ibokan. All rights reserved.
//

#import "JobGuideNaviController.h"
#import "GuideListViewController.h"

@interface JobGuideNaviController ()

@end

@implementation JobGuideNaviController

-(id)init
{
    if (self = [super init])
    {
        GuideListViewController *aGuideListViewController = [[GuideListViewController alloc] init];
        [self initWithRootViewController:aGuideListViewController];
        [aGuideListViewController release];
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
