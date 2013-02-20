//
//  JobRecommendViewController.m
//  ZhaoPin_WWZ
//
//  Created by Ibokan on 13-2-19.
//  Copyright (c) 2013年 Ibokan. All rights reserved.
//

#import "JobRecommendViewController.h"

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

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc]initWithTitle:@"申请"
                                                                      style:UIBarButtonItemStyleDone
                                                                     target:self
                                                                     action:@selector(applyForPosition)];
    self.navigationItem.rightBarButtonItem = rightBarButton;
    [rightBarButton release];
    //
	
}
-(void)applyForPosition
{
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
