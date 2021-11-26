//
//  VM.h
//  Demo
//
//  Created by JD on 2021/11/25.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIkit.h>
NS_ASSUME_NONNULL_BEGIN

@interface VM : NSObject

@property (nonatomic, weak) UITextField *textField;
@property (nonatomic, weak) UILabel *countLabel;

- (void)initInfo;

- (void)changInfo;

@end

NS_ASSUME_NONNULL_END
