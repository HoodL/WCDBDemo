//
//  ViewController.m
//  WCDB-DEMO
//
//  Created by 黄坤 on 2018/1/18.
//  Copyright © 2018年 黄坤. All rights reserved.
//

#import "ViewController.h"
//#import "Person.h"
#import "Person+Extension.h"
#import "City.h"
#import "DBManager.h"
#import "MyModel+Extension.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *addBtn;
@property (weak, nonatomic) IBOutlet UIButton *deleteBtn;
@property (weak, nonatomic) IBOutlet UIButton *updateBtn;
@property (weak, nonatomic) IBOutlet UIButton *selectBtn;
@property (weak, nonatomic) IBOutlet UIButton *creatBtn;
@property (nonatomic,assign) NSInteger num;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_creatBtn addTarget:self action:@selector(creatButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    [_addBtn  addTarget:self action:@selector(insertButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    [_deleteBtn addTarget:self action:@selector(deleteButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    [_selectBtn addTarget:self action:@selector(seleteButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    [_updateBtn addTarget:self action:@selector(updateButtonClick) forControlEvents:UIControlEventTouchUpInside];
    self.num = 0;
    MyModel *model = [[MyModel alloc]init];
    if ([model conformsToProtocol:@protocol(myProtocol)]) {
        [model xxx:@"test"];
    }
    if([model respondsToSelector:@selector(xxx:)]) {
        [model xxx:@"AAA"];
    }
}
// 创建数据库
-(void)creatButtonClick{
    
    BOOL  result = [[PersonManager shareInstance] creatDatabase];
    NSLog(@"%@",((result == YES)?@"创建数据库成功":@"创建数据库失败"));
    
}


// 插入数据
-(void)insertButtonClick{
    int x = arc4random() % 100;

    //insert City
    City *city = [[City alloc]init];
    city.cityId = x;
    city.cityName = [NSString stringWithFormat:@"City%d",x];
    city.distance = 1000;
    [[DBManager shareInstance]insertData:city];
    
    self.num++;
    Person *pp = [[Person alloc]init];
    //pp.localID = self.num;
    pp.localID = x;
    NSString *str = [NSString stringWithFormat:@"%ld",9200+self.num];
    pp.studentId = str;
    pp.name = [NSString stringWithFormat:@"Hello WCDB%lu",self.num];
    pp.age = x;
    BOOL  result = [[PersonManager shareInstance] insertData:pp];
    NSLog(@"%@",((result == YES)?@"数据插入成功":@"数据插入失败"));
    
}


// 删除
-(void)deleteButtonClick
{
    NSString *str = [NSString stringWithFormat:@"%d",9202];

    BOOL  result = [[PersonManager shareInstance]deleteDataWithId:str];
    NSLog(@"%@",((result == YES)?@"删除9202数据成功":@"删除数据失败"));
    
}


// 查找数据
-(void)seleteButtonClick{
    //select City
    NSArray *cityArray = [[DBManager shareInstance]seleteDataOrderBy];
    City *city = cityArray.lastObject;
    NSLog(@"city.createTime=%@",city.createTime);
//    NSArray * array = [[PersonManager shareInstance]seletePersonOrderBy];
//    Person *p = array.lastObject;
//    NSDate *date = p.createTime;
//    NSLog(@"date = %@",date);
//    NSLog(@"%@",array);
    
}


// 更新数据
-(void)updateButtonClick{
    
    BOOL  result = [[PersonManager shareInstance]updateData:@"改名了" byId:9203];
    NSLog(@"%@",((result == YES)?@"修改9203数据成功":@"修改数据失败"));
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
