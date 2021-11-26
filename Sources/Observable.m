//
//  Observable.m
//  MVVM
//
//  Created by JD on 2021/11/25.
//

#import "Observable.h"

@interface _ListenerEntry : NSObject
@property (nonatomic, copy) VoidCallback listener;
+ (instancetype)listener:(VoidCallback)listener;
@end
@implementation _ListenerEntry
+ (instancetype)listener:(VoidCallback)listener {
    _ListenerEntry *entry = [[_ListenerEntry alloc] init];
    entry.listener = listener;
    return entry;
}
@end

#pragma mark ----------------

@interface Observable ()

@property (nonatomic, strong) NSMutableArray *observers;

@end

@implementation Observable {
    id _value;
}

#pragma mark ----- 监听逻辑
- (NSMutableArray *)observers {
    if (_observers == nil) {
        _observers = [NSMutableArray array];
    }
    return  _observers;
}

- (bool)hasObserver {
    return self.observers.count > 0;
}

/// 添加观察者
- (void)addObserver:(VoidCallback)listener {
    [self.observers addObject:[_ListenerEntry listener:listener]];
}

/// 移除观察者
- (void)removeObserver:(VoidCallback)listener {
    _ListenerEntry *_willDeleteEntry = nil;
    for (_ListenerEntry *entry in _observers) {
        if (entry.listener == listener) {
            _willDeleteEntry = entry;
            break;;
        }
    }
    [self.observers removeObject:_willDeleteEntry];
}

/// 通知观察者们数据变化了
- (void)notify {
    if (self.observers.count == 0) {
        return;
    }
    for (_ListenerEntry *entry in self.observers) {
        if (entry.listener != nil) {
            entry.listener();
        }
    }
}

- (void)dealloc {
    _observers = nil;
}


#pragma mark ---- 数据转换
+ (Observable * _Nonnull (^)(id _Nonnull))create {
    return ^(id value){
        Observable *observable = [[Observable alloc] init];
        observable.value = value;
        return  observable;
    };
}

- (void)setValue:(id)value {
    if (value != _value) {
        _value = value;
        [self notify];
    }
}

- (id)value {
    return _value;
}

@end
