//
//  main.m
//  自动引用计数
//
//  Created by 信达 on 2018/4/10.
//  Copyright © 2018年 信达. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    id allocObject = [[NSObject alloc]init];
    NSLog(@"alloc=%ld",[allocObject retainCount]);
    
    id newObject = [NSObject new];
    NSLog(@"new=%ld",[newObject retainCount]);
    
    [allocObject release];
    //NSLog(@"alloc=%ld",[allocObject retainCount]);
    
}
