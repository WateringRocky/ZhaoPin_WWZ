//
//  SalaryQueryNaviController.m
//  ZhaoPin_WWZ
//
//  Created by Ibokan on 13-2-19.
//  Copyright (c) 2013年 Ibokan. All rights reserved.
//

#import "SalaryQueryNaviController.h"
#import "QueryConditionViewController.h"

@interface SalaryQueryNaviController ()

@end

@implementation SalaryQueryNaviController

-(id)init
{
    if (self = [super init])
    {
        QueryConditionViewController *aQueryConditionViewController = [[QueryConditionViewController alloc] init];
        [self initWithRootViewController:aQueryConditionViewController];
        [aQueryConditionViewController release];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
