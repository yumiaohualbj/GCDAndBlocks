//
//  main.m
//  Blocks实现
//
//  Created by 信达 on 2018/4/11.
//  Copyright © 2018年 信达. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    void (^blk)(void) = ^{
        printf("Blocks");
    };
    blk();
    return 0;
}
