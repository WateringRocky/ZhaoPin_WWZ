//
//  MyZhiLianNaviController.m
//  ZhaoPin_WWZ
//
//  Created by Ibokan on 13-2-19.
//  Copyright (c) 2013年 Ibokan. All rights reserved.
//

#import "MyZhiLianNaviController.h"
#import "LogInViewController.h"

@interface MyZhiLianNaviController ()

@end

@implementation MyZhiLianNaviController

-(id)init
{
    if (self = [super init])
    {
        LogInViewController *aLogInViewController = [[LogInViewController alloc] init];
        [self initWithRootViewController:aLogInViewController];
        [aLogInViewController release];
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
