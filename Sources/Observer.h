//
//  Observer.h
//  MVVM
//
//  Created by JD on 2021/11/26.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Observable.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^ObserverThenBlock)(id view,id value) ;
typedef void(^ObserverListener)(id value,id content) ;
typedef _Nonnull id(^ObserverMap)(id value) ;

@interface Observer : NSObject

/// 创建一个观察者
@property (nonatomic, copy, readonly, class) Observer *(^create)(UIView *view);

/// 订阅
@property (nonatomic, copy ,readonly) Observer *(^subscribe)(Observable *value);

/// 将数据进行转换
@property (nonatomic, copy, readonly) Observer *(^map)(ObserverMap map);

/// 订阅触发事件会执行该方法
@property (nonatomic, copy ,readonly) Observer *(^then)(ObserverThenBlock then);

/// Observable
@property (nonatomic, strong, readonly) Observable *value;

/// 监听数据源变化情况，如果变化了，可在此决定数据存放在哪
@property (nonatomic, copy, readonly) Observer *(^listener)(ObserverListener observerListener);

@end

NS_ASSUME_NONNULL_END
