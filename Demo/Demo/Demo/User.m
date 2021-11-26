//
//  User.m
//  Demo
//
//  Created by JD on 2020/11/25.
//

#import "User.h"

@implementation User

+ (instancetype)name:(NSString *)name {
    User *u = [[User alloc] init];
    u.name = name;
    return u;
}

@end
