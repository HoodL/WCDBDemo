//
//  DBManager.m
//  WCDB-DEMO
//
//  Created by 李辉 on 2020/10/18.
//  Copyright © 2020 黄坤. All rights reserved.
//

#import "DBManager.h"
#import "City+WCTTableCoding.h"

#define TABLE_WCDB_NAME @"City"

@interface DBManager ()
{
    WCTDatabase * database;
}
@end
@implementation DBManager

+ (instancetype)shareInstance {
    static DBManager * instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        instance = [[DBManager alloc]init];
        
    });
    
    return instance;
}
/// 获取数据库路径
+ (NSString *)wcdbFilePath {
    NSString *docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *dbFilePath = [docDir stringByAppendingPathComponent:@"City.db"];
    return dbFilePath;
}
/// 创建数据库的操作
- (BOOL)creatDatabase {
    database = [[WCTDatabase alloc] initWithPath:[DBManager wcdbFilePath]];
    //测试数据库是否能够打开
    if ([database canOpen]) {
        // WCDB大量使用延迟初始化（Lazy initialization）的方式管理对象，因此SQLite连接会在第一次被访问时被打开。开发者不需要手动打开数据库。
        // 先判断表是不是已经存在
        if ([database isOpened]) {
            if ([database isTableExists:TABLE_WCDB_NAME]) {
                
                NSLog(@"表已经存在");
                return NO;
                
            }else {
                return [database createTableAndIndexesOfName:TABLE_WCDB_NAME withClass:City.class];
            }
        }
    }
    return NO;
}

- (BOOL)insertData:(City *)city {
    if (city == nil) {
        return NO;
    }
    if (database == nil) {
        [self creatDatabase];
    }
    return [database insertOrReplaceObject:city into:TABLE_WCDB_NAME];

}

- (BOOL)deleteDataWithId:(NSString *)cityId {
    if (database == nil) {
        [self creatDatabase];
    }
    return [database deleteObjectsFromTable:TABLE_WCDB_NAME where:City.cityId == cityId];
}

- (BOOL)deleteAllData {
    if (database == nil) {
        [self creatDatabase];
    }
    return [database deleteAllObjectsFromTable:TABLE_WCDB_NAME];
}

- (NSArray<City *> *)getAllData {
    if (database == nil) {
        [self creatDatabase];
    }
    return [database getAllObjectsOfClass:City.class fromTable:TABLE_WCDB_NAME];
}
- (NSArray<City *> *)getData:(NSString *)cityId {
    if (database == nil) {
        [self creatDatabase];
    }
    return [database getObjectsOfClass:City.class fromTable:TABLE_WCDB_NAME where:City.cityId == cityId];

}
- (NSArray<City *> *)seleteDataOrderBy {
    //SELECT * FROM message ORDER BY localID
    if (database == nil) {
        [self creatDatabase];
    }
//    NSArray<Person *> * person = [database getObjectsOfClass:Person.class fromTable:TABLE_WCDB_NAME orderBy:Person.localID.order()];
    NSArray<City *> * city = [database getObjectsOfClass:City.class fromTable:TABLE_WCDB_NAME orderBy:City.createTime.order()];

    return city;

}

@end
