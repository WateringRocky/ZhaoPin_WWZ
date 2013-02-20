//
//  JobSearchNaviController.m
//  ZhaoPin_WWZ
//
//  Created by Ibokan on 13-2-19.
//  Copyright (c) 2013年 Ibokan. All rights reserved.
//

#import "JobSearchNaviController.h"
#import "SearchConditionViewController.h"

@interface JobSearchNaviController ()

@end

@implementation JobSearchNaviController

-(id)init
{
    if (self = [super init])
    {
        SearchConditionViewController *aSearchConditionViewController = [[SearchConditionViewController alloc]init];
        [self initWithRootViewController:aSearchConditionViewController];
        [aSearchConditionViewController release];
        
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];

}
#pragma mark -
#pragma mark -Custom Methods-


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
