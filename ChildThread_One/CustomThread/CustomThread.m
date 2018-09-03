//
//  CustomThread.m
//  ChildThread_One
//
//  Created by zhifu360 on 2018/9/3.
//  Copyright © 2018年 智富金融. All rights reserved.
//

#import "CustomThread.h"

@implementation CustomThread

- (void)dealloc
{
    NSLog(@"%@销毁", self.name);
}

@end
