//
//  ThirdViewController.m
//  ChildThread_One
//
//  Created by zhifu360 on 2018/9/3.
//  Copyright © 2018年 智富金融. All rights reserved.
//

#import "ThirdViewController.h"
#import "CustomThread.h"

#define NUM 10

@interface ThirdViewController ()

///线程对象
@property (nonatomic) CustomThread *thread;

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"%s", __FUNCTION__);
    
    //开启子线程
    CustomThread *thread = [[CustomThread alloc] initWithTarget:self selector:@selector(handleThread) object:nil];
    thread.name = @"子线程C";
    [thread start];
    _thread = thread;
}

- (void)handleThread {
    for (int i = 0; i < NUM; i ++) {
        NSLog(@"i = %d, %@", i, _thread.name);
    }
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
