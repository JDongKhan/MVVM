//
//  NSNotificationCenter+Observer.h
//  MVVM
//
//  Created by JD on 2020/11/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSNotificationCenter (Observer)

- (void)safe_addObserver:(id)observer selector:(SEL)aSelector name:(NSNotificationName)aName object:(_Nullable id)anObject;

@end

NS_ASSUME_NONNULL_END
