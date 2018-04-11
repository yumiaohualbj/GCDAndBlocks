//
//  ViewController.m
//  Blocks
//
//  Created by 信达 on 2018/4/11.
//  Copyright © 2018年 信达. All rights reserved.
//

#import "ViewController.h"
typedef void(^testBlock)(int count);
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    int (^blk)(int) = ^(int count){
        return count + 1;
    };
    int (^blk1)(int) = blk;
    NSLog(@"%d",blk1(2));
    int (^blk12)(int);
    blk12 = blk1;
    
   __block int  val = 5;
    //block作为参数传递
    [self func:^(int count) {
        val = count;
        NSLog(@"val = %d",val);
    }];
    testBlock tblk = [self returnBlockFunc];
    tblk(20);
  
    //截获的自动变量
    //截获Object-C对象,调用变更该对象的方法也会昌盛编译错误么
    id array = [[NSMutableArray alloc]init];
    void (^testArrayBlk)(void) = ^{
        id obj = [[NSObject alloc]init];
        [array addObject:obj];
    };
    
    testArrayBlk();
    NSLog(@"array = %@",array);
    
    //第二种情况 直接赋值  (missing __ block type specifier)
//    id array1 = [[NSMutableArray alloc]init];
//
//    void (^testArrayBlk1)(void) = ^{
//        array1 = [[NSMutableArray alloc]init];
//    };
    
      __block  id array1 = [[NSMutableArray alloc]init];
    
        void (^testArrayBlk1)(void) = ^{
            array1 = [[NSMutableArray alloc]init];
        };
        testArrayBlk1();
    NSLog(@"array1 = %@",array1);
    
}
- (void)func:(testBlock)success{
    int count = 10;
    NSLog(@"block作为参数 count=%d",count);
    success(count);
}

- (testBlock)returnBlockFunc{
    void (^testblk)(int count) = ^(int count){
        NSLog(@"block作为返回值 count=%d",count);
    };
 
    
    return testblk;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
