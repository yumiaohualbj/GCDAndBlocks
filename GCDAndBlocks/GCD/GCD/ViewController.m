//
//  ViewController.m
//  GCD
//
//  Created by 信达 on 2018/4/11.
//  Copyright © 2018年 信达. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //获取searial线程
//    dispatch_queue_t mainDsipatchQueue = dispatch_get_main_queue();
//    dispatch_queue_t globalDispatchQueueHigh = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
//    dispatch_queue_t globalDispatchQueueDefault = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    dispatch_queue_t globalDispatchQueueLow = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0);
//    dispatch_queue_t globalDispatchQueueBackground = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    
    
//--------------dispatch_set_target_queue 变更优先级---------------------
    
//    dispatch_queue_t mySerialDisPatchQueue = dispatch_queue_create("com.example.gcd.mySerialDisPatchQueue", NULL);
//    dispatch_queue_t globalDispatchQueueBack = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
//    dispatch_set_target_queue(mySerialDisPatchQueue, globalDispatchQueueBack);
    
// ---------------------dispatch_after--------------------
//
//    NSLog(@"hshkslkljsjkls");
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        NSLog(@"wait at least three seconds");
//    });
    
//---------------dispatch_walltime 计算绝对时间---------------
    
    
//----------------------dispatch Group--------------------------
    
    
    dispatch_queue_t queue1 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_async(group, queue1, ^{
        NSLog(@"currentThread = %@",[NSThread currentThread]);
        NSLog(@"blk0");
    });
    dispatch_group_async(group, queue1, ^{
        NSLog(@"currentThread = %@",[NSThread currentThread]);
        NSLog(@"blk1");
    });
    dispatch_group_async(group, queue1, ^{
        NSLog(@"currentThread = %@",[NSThread currentThread]);
        NSLog(@"blk2");
    });
//    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
//        NSLog(@"currentThread = %@",[NSThread currentThread]);
//        NSLog(@"done");
//    });
    
    dispatch_group_wait(group,DISPATCH_TIME_FOREVER);
    
    
// --------------dispatch_barrier_async------------
    
    
//-------------dispatch_apply------------------
    
//------------------dispatch_suspend(queue) 挂起------------------
//-------------------dispatch_resume(queue) 恢复----------------
//---------------dispatch_one----------
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSLog(@"代码只执行一次");
    });
    
 //-------------------dispatch I/O----------------
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
