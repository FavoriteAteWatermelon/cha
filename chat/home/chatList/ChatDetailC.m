//
//  ChatDetailC.m
//  chat
//
//  Created by 小仙女 guluoyan.cn on 2020/7/22.
//  Copyright © 2020 小仙女 guluoyan.cn. All rights reserved.
//
#define RGBA(r,g,b,a) [UIColor colorWithRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:a]

#import "ChatDetailC.h"
#import "HomeC.h"
#import "itemCell.h"
#import "CellModel.h"
#import "MJExtension.h"
@import SocketIO;


@interface ChatDetailC ()<UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITextField *filed;
@property(nonatomic,strong) SocketManager *manager;
@property(nonatomic,strong)NSString *msg;
@property(nonatomic,strong) SocketIOClient *socket;
@property(nonatomic,strong)UITableView *tabView;
@property(nonatomic,strong)NSMutableArray *chatArray;
@property(nonatomic,strong) NSArray *statuses;

@end

@implementation ChatDetailC


-(NSMutableArray *)chatArray {
    if (!_chatArray){
        NSArray *array = @[@1,@2,@3];
        _chatArray = [NSMutableArray arrayWithArray:array];
        
    }
    return _chatArray;
}
-(NSArray *)statuses{
    NSLog(@"1121");
    if(!_statuses){
        _statuses = [CellModel mj_objectArrayWithFilename:@"statuses.plist"];
        NSLog(@"1121");
    }
    self.statuses = _statuses;
    NSLog(@"dd%@",_statuses);
    return _statuses;
}
NSString *ID = @"status";
- (void)viewDidLoad {
    [super viewDidLoad];
//    UILabel *titleLabel = [UILabel new];
//    titleLabel.text = self.titleName;
//    titleLabel.frame =CGRectMake(100, 100, 200, 100);
//    [self.view addSubview:titleLabel];
    NSLog(@"%@",self.statuses);
//    self.tabView.dataSource =self;
    UIView *myV = [UIView new];
    self.view.backgroundColor=[UIColor colorWithRed:240/ 255.0 green:240 / 255.0 blue:240 / 255.0 alpha:1];
    myV.backgroundColor=[UIColor colorWithRed:240/ 255.0 green:240 / 255.0 blue:240 / 255.0 alpha:1];
    myV.backgroundColor=[UIColor redColor];
    myV.frame= CGRectMake(0, 0, self.view.bounds.size.width,60);
    [self.view addSubview:myV];
    
    
     UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];;
    btn.imageEdgeInsets = UIEdgeInsetsMake(15, 0, 15, 70);
    
    btn.frame = CGRectMake(5, 10,100,60 );
    //    按钮都是有状态的，设置需要关联状态
    btn.titleEdgeInsets = UIEdgeInsetsMake(15, 0, 15, 20);
    btn.titleLabel.font = [UIFont systemFontOfSize:16];

    [btn setTitle:self.titleName forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [btn setTitle:self.titleName forState:UIControlStateHighlighted];
        [btn addTarget:self action:@selector(backBtn) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    
    UIView *bottomView = [UIView new];
    bottomView.backgroundColor =[UIColor redColor];
    bottomView.frame = CGRectMake(0, self.view.bounds.size.height - 60, self.view.bounds.size.width, 60);
    [self.view addSubview:bottomView];
    UIButton *soundBtn = [UIButton buttonWithType:UIButtonTypeCustom];
     [soundBtn setImage:[UIImage imageNamed:@"sound"] forState:UIControlStateNormal];
    soundBtn.frame=CGRectMake(20, 10, 40, 40);
    [soundBtn addTarget:self action:@selector(soundSend) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:soundBtn];
    UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
       [addBtn setImage:[UIImage imageNamed:@"add"] forState:UIControlStateNormal];
    addBtn.frame=CGRectMake(self.view.bounds.size.width - 60, 10, 40, 40);
      [addBtn addTarget:self action:@selector(sendMsg) forControlEvents:UIControlEventTouchUpInside];
      [bottomView addSubview:addBtn];
    self.filed = [[UITextField alloc]init];
    self.filed.backgroundColor=[UIColor whiteColor];
    self.filed.layer.cornerRadius = 5;
    self.filed.delegate = self;
    [self.filed addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];

    self.filed.frame=CGRectMake(65, 8, self.view.bounds.size.width - 130, 44);
    [bottomView addSubview:self.filed];
    self.tabView = [[UITableView alloc]init];
    [self.tabView registerClass:[itemCell class]forCellReuseIdentifier:ID];
    self.tabView.rowHeight= 250;
    self.tabView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    self.tabView.dataSource=self;
    self.tabView.delegate = self;
    [self.view addSubview:self.tabView];
    
    
//    self.tabView = [[UITableView alloc]init];
//    self.tabView.frame=CGRectMake(0, 70, self.view.bounds.size.width - 20, self.view.bounds.size.height - 140);
//
//    self.tabView.backgroundColor= [UIColor colorWithRed:240/ 255.0 green:240 / 255.0 blue:240 / 255.0 alpha:1];
////    static NSString *ID = @"chatInfo";
//    [self.tabView registerClass:[itemCell class] forCellReuseIdentifier:ID];
//    self.tabView.rowHeight = 250;
//    [self.view addSubview:self.tabView];
//
      
    
    
    
    // Do any additional setup after loading the view.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"dddc");
    return self.statuses.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    itemCell *cell= [tableView dequeueReusableCellWithIdentifier:ID];
     cell.chatModel = self.statuses[indexPath.row];
     return cell;
}
//确定cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CellModel *status = self.statuses[indexPath.row];

    return status.cellHeight;
//    return 20;
}

-(void)sendMsg {
    self.filed.text = @"";
    
    [self.socket emit:@"send" with:@[self.msg]];
}
-(void)textFieldDidChange :(UITextField *)theTextField{
//    NSLog( @"text changed: %@", theTextField.text);
    self.msg = theTextField.text;
}
-(void)soundSend{
    NSLog(@"sound");
//    s
   

//    [self.tabView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionNone animated:NO];
////    NSURL *url = [NSURL URLWithString:@"http://msicnd.club:3000/"];
//    self.manager = [[SocketManager alloc]initWithSocketURL:url config:@{}];
//        self.socket = [self.manager defaultSocket];
//        [self.socket connect];
}
- (void)textFieldDidEndEditing:(UITextField *)textField{
    NSLog(@"is=%@",textField);
}
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    NSLog(@"is=%@",textField);
}
-(void)backBtn{
//    HomeC *home = [[HomeC alloc]init];
        [self.navigationController popViewControllerAnimated:YES];
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
