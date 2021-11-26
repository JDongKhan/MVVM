//
//  Observable.h
//  MVVM
//
//  Created by JD on 2020/11/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^VoidCallback)(void) ;

/// 可被观察对象
@interface Observable : NSObject

/// 创建一个被观察者
@property (nonatomic, copy, readonly, class) Observable *(^create)(id value);

/// 是否有观察者
@property (nonatomic, assign, readonly) bool hasObserver;

/// 原始值
@property (nonatomic, strong, nullable) id value;

/// 添加观察者
- (void)addObserver:(VoidCallback)listener;

/// 移除观察者
- (void)removeObserver:(VoidCallback)listener;

///通知观察者们数据变化了
- (void)notify;

@end

NS_ASSUME_NONNULL_END
