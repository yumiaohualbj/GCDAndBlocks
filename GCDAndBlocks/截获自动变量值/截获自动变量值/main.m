//
//  main.m
//  截获自动变量值
//
//  Created by 信达 on 2018/4/11.
//  Copyright © 2018年 信达. All rights reserved.
//

#import <Foundation/Foundation.h>

int main() {
    int dmy = 256;
    int val = 10;
    const char * fmt = "val = %d\n";
    void (^blk)(void) = ^{
        printf(fmt,val);
    };
    val = 2;
    fmt = "These values were changed. val = %d\n";
    blk();
    return 0;
    
}
