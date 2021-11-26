//
//  User.h
//  Demo
//
//  Created by JD on 2020/11/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface User : NSObject

+ (instancetype)name:(NSString *)name;

@property (nonatomic, strong) NSString *name;

@end

NS_ASSUME_NONNULL_END
