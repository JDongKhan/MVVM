//
//  NSObject+Observer.h
//  MVVM
//
//  Created by JD on 2021/7/16.
//

#import <UIKit/UIKit.h>
#import "Observer.h"

NS_ASSUME_NONNULL_BEGIN


@interface UIView (Observer)

@property (nonatomic, strong, readonly) Observer *(^observer)(void);

@end

NS_ASSUME_NONNULL_END
