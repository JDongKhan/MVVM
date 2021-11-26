//
//  TestView.m
//  Demo
//
//  Created by JD on 2021/7/16.
//

#import "TestView.h"

@interface TestView ()

@end

@implementation TestView

- (instancetype)init {
    if (self = [super init]) {
        self.countLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        self.countLabel.textColor = [UIColor whiteColor];
        [self addSubview:self.countLabel];
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
