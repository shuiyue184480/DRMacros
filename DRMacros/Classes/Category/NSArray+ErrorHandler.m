//
//  NSArray+ErrorHandler.m
//  81FamilyExamination
//
//  Created by 田云龙 on 2019/12/10.
//  Copyright © 2019 田云龙. All rights reserved.
//

#import "NSArray+ErrorHandler.h"
#import "NSObject+ImpChangeTool.h"


@implementation NSArray (ErrorHandler)

- (id)objectAtIndexCheck:(NSUInteger)index{
    if (index >= [self count]) {
        return nil;
    }
    id value = [self objectAtIndex:index];
    if (value == [NSNull null]) {
        return nil;
    }
    return value;
}

+ (void)load{
    static dispatch_once_t onceDispatch;
    dispatch_once(&onceDispatch, ^{
        [self SwizzlingMethod:@"objectAtIndex:" systemClassString:@"__NSArrayI" toSafeMethodString:@"st_objectAtIndex:" targetClassString:@"NSArray"];
        
         [self SwizzlingMethod:@"initWithObjects:count:" systemClassString:@"__NSPlaceholderArray" toSafeMethodString:@"initWithObjects_st:count:" targetClassString:@"NSArray"];
        [self SwizzlingMethod:@"arrayByAddingObject:" systemClassString:@"__NSArrayI" toSafeMethodString:@"arrayByAddingObject_st:" targetClassString:@"NSArray"];
    });
}
- (id)st_objectAtIndex:(NSUInteger)index{
    //判断数组是否越界
    if (index >= [self count]) {
        return nil;
    }
    return [self st_objectAtIndex:index];
}
- (NSArray *)arrayByAddingObject_st:(id)anObject {
    if (!anObject) {
        return self;
    }
    return [self arrayByAddingObject_st:anObject];
}
- (instancetype)initWithObjects_st:(id *)objects count:(NSUInteger)count {
    NSUInteger newCount = 0;
    for (NSUInteger i = 0; i < count; i++) {
        if (!objects[i]) {
            break;
        }
        newCount++;
    }
    self = [self initWithObjects_st:objects count:newCount];
    return self;
}
@end
