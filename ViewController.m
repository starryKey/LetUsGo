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
@interface ViewController ()

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
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"hello");
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
