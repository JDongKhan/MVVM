//
//  NSNotificationCenter+Observer.m
//  Demo
//
//  Created by JD on 2021/11/25.
//

#import "NSNotificationCenter+Observer.h"
#import <objc/runtime.h>

@interface SafeNotifition : NSObject
@property (nonatomic, strong) NSString *token;
@property (nonatomic, strong) NSNotificationCenter *center;
@property (nonatomic, weak) id observe;
@end


@implementation SafeNotifition

- (void)dealloc {
    if (self.center && self.token) {
        [self.center removeObserver:self.observe
                               name:self.token
                             object:nil];
    }
    
}

@end


@implementation NSNotificationCenter (Observer)

- (void)safe_addObserver:(id)observer selector:(SEL)aSelector name:(NSNotificationName)aName object:(_Nullable id)anObject {
    SafeNotifition *token = [SafeNotifition new];
    token.center = self;
    token.token = aName;
    token.observe = observer;
    objc_setAssociatedObject(observer, aName.UTF8String, token, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self addObserver:observer
               selector:aSelector
                   name:aName object:anObject];
}

@end
