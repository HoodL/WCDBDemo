//
//  DBManager.h
//  WCDB-DEMO
//
//  Created by 李辉 on 2020/10/18.
//  Copyright © 2020 黄坤. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "City.h"

NS_ASSUME_NONNULL_BEGIN

@interface DBManager : NSObject
+ (instancetype)shareInstance;
/// 获取数据库路径
+ (NSString *)wcdbFilePath;
/// 创建数据库的操作
- (BOOL)creatDatabase;

- (BOOL)insertData:(City *)person;

- (BOOL)deleteDataWithId:(NSString *)cityId;

- (BOOL)deleteAllData;

- (NSArray<City *> *)getAllData;
- (NSArray<City *> *)getData:(NSString *)cityId;
- (NSArray<City *> *)seleteDataOrderBy;

@end

NS_ASSUME_NONNULL_END
