//
//  Observer.m
//  MVVM
//
//  Created by JD on 2021/11/26.
//

#import "Observer.h"
#import "NSNotificationCenter+Observer.h"

@interface Observer ()

@property (nonatomic, copy) ObserverThenBlock thenBlock;
@property (nonatomic, weak) UIView *view;
@property (nonatomic, copy) ObserverListener observerListener;
@property (nonatomic, copy) ObserverMap observerMap;
@end

@implementation Observer {
    Observable *_value;
}

+ (Observer * _Nonnull (^)(UIView *view))create {
    return ^(UIView *view){
        Observer *observer = [[Observer alloc] init];
        observer.view = view;
        if ([view isKindOfClass:[UITextField class]]) {
            /// 监听文本输入变化
            [[NSNotificationCenter defaultCenter] safe_addObserver:observer selector:@selector(textChange:) name:UITextFieldTextDidChangeNotification object:nil];
        }
        return  observer;
    };
}

- (Observer * _Nonnull (^)(Observable * _Nonnull value))subscribe {
    return ^(Observable *value){
        self.value = value;
        return self;
    };
}


- (Observer * _Nonnull (^)(ObserverMap _Nonnull))map {
    return ^(ObserverMap observerMap){
        self.observerMap = observerMap;
        return self;
    };
}

- (Observer * _Nonnull (^)(ObserverThenBlock _Nonnull then))then {
    return ^(ObserverThenBlock then){
        then(self.view,[self mapValue]);
        self.thenBlock = then;
        return self;
    };
}

#pragma mark ---- 私有方法
- (void)setValue:(Observable *)value {
    _value = value;
    [self renderUI];
    __weak Observer *observer = self;
    [value addObserver:^{
        if (observer == nil) {
            return;
        }
        ObserverThenBlock then = observer.thenBlock;
        if (then != nil) {
            then(observer.view,[self mapValue]);
        } else {
            [self renderUI];
        }
    }];
}

- (Observable *)value {
    return _value;
}

- (Observer * _Nonnull (^)(ObserverListener _Nonnull))listener {
    return ^(ObserverListener observerListener){
        self.observerListener = observerListener;
        return self;
    };
}


/// 渲染UI
- (void)renderUI {
    id obj = [self mapValue];
    if ([obj isKindOfClass:[NSString class]]) {
        if ([self.view isKindOfClass:[UILabel class]]) {
            UILabel *lb = (UILabel *)self.view;
            lb.text = obj;
        } else if ([self.view isKindOfClass:[UITextField class]]) {
            UITextField *lb = (UITextField *)self.view;
            lb.text = obj;
        }
    }
}

/// map 对象转换
- (id)mapValue {
    if (self.observerMap != nil) {
        return self.observerMap(self.value.value);
    }
    return self.value.value;
}


#pragma mark ----- textfield监听
- (void)textChange:(id)notification {
    UITextField *textField = (UITextField *)self.view;
    if ([self.value isKindOfClass:[NSString class]]) {
        self.value.value = textField.text;
    } else {
        self.observerListener(self.value.value,textField.text);
        [self.value notify];
    }
}

@end
