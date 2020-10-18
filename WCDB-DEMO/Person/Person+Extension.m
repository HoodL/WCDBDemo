//
//  Person+Extension.m
//  WCDB-DEMO
//
//  Created by 李辉 on 2020/10/18.
//  Copyright © 2020 黄坤. All rights reserved.
//

#import "Person+Extension.h"
#import <objc/runtime.h>
@implementation Person (Extension)

-(void)setCreateTime:(NSDate *)createTime {
    objc_setAssociatedObject(self, @selector(createTime), createTime, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(NSDate *)createTime {
    NSDate *createTime = objc_getAssociatedObject(self, @selector(createTime));
    return createTime;
}

-(void)setModifiedTime:(NSDate *)modifiedTime {
    objc_setAssociatedObject(self, @selector(modifiedTime), modifiedTime, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(NSDate *)modifiedTime {
    NSDate *modifiedTime = objc_getAssociatedObject(self, @selector(modifiedTime));
    return modifiedTime;
}

@end
