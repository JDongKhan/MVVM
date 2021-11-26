# MVVM

### 这是一款轻量级MVVM订阅组件

MVVM是一个常用的设计思想，其核心思想就是view和model的双向绑定，即model变化及时体现在view上，view变化也同步到model上，而在iOS端没有提供标准的组件来满足其能力，此处就设计了一款精简版的试试水。



**使用方式**

**初级**

```objc
1、声明Observable对象
	@property (nonatomic, strong) Observable *name;
	self.name = Observable.create(@"哈哈哈哈");

2、导入组件库
  #import <MVVM/MVVM.h>
  
3、view订阅Observable
  self.countLabel.observer().subscribe(self.name)
```

这样就将view和变量绑定，当变量发生变化时label内容可直接变化

**进阶**

```
1、声明Observable对象
	@property (nonatomic, strong) Observable *user;
	self.user = Observable.create([[User alloc] init]);

2、导入组件库
  #import <MVVM/MVVM.h>
  
3、view订阅Observable
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
```



因自定义model复杂，所以双向绑定需要使用map来将数据转换成合适的格式给view，而view需要通过listener转换成model一个字段



这样就可通过下面的方法更改model，从而达到自动更改样式

```
- (void)changInfo {
    self.name.value = @"22222";
    // 如果是对象，则无法监听对象里面的属性的变化，那就自己去调用notifyListeners通知吧
    User *user = self.user.value;
    user.name = @"22222";
    [self.user notify];
}
```



