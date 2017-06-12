//
//  ViewController.m
//  LetUsGo
//
//  Created by Li_JinLin on 16/10/13.
//  Copyright © 2016年 Li_JinLin. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "SMKSingleton.h"
#import "PublicKit.h"
#import "TestSingleTon.h"
#import "LeeRViewController.h"
#import "ANSThreadViewController.h"
@interface ViewController ()
@property (nonatomic, strong)UIButton *TestBtnA;
@property (nonatomic, strong)UIButton *ThreadBtn;
@end

@implementation ViewController
//响应者链
- (UIViewController *)viewController {
    UIViewController *viewController = nil;
    UIResponder *next = self.nextResponder;
    while (next) {
        if ([next isKindOfClass:[UIViewController class]]) {
            viewController = (UIViewController *)next;
            break;
        }
        next = next.nextResponder;
    }
    return viewController;
    
}
//invoked唤起
//＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊UIView的生存周期＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊//
//- (void)loadView{
//    NSLog(@"loadView");
//    // This is where subclasses should create their custom view hierarchy if they aren't using a nib. Should never be called directly.
//} 
- (void)loadViewIfNeeded{
    [super loadViewIfNeeded];
    NSLog(@"loadViewIfNeeded");
    // Loads the view controller's view if it has not already been set.
}
- (void)viewWillUnload{
    
    NSLog(@"viewWillUnload");
}
- (void)viewDidUnload{
    NSLog(@"viewDidUnload");
    // Called after the view controller's view is released and set to nil. For example, a memory warning which causes the view to be purged. Not invoked as a result of -dealloc.
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Called after the view has been loaded. For view controllers created in code, this is after -loadView. For view controllers unarchived from a nib, this is after the view is set.
    NSLog(@"viewDidLoad");
    [self.view addSubview:self.TestBtnA];
    [self.view addSubview:self.ThreadBtn];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    NSLog(@"viewWillAppear");
    // Called when the view is about to made visible. Default does nothing
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    NSLog(@"viewDidAppear");
    // Called when the view has been fully transitioned onto the screen. Default does nothing
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:YES];
    NSLog(@"viewWillDisappear");
    // Called when the view is dismissed, covered or otherwise hidden. Default does nothing
}
- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear: YES];
    NSLog(@"viewDidDisappear");
    // Called after the view was dismissed, covered or otherwise hidden. Default does nothing
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(UIButton *)TestBtnA{

    if (_TestBtnA == nil) {
        _TestBtnA = [[UIButton alloc]initWithFrame:CGRectMake(100, 200, 60, 60)];
    }
    _TestBtnA.backgroundColor = [UIColor cyanColor];
    [_TestBtnA addTarget:self action:@selector(btnAAction:) forControlEvents:UIControlEventTouchUpInside];
    return _TestBtnA;
}
- (void)btnAAction:(UIButton *)btn{
    LeeRViewController *leeRVC = [[LeeRViewController alloc]init];
    [self.navigationController pushViewController:leeRVC animated:YES];
}
- (UIButton *)ThreadBtn{
    if (_ThreadBtn == nil) {
        _ThreadBtn = [[UIButton alloc]initWithFrame:CGRectMake(200, 400, 80, 80)];
    }
    [_ThreadBtn setTitle:@"操作线程" forState:UIControlStateNormal];
    _ThreadBtn.layer.cornerRadius = 40;
    _ThreadBtn.backgroundColor = [UIColor redColor];
    [_ThreadBtn addTarget:self action:@selector(btnThreadAction:) forControlEvents:UIControlEventTouchUpInside];
    return _ThreadBtn;
}
- (void)btnThreadAction:(UIButton *)btn{
    ANSThreadViewController *NSThVC = [[[NSBundle mainBundle]loadNibNamed:@"ANSThreadViewController" owner:self options:nil] lastObject];
//    [self.navigationController presentViewController:NSThVC animated:YES completion:nil];
    [self.navigationController pushViewController:NSThVC animated:YES];
}
@end
