//
//  NSObject+Observer.m
//  Demo
//
//  Created by JD on 2021/7/16.
//

#import "UIView+Observer.h"
#import <objc/runtime.h>

@implementation UIView (Observer)

- (Observer * _Nonnull (^)(void))observer {
    return ^(){
        return Observer.create(self);
    };
}

@end

