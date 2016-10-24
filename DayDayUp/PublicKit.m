//
//  PublicKit.m
//  LetUsGo
//
//  Created by Li_JinLin on 16/10/22.
//  Copyright © 2016年 Li_JinLin. All rights reserved.
//

#import "PublicKit.h"

static PublicKit *_instance;

@implementation PublicKit
//重写allocWithZone:方法，在这里创建唯一的实例
+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (_instance) {
          _instance = [super allocWithZone:zone];
        }
    });
    return _instance;
}
//提供一个类方法让外界访问唯一实例
+(instancetype)shareInstance{

    static dispatch_once_t onceToken;
    _dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}
//实现copyWithZone:方法
- (id)copyWithZone:(NSZone *)zone{

    return _instance;
}
//dispatch_once_t用来保证线程安全
//可以保证的程序运行过程，一个类只有一个示例，而且该实例易于供外界访问 从而方便地控制了实例个数，并节约系统资源。

@end
