//
//  LogInViewController.m
//  ZhaoPin_WWZ
//
//  Created by Ibokan on 13-2-19.
//  Copyright (c) 2013年 Ibokan. All rights reserved.
//

#import "LogInViewController.h"
#import "RegisterViewController.h"

@interface LogInViewController ()

@end

@implementation LogInViewController

-(id)init
{
    self = [super init];
    if (self)
    {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //self.view.backgroundColor = [UIColor grayColor];
    //登陆view
	UIImageView *loginBgView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 300, 100)];
    loginBgView.image = [UIImage imageNamed:@"loginBg"];
    [self.view addSubview:loginBgView];
    [loginBgView release];
    //[self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"loginBg"]]];
    //邮箱Field
    UITextField *mailField = [[UITextField alloc]initWithFrame:CGRectMake(70, 20, 230, 30)];
    mailField.borderStyle = UITextBorderStyleRoundedRect;
    mailField.placeholder = @"请输入邮箱地址";
    mailField.clearsOnBeginEditing = YES;
    mailField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.view addSubview:mailField];
    [mailField release];

    //密码Field
    UITextField *registerField = [[UITextField alloc]initWithFrame:CGRectMake(70, 70, 230, 30)];
    registerField.borderStyle = UITextBorderStyleRoundedRect;
    registerField.placeholder = @"请输入密码";
    registerField.clearsOnBeginEditing = YES;
    registerField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.view addSubview:registerField];
    [registerField release];
    //登陆Button
    UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    loginButton.frame = CGRectMake(10, 115, 130, 44);
    [loginButton setBackgroundImage:[UIImage imageNamed:@"loginNormal"]  forState:UIControlStateNormal];
    [loginButton setBackgroundImage:[UIImage imageNamed:@"loginPress"]  forState:UIControlStateHighlighted];
    [loginButton setTitle:@"登陆" forState:UIControlStateNormal];
    [loginButton addTarget:self action:@selector(loginDidSomething) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginButton];
    
    //注册button
    UIButton *registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    registerButton.frame = CGRectMake(180, 115, 130, 44);
    [registerButton setBackgroundImage:[UIImage imageNamed:@"registerNormal"]  forState:UIControlStateNormal];
    [registerButton setBackgroundImage:[UIImage imageNamed:@"registerPress"]  forState:UIControlStateHighlighted];
    [registerButton setTitle:@"注册新用户" forState:UIControlStateNormal];
    [registerButton addTarget:self action:@selector(registerUerInfo) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registerButton];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)loginDidSomething
{
    //TODO:提示信息的判断
    UIAlertView *loginAlertView = [[UIAlertView alloc]initWithTitle:nil message:@"请输入用户名" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [loginAlertView show];
    [loginAlertView release];
    
}
-(void)registerUerInfo
{
    RegisterViewController *registerController = [[RegisterViewController alloc]init];
    [self.navigationController pushViewController:registerController animated:YES];
    [registerController release];
    
}
@end
