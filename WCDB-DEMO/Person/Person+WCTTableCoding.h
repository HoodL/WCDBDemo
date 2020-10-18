//
//  Person+WCTTableCoding.h
//  WCDB-DEMO
//
//  Created by 黄坤 on 2018/1/19.
//  Copyright © 2018年 黄坤. All rights reserved.
//

//#import "Person.h"
#import "Person+Extension.h"
#import <WCDB/WCDB.h>
@interface Person (WCTTableCoding)<WCTTableCoding>
WCDB_PROPERTY(studentId)//使用WCDB_PROPERTY宏在头文件声明需要绑定到数据库表的字段。
WCDB_PROPERTY(name)
WCDB_PROPERTY(createTime)
WCDB_PROPERTY(modifiedTime)
@end
