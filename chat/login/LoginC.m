//
//  LoginC.m
//  chat
//
//  Created by 小仙女 guluoyan.cn on 2020/7/22.
//  Copyright © 2020 小仙女 guluoyan.cn. All rights reserved.
//

#import "LoginC.h"
#import "tabbar.h"
#import "HomeC.h"
#import "MyC.h"
@interface LoginC ()<UITextFieldDelegate>
@property(nonatomic,strong) UITextField *field1;
@property(nonatomic,strong) UITextField *field2;
@property(nonatomic,strong) NSArray *testArray;

@end


@implementation LoginC


-(NSArray *)testArray{
    
    if (_testArray == nil) {
        NSLog(@"232000");
    }
    return _testArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createLogo];
    [self createUserInput];
    [self createPasswordInput];
    [self createBtn];
//    self.testArray = @[@"1",@"2",@"3"];
    // Do any additional setup after loading the view.
}
-(void)createLogo{
    CGFloat userW  = 50;
    CGFloat userH = 50;
    CGFloat space = 30;
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.image = [UIImage imageNamed:@"logo"];
     
    imageView.contentMode =  UIViewContentModeScaleAspectFill;
    imageView.frame=CGRectMake(self.view.bounds.size.width / 2 - userW  / 2, self.view.bounds.size.height / 2  - userH / 2 - userH - 200 - space, 50, 50);
    [self.view addSubview:imageView];
}
-(void)createUserInput {
    CGFloat userW  = 250;
    CGFloat userH = 50;
    CGFloat space = 30;
    self.field1 = [[UITextField alloc]init];
    self.field1.layer.cornerRadius = 5;
    self.field1.delegate = self;
    self.field1.placeholder=@"请输入用户名";
    self.field1.layer.borderWidth = 1;
    self.field1.layer.borderColor= [UIColor greenColor].CGColor;
    self.field1.textAlignment = NSTextAlignmentCenter;
//    field.backgroundColor = [UIColor redColor];
    self.field1.frame= CGRectMake(self.view.bounds.size.width / 2 - userW  / 2, self.view.bounds.size.height / 2  - userH / 2 - userH - space, userW, userH);
    [self.view addSubview:self.field1];
}
-(void)createPasswordInput {
    CGFloat userW  = 250;
    CGFloat userH = 50;
//    CGFloat space = 10;
    self.field2 = [[UITextField alloc]init];
     self.field2.delegate = self;
     self.field2.layer.cornerRadius = 5;
    self.field2.secureTextEntry = YES;
    self.field2.placeholder=@"请输入密码";
        self.field2.layer.borderWidth = 1;
    self.field2.layer.borderColor= [UIColor greenColor].CGColor;
    self.field2.textAlignment = NSTextAlignmentCenter;
    self.field2.frame= CGRectMake(self.view.bounds.size.width / 2 - userW  / 2, self.view.bounds.size.height / 2  - userH / 2, userW, userH);
    [self.view addSubview:self.field2];
}
-(void)createBtn{
    CGFloat userW  = 250;
    CGFloat userH = 50;
    CGFloat space = 30;
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(self.view.bounds.size.width / 2 - userW  / 2, self.view.bounds.size.height / 2  + userH / 2 + space, userW, userH);
    [btn setTitle:@"登陆" forState:UIControlStateNormal];
    btn.backgroundColor= [UIColor blueColor];
//    [btn setImage:[UIImage imageNamed:@"avatar"] forState:UIControlStateNormal];
    [btn setTitle:@"登陆" forState:UIControlStateHighlighted];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

-(void)btnClick{
    NSLog(@"ddfdc");
    [self toTabBar];
//       [self.navigationController pushViewController:nv animated:YES];
  
}
- (void)toTabBar{
      
      HomeC *home = [[HomeC alloc] init];
      home.title= @"主页";
      
    home.tabBarItem.image=[UIImage imageNamed:@"home"];
    home.tabBarItem.selectedImage=[UIImage imageNamed:@"home"];
        MyC *my= [[MyC alloc]init];
        my.title = @"我的";
     
        my.tabBarItem.image=[UIImage imageNamed:@"person"];
        my.tabBarItem.selectedImage=[UIImage imageNamed:@"person"];
     tabbar *tab = [[tabbar alloc] init];
        tab.viewControllers= @[home,my];
      UINavigationController *nv = [[UINavigationController alloc] initWithRootViewController:tab];
       nv.modalPresentationStyle = UIModalPresentationFullScreen;
       nv.edgesForExtendedLayout = YES;
        nv.navigationBar.hidden= YES;
    
    [nv setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    [self presentViewController:nv  animated:YES completion:^{}];
}

- (BOOL)textFieldShouldReturn:(UITextField *)user{
    [user resignFirstResponder];
    return true;
}
//开始编辑的时候
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    NSLog(@"start edit");
    return YES;
}


//编辑结束，打印编辑内容
- (void)textFieldDidEndEditing:(UITextField *)textField {
    if(textField == self.field1){
        NSLog(@"edit end111111=%@", textField.text);
    }else {
         NSLog(@"password = %@", textField.text);
    }
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
