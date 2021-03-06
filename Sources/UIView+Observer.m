//
//  NSObject+Observer.m
//  MVVM
//
//  Created by JD on 2020/7/16.
//

#import "UIView+Observer.h"

@implementation UIView (Observer)

- (Observer * _Nonnull (^)(void))observer {
    return ^(){
        return Observer.create(self);
    };
}

@end

