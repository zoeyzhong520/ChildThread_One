//
//  TabBarViewController.m
//  ChildThread_One
//
//  Created by zhifu360 on 2018/9/3.
//  Copyright © 2018年 智富金融. All rights reserved.
//

#import "TabBarViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createViewControllers];
}

- (void)createViewControllers {
    FirstViewController *firstVC = [FirstViewController new];
    firstVC.title = @"first";
    UINavigationController *firstNav = [[UINavigationController alloc] initWithRootViewController:firstVC];
    
    SecondViewController *secondVC = [SecondViewController new];
    secondVC.title = @"second";
    UINavigationController *secondNav = [[UINavigationController alloc] initWithRootViewController:secondVC];
    
    ThirdViewController *thirdVC = [ThirdViewController new];
    thirdVC.title = @"third";
    UINavigationController *thirdNav = [[UINavigationController alloc] initWithRootViewController:thirdVC];
    
    FourthViewController *fourthVC = [FourthViewController new];
    fourthVC.title = @"fourth";
    UINavigationController *fourthNav = [[UINavigationController alloc] initWithRootViewController:fourthVC];
    
    self.viewControllers = @[firstNav,secondNav,thirdNav,fourthNav];
    
    //TabBarItem
    UITabBarItem *firstItem = [[UITabBarItem alloc] initWithTitle:firstVC.title image:[UIImage imageNamed:@"activity"] selectedImage:[UIImage imageNamed:@"activity"]];
    
    UITabBarItem *secondItem = [[UITabBarItem alloc] initWithTitle:secondVC.title image:[UIImage imageNamed:@"activity"] selectedImage:[UIImage imageNamed:@"activity"]];
    
    UITabBarItem *thirdItem = [[UITabBarItem alloc] initWithTitle:thirdVC.title image:[UIImage imageNamed:@"activity"] selectedImage:[UIImage imageNamed:@"activity"]];
    
    UITabBarItem *fourthItem = [[UITabBarItem alloc] initWithTitle:fourthVC.title image:[UIImage imageNamed:@"activity"] selectedImage:[UIImage imageNamed:@"activity"]];
    
    firstNav.tabBarItem = firstItem;
    secondNav.tabBarItem = secondItem;
    thirdNav.tabBarItem = thirdItem;
    fourthNav.tabBarItem = fourthItem;
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
