//
//  Person+Extension.h
//  WCDB-DEMO
//
//  Created by 李辉 on 2020/10/18.
//  Copyright © 2020 黄坤. All rights reserved.
//

#import "Person.h"

NS_ASSUME_NONNULL_BEGIN

@interface Person (Extension)
@property(nonatomic, strong) NSDate *createTime;
@property(nonatomic, strong) NSDate *modifiedTime;
@end

NS_ASSUME_NONNULL_END
