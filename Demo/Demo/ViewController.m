//
//  ViewController.m
//  Demo
//
//  Created by JD on 2020/5/13.
//

#import "ViewController.h"
#import <MVVM/UIView+Observer.h>
#import "TestView.h"
#import "AppDelegate.h"
#import "VM.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;

@property (nonatomic, strong) VM *vm;


@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.vm = [[VM alloc] init];
    self.vm.textField = self.textField;
    
    
    TestView *testView = [[TestView alloc] init];
    testView.frame = CGRectMake(100, 600, 100, 100);
    testView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:testView];
    self.vm.countLabel = testView.countLabel;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    [testView addGestureRecognizer:tap];
    
    //初始化数据
    [self.vm initInfo];
   
}

- (void)tap {
    [self.vm changInfo];
}
- (IBAction)initAction:(id)sender {
    [self.vm initInfo];
}

- (IBAction)changAction:(id)sender {
    [self.vm changInfo];
}

@end
