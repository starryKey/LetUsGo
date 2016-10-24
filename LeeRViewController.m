//
//  LeeRViewController.m
//  LetUsGo
//
//  Created by Li_JinLin on 16/10/25.
//  Copyright © 2016年 Li_JinLin. All rights reserved.
//

#import "LeeRViewController.h"
#import "ViewController.h"
@interface LeeRViewController ()

@end

@implementation LeeRViewController

//invoked唤起
//＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊UIView的生存周期＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊//
- (void)loadView{
    
    NSLog(@"loadView-B");
    // This is where subclasses should create their custom view hierarchy if they aren't using a nib. Should never be called directly.
}
- (void)loadViewIfNeeded{
    [super loadViewIfNeeded];
    NSLog(@"loadViewIfNeeded-B");
    // Loads the view controller's view if it has not already been set.
}
- (void)viewWillUnload{
    
    NSLog(@"viewWillUnload-B");
}
- (void)viewDidUnload{
    NSLog(@"viewDidUnload-B");
    // Called after the view controller's view is released and set to nil. For example, a memory warning which causes the view to be purged. Not invoked as a result of -dealloc.
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Called after the view has been loaded. For view controllers created in code, this is after -loadView. For view controllers unarchived from a nib, this is after the view is set.
    NSLog(@"hello - B");
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    NSLog(@"viewWillAppear - B");
    // Called when the view is about to made visible. Default does nothing
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    NSLog(@"viewDidAppear - B");
    // Called when the view has been fully transitioned onto the screen. Default does nothing
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:YES];
    NSLog(@"viewWillDisappear- B ");
    // Called when the view is dismissed, covered or otherwise hidden. Default does nothing
}
- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear: YES];
    NSLog(@"viewDidDisappear - B");
    // Called after the view was dismissed, covered or otherwise hidden. Default does nothing
}

//*****************************************总结***********************************************/

/*
 视图的加载方式
 
 UIViewController采用懒加载的方式，也就是说第一次访问到view属性时才会加载或创建它。由于视图由视图控制器管理，所以讨论视图的加载方式时，主要讨论视图控制器的加载方式。
 
 通过Storyboard加载：这是苹果推荐的方式，也是未来的趋势。
 
 通过这种方式创建UIViewController对象的话，首先生成UIStoryboard类型的对象，然后调用这个对象的instantiateViewControllerWithIdentifier:方法
 
 通过Nib文件加载：
 
 Nib文件其实就是xib文件，Storyboard相当于是聚合了多个nib文件，并且添加了对不同的UIViewController之间的segue和relationship的管理。但总的实现原理非常类似
 
 通过这种方式加载视图,需要调用UIViewController类的initWithNibName:bundle:方法
 
 通过loadview方法加载：
 这就是通过代码加载。这需要我们在loadView 方法中，通过编程创建自己的视图层次，并且把把根视图赋值给UIViewController的view属性。
 
 因此，通过代码自定义View的时候，loadView 方法大概是这样的：
 
 - (void)loadView{
 self.view = [[XXXView alloc] init];
 }
 */
