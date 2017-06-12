//
//  NSThreadViewController.m
//  LetUsGo
//
//  Created by Li_JinLin on 16/12/1.
//  Copyright © 2016年 Li_JinLin. All rights reserved.
//

#import "NSThreadViewController.h"

@interface NSThreadViewController ()
@property (nonatomic, strong)UIButton *btn;
@property (nonatomic, strong)UIImageView *imgView;
@end

@implementation NSThreadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 60, 60)];
    [_btn setTitle:@"下载" forState:UIControlStateNormal];
    _btn.backgroundColor = [UIColor orangeColor];
    [_btn addTarget:self action:@selector(startDownload:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btn];
    _imgView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 240, 100, 180)];
    [self.view addSubview:_imgView];
    
}
- (void)startDownload:(UIButton *)btn{
    [self performSelectorInBackground:@selector(lownLoadImg) withObject:nil];
}
- (void)lownLoadImg{
    
    NSLog(@"当前线程A%@", [NSThread currentThread]);
    NSString *strUrl = @"http://www.zhimengzhe.com/d/file/p/2016-11-04/210e256e7af24572919fdb7a3751db9e.jpg";//@"http://www.itcast.cn/images/logo.png";http://www.zhimengzhe.com/d/file/p/2016-11-04/210e256e7af24572919fdb7a3751db9e.jpg
    NSURL *url = [NSURL URLWithString:strUrl];
    NSData *data= [NSData dataWithContentsOfURL:url];
    UIImage *img = [UIImage imageWithData:data];
    if (img != nil) {
        [self performSelectorOnMainThread:@selector(showImgView:) withObject:img waitUntilDone:NO];//当为no时不会阻塞线程
    } else {
        NSLog(@"下载出错！");
    }

    
}
- (void)showImgView:(UIImage *)image{
    
    _imgView.image = image;
    NSLog(@"当前线程B%@", [NSThread currentThread]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
