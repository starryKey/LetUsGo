//
//  ANSThreadViewController.m
//  LetUsGo
//
//  Created by Li_JinLin on 16/12/15.
//  Copyright © 2016年 Li_JinLin. All rights reserved.
//

#import "ANSThreadViewController.h"

@interface ANSThreadViewController ()
@property (nonatomic, strong)UIButton      *downLoadBtn;
@property (nonatomic, strong)UIImageView   *imgView;
@property (nonatomic, strong)UIButton      *createThread;


@end

@implementation ANSThreadViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.downLoadBtn];
    [self.view addSubview:self.imgView];
    [self.view addSubview:self.createThread];
    
}
- (UIButton *)downLoadBtn{
    if (_downLoadBtn == nil) {
        _downLoadBtn = [[UIButton alloc]initWithFrame:CGRectMake(60, 100, 100, 40)];
        _downLoadBtn.backgroundColor = [UIColor greenColor];
        [_downLoadBtn setTitle:@"下载" forState:UIControlStateNormal];
        [_downLoadBtn addTarget:self action:@selector(startDownLoad:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _downLoadBtn;
}
- (UIButton *)createThread{
    if (_createThread == nil) {
        _createThread = [[UIButton alloc]initWithFrame:CGRectMake(180, 100, 100, 40)];
        _createThread.backgroundColor = [UIColor greenColor];
        [_createThread setTitle:@"创建线程" forState:UIControlStateNormal];
        [_createThread addTarget:self action:@selector(createThreadAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _createThread;
}
- (UIImageView *)imgView{
    if (_imgView == nil) {
        _imgView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 200, 200, 100)];
    }
    return _imgView;
}
- (void)createThreadAction:(UIButton *)btn{
    //01获取当前线程
    NSThread *curTh = [NSThread currentThread];
    NSLog(@"当前线程:%@",curTh);
    //02获取主线程
    NSThread *mainTh = [NSThread mainThread];
    NSLog(@"主线程:%@",mainTh);
    //03第一种方式创建
    NSThread *threadA = [[NSThread alloc]initWithTarget:self selector:@selector(printDate:) object:@"今天是12月15"];
    threadA.name = @"线程A";
//    [threadA start];
    NSThread *threadB = [[NSThread alloc]initWithTarget:self selector:@selector(printWeek:) object:@"今天是周四"];
    threadB.name = @"线程B";
//    [threadB start];
    //04第二种创建方式
//    [NSThread detachNewThreadSelector:@selector(secondCreate:) toTarget:self withObject:@"方式二"];
    //05第三种创建方式:隐式创建
    [self performSelectorInBackground:@selector(thirdCreate:) withObject:@"方式三"];
}
- (void)secondCreate:(NSString *)str{
    NSLog(@"当前线程:%@--->方式:%@",[NSThread currentThread],str);
}
- (void)thirdCreate:(NSString *)str{
    NSLog(@"创建方式:%@",str);
}
- (void)printDate:(NSString *)str{
    for (int i = 0; i < 2; i++) {
        NSLog(@"%i--->日起:%@----线程:%@",i,str,[NSThread currentThread]);
    }
}
- (void)printWeek:(NSString *)str{
    for (int i = 0; i < 2; i++) {
        NSLog(@"%i--->星期:%@----线程:%@",i,str,[NSThread currentThread]);
    }
}
- (void)startDownLoad:(UIButton *)btn{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
