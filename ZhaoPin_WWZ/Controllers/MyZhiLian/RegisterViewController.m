//
//  RegisterViewController.m
//  ZhaoPin_WWZ
//
//  Created by Ibokan on 13-2-19.
//  Copyright (c) 2013年 Ibokan. All rights reserved.
//

#import "RegisterViewController.h"
#import "LogInViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    UIImageView *registerView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 300, 210)];
    registerView.image = [UIImage imageNamed:@"registerBg"];
    [self.view addSubview:registerView];
    
    UITextField *phoneField = [[UITextField alloc]initWithFrame:CGRectMake(100, 20, 200, 30)];
    phoneField.borderStyle = UITextBorderStyleRoundedRect;
    phoneField.placeholder = @"请输入手机号";
    phoneField.clearsOnBeginEditing = YES;
    phoneField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.view addSubview:phoneField];
    [phoneField release];
    
    UITextField *mailField = [[UITextField alloc]initWithFrame:CGRectMake(100, 20+54, 200, 30)];
    mailField.borderStyle = UITextBorderStyleRoundedRect;
    mailField.placeholder = @"请输入邮箱地址";
    mailField.clearsOnBeginEditing = YES;
    mailField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.view addSubview:mailField];
    [mailField release];
    
    UITextField *keyField = [[UITextField alloc]initWithFrame:CGRectMake(100, 20+108, 200, 30)];
    keyField.borderStyle = UITextBorderStyleRoundedRect;
    keyField.placeholder = @"请输入密码";
    keyField.clearsOnBeginEditing = YES;
    keyField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.view addSubview:keyField];
    [keyField release];
    
    UITextField *conkeyField = [[UITextField alloc]initWithFrame:CGRectMake(100, 20+158, 200, 30)];
    conkeyField.borderStyle = UITextBorderStyleRoundedRect;
    conkeyField.placeholder = @"请输入密码";
    conkeyField.clearsOnBeginEditing = YES;
    conkeyField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.view addSubview:conkeyField];
    [conkeyField release];
    [registerView release];
    
    //注册button
    UIButton *registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    registerButton.frame = CGRectMake(10, 230, 130, 44);
    [registerButton setBackgroundImage:[UIImage imageNamed:@"registerNormal"]  forState:UIControlStateNormal];
    [registerButton setBackgroundImage:[UIImage imageNamed:@"registerPress"]  forState:UIControlStateHighlighted];
    [registerButton setTitle:@"注册" forState:UIControlStateNormal];
    [registerButton addTarget:self action:@selector(registerNewUerInfo) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registerButton];
    
    //登陆Button
    UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    loginButton.frame = CGRectMake(180, 230, 130, 44);
    [loginButton setBackgroundImage:[UIImage imageNamed:@"loginNormal"]  forState:UIControlStateNormal];
    [loginButton setBackgroundImage:[UIImage imageNamed:@"loginPress"]  forState:UIControlStateHighlighted];
    [loginButton setTitle:@"已有账户" forState:UIControlStateNormal];
    [loginButton addTarget:self action:@selector(backToLogin) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginButton];
    
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)registerNewUerInfo
{

}
-(void)backToLogin
{
    LogInViewController *logInController = [[LogInViewController alloc]init];
    [self.navigationController pushViewController:logInController animated:YES];
    [logInController release];
}


@end
