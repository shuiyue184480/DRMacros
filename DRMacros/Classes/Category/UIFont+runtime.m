//
//  UIFont+runtime.m
//  BYFamily
//
//  Created by 田云龙 on 2019/5/21.
//  Copyright © 2019 田云龙. All rights reserved.
//

#import "UIFont+runtime.h"

@implementation UIFont (runtime)
+ (void) load{
    Method   newMethod =  class_getClassMethod([self class],@selector (adjustFont:));
    // 获取替换前的类方法
    Method method = class_getClassMethod([self class], @selector(systemFontOfSize:));
    // 然后交换类方法，交换两个方法的IMP指针，(IMP代表了方法的具体的实现）
    method_exchangeImplementations(newMethod, method);
    
//    Method   nowMethod =  class_getClassMethod([self class],@selector (adjustFontAddWeight:));
//    // 获取替换前的类方法
//    Method OldMethod = class_getClassMethod([self class], @selector(systemFontOfSize:weight:));
//    // 然后交换类方法，交换两个方法的IMP指针，(IMP代表了方法的具体的实现）
//    method_exchangeImplementations(nowMethod, OldMethod);
    Method   blodNewMethod =  class_getClassMethod([self class],@selector (adjustBoldFont:));

    // 获取替换前的类方法
    Method boldOldMethod = class_getClassMethod([self class], @selector(boldSystemFontOfSize:));
    // 然后交换类方法，交换两个方法的IMP指针，(IMP代表了方法的具体的实现）
    method_exchangeImplementations(blodNewMethod, boldOldMethod);
}

+ (UIFont *) adjustFont:(CGFloat)fontSize{
    UIFont *newFont = nil;
    newFont = [UIFont adjustFont:fontSize * DRRatio];
    return newFont;
}

+(UIFont *) adjustBoldFont:(CGFloat)fontSize{
    UIFont *newFont = nil;
    newFont = [UIFont adjustBoldFont:fontSize * DRRatio];
    return newFont;
    
}

+ (UIFont *)adjustFontAddWeight:(CGFloat)fontSize{
    UIFont *newFont = nil;
    newFont = [UIFont adjustFontAddWeight:fontSize * DRRatio];
    return newFont;

}
@end
