//
//  NSMutableDictionary+Safe.m
//  军考
//
//  Created by 田云龙 on 2020/8/3.
//  Copyright © 2020 Countury. All rights reserved.
//

#import "NSMutableDictionary+Safe.h"
#import "NSObject+ImpChangeTool.h"

@implementation NSMutableDictionary (Safe)

+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self SwizzlingMethod:@"st_removeObjectForKey:" systemClassString:@"NSMutableDictionary" toSafeMethodString:@"removeObjectForKey:" targetClassString:@"__NSDictionaryM"];
        [self SwizzlingMethod:@"st_setObject:forKey:" systemClassString:@"NSMutableDictionary" toSafeMethodString:@"setObject:forKey:" targetClassString:@"__NSDictionaryM"];
    });
}
- (void)st_removeObjectForKey:(id)key {
    if (!key) {
        return;
    }
    [self st_removeObjectForKey:key];
}
- (void)st_setObject:(id)obj forKey:(id <NSCopying>)key {
    if (!obj) {
        return;
    }
    if (!key) {
        return;
    }
    [self st_setObject:obj forKey:key];
}

@end
