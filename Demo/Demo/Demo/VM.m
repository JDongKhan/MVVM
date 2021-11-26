//
//  VM.m
//  Demo
//
//  Created by JD on 2021/11/25.
//

#import "VM.h"
#import <MVVM/MVVM.h>
#import "User.h"

@interface VM ()

@property (nonatomic, strong) Observable *name;
@property (nonatomic, strong) Observable *age;
@property (nonatomic, strong) Observable *user;

@end

@implementation VM


- (void)initInfo {
    self.name = Observable.create(@"哈哈哈哈");
    self.age = Observable.create(@1);
    self.user = Observable.create([[User alloc] init]);
    
    //绑定label
    self.countLabel.observer().subscribe(self.name);
    //绑定textfield
    self.textField
    .observer()
    .subscribe(self.user)
    .map(^(User *value){
        //数据转换成合适的给view
        return value.name;
    }).then(^(UITextField * _Nonnull view, id value) {
        //可进行复杂样式处理
        NSString *v = value;
        if ([v isEqualToString:@"22222"]) {
            view.backgroundColor = [UIColor redColor];
        } else {
            view.backgroundColor = [UIColor blueColor];
        }
        view.text = v;
    }).listener(^(User *u,id content) {
        //此处可以监听控件的变化，及时映射到model上
        u.name = content;
        NSLog(@"content:%@",content);
    });
//    u.name = content;
//    NSLog(@"content:%@",content);
//    self.textField
//    .observer()
//    .subscribe(self.user)
//    .handle(^(UITextField * _Nonnull view, ValueWrapper * _Nonnull value) {
//        NSString *v = value.value;
//        if ([v isEqualToString:@"22222"]) {
//            view.backgroundColor = [UIColor redColor];
//        } else {
//            view.backgroundColor = [UIColor blueColor];
//        }
//        view.text = v;
//    });
//
}

- (void)changInfo {
    self.name.value = @"22222";
    // 如果是对象，则无法监听对象里面的属性的变化，那就自己去调用notifyListeners通知吧
    User *user = self.user.value;
    user.name = @"22222";
    [self.user notify];
}


@end
