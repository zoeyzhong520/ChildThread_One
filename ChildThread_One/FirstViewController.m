//
//  FirstViewController.m
//  ChildThread_One
//
//  Created by zhifu360 on 2018/9/3.
//  Copyright © 2018年 智富金融. All rights reserved.
//

#import "FirstViewController.h"
#import "CustomThread.h"

#define NUM 10

@interface FirstViewController ()

///线程对象
@property (nonatomic) CustomThread *thread;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"%s", __FUNCTION__);
    
    //开启子线程
    CustomThread *thread = [[CustomThread alloc] initWithTarget:self selector:@selector(handleThread) object:nil];
    thread.name = @"子线程A";
    [thread start];
    _thread = thread;
}

- (void)handleThread {
//    for (int i = 0; i < NUM; i ++) {
//        NSLog(@"i = %d, %@", i, _thread.name);
//    }
    
    //GCD串行队列 实现串行任务
    dispatch_queue_t queue = dispatch_queue_create("com.fw.queue", DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        sleep(1);
        NSLog(@"任务1 thread:%@", [NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        sleep(1);
        NSLog(@"任务2 thread:%@", [NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        sleep(1);
        NSLog(@"任务3 thread:%@", [NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        dispatch_sync(dispatch_get_main_queue(), ^{
           NSLog(@"任务执行完毕，回到主线程 thread:%@",[NSThread currentThread]);
        });
    });
    
    NSLog(@"结束");
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    NSLog(@"%s", __FUNCTION__);
    NSLog(@"%@", _thread);
    [_thread cancel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