/*
 在运行时展示View
 
 UIKit极大的简化了加载和展示View的过程，它大概会按照以下顺序执行一些任务：
 
 通过storyboard文件中的信息实例化视图
 
 连接outlet和action
 
 把根视图赋值给UIViewController的view属性（其实就是调用loadView 方法）
 
 调用UIViewController的awakeFromNib方法。要注意，在调用方法前，的trait collecion为空且子视图的位置可能不正确
 
 调用UIViewController的viewDidLoad方法。
 
 此时已经完成了视图的加载工作，在展示到屏幕之前，还有以下几个步骤：
 
 调用UIViewController的viewWillAppear方法。
 
 更新视图的布局
 
 把视图展示到屏幕上
 
 调用UIViewController的viewDidAppear方法。
 
 awakeFromNib方法
 
 至此，第一个问题已经几乎解释完了，还剩一个awakeFromNib方法。
 
 我们已经知道，awakeFromNib方法被调用时，所有视图的outlet和action已经连接，但还没有被确定。这个方法可以算作是和视图控制器的实例化配合在一起使用的，因为有些需要根据用户喜好来进行设置的内容，无法存在storyboard中，所以可以在awakeFromNib方法中被加载进来。
 
 awakeFromNib方法在视图控制器的生命周期内只会被调用一次。因为它和视图控制器从nib文件中的解档密切相关，和view的关系却不大。
 
 具体方法的解释
 
 loadView方法
 
 当执行到loadView方法时，视图控制器已经从nib文件中被解档并创建好了，接下来的任务主要是对view进行初始化。
 
 loadView方法在UIViewController对象的view属性被访问到且为空的时候调用。
 这是它与awakeFromNib方法的一个区别。假设我们在处理内存警告时释放view属性（其实并不应该这么做，这里举个例子）：self.view = nil。因此loadView方法在视图控制器的生命周期内可能会被多次调用。
 
 这个方法不应该被直接调用，而是由系统自动调用。它会加载或创建一个view并把它赋值给UIViewController的view属性。
 
 在创建view的过程中，首先会根据nibName去找对应的Nib文件然后加载。如果nibName为空，或找不到对应的Nib文件，则会创建一个空视图(这种情况一般是纯代码，也就是为什么说代码构建View的时候，要重写loadView 方法)。
 
 注意在重写loadView方法的时候，不要调用父类的方法。
 
 viewDidLoad方法
 
 loadView方法执行完之后，就会执行viewDidLoad方法。此时整个视图层次(view hierarchy)已经被放到内存中。
 
 无论是从nib文件加载，还是通过纯代码编写界面，viewDidLoad方法都会执行。我们可以重写这个方法，对通过nib文件加载的view做一些其他的初始化工作。比如可以移除一些视图，修改约束，加载数据等。
 
 viewWillAppear和viewDidAppear方法
 
 在视图加载完成，并即将显示在屏幕上时，会调用viewWillAppear方法，在这个方法里，可以改变当前屏幕方向或状态栏的风格等。
 
 当viewWillAppear方法执行完后，系统会执行viewDidAppear方法。在这个方法中，还可以对视图做一些关于展示效果方面的修改。
 
 视图的生命历程
 
 到目前为止，我们已经了解了每个方法的作用，接下来就把整个流程梳理一遍。
 
 -[ViewController initWithCoder:]或-[ViewController initWithNibName:Bundle]:首先从归档文件中加载UIViewController对象。即使是纯代码，也会把nil作为参数传给后者。
 
 -[UIView awakeFromNib]:作为第一个方法的助手，方便处理一些额外的设置。
 
 -[ViewController loadView]:创建或加载一个view并把它赋值给UIViewController的view属性
 
 -[ViewController viewDidLoad]:此时整个视图层次(view hierarchy)已经被放到内存中，可以移除一些视图，修改约束，加载数据等
 
 -[ViewController viewWillAppear:]:视图加载完成，并即将显示在屏幕上,还没有设置动画，可以改变当前屏幕方向或状态栏的风格等。
 
 -[ViewController viewWillLayoutSubviews]：即将开始子视图位置布局
 
 -[ViewController viewDidLayoutSubviews]：用于通知视图的位置布局已经完成
 
 -[ViewController viewDidAppear:]：视图已经展示在屏幕上，可以对视图做一些关于展示效果方面的修改。
 
 -[ViewController viewWillDisappear:]：视图即将消失
 
 -[ViewController viewDidDisappear:]：视图已经消失
 
 如果考虑UIViewController可能在某个时刻释放整个view。那么再次加载视图时显然会从步骤3开始。因为此时的UIViewController对象依然存在。
 
 总结
 
 只有init系列的方法,如initWithNibName需要自己调用，其他方法如loadView和awakeFromNib则是系统自动调用。而viewWill/Did系列的方法则类似于回调和通知，也会被自动调用。
 
 纯代码写视图布局时需要注意，要手动调用loadView方法，而且不要调用父类的loadView方法。纯代码和用IB的区别仅存在于loadView方法及其之前，编程时需要注意的也就是loadView方法。
 
 除了initWithNibName和awakeFromNib方法是处理视图控制器外，其他方法都是处理视图。这两个方法在视图控制器的生命周期里只会调用一次。
 */
//http://www.cnblogs.com/mddblog/p/4556988.html
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    //处理内存警告时，可能会释放view self.view = nil
    
}

@end
