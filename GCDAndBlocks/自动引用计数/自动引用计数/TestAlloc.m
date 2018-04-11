//
//  TestAlloc.m
//  自动引用计数
//
//  Created by 信达 on 2018/4/10.
//  Copyright © 2018年 信达. All rights reserved.
//

#import "TestAlloc.h"

struct obj_layout{
    NSUInteger retained;
};

@implementation TestAlloc
+(id)alloc{
    return [self allocWithZone:NSDefaultMallocZone()];
}

//+(id)alloc{
//    int size = sizeof(struct obj_layout);
//    struct obj_layout *p =(struct obj_layout *) calloc(1, size);
//    return (id)(p + 1);
//}

+(id)allocWithZone:(struct _NSZone *)zone{
    return NSAllocateObject(self, 0, zone);
}

- (id)retain{
    NSIncrementExtraRefCount(self);
    return self;
}

//inline void NSIncrementExtraRefCount(id anObject){
//    if ((struct obj_layout *)anObject)[-1].retained == UINT_MAX - 1 [NSException rasie:NSInternalInconsistencyException format:@"NSIncrementExtraRefCount() ask to increment too far"]
//}

@end
