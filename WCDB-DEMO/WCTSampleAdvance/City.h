//
//  WCTSampleAdvance.h
//  WCDB-DEMO
//
//  Created by 李辉 on 2020/10/18.
//  Copyright © 2020 黄坤. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface City : NSObject

@property(nonatomic, strong) NSString *cityName;
@property(nonatomic, assign) NSInteger cityId;
@property(nonatomic, assign) float distance;
//@property(nonatomic, strong) NSArray *<#property4#>;
@property(nonatomic, strong) NSDate *createTime;

@end
