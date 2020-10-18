//
//  WCTSampleAdvance+WCTTableCoding.h
//  WCDB-DEMO
//
//  Created by 李辉 on 2020/10/18.
//  Copyright © 2020 黄坤. All rights reserved.
//

#import "City.h"
#import <WCDB/WCDB.h>

@interface City (WCTTableCoding) <WCTTableCoding>

WCDB_PROPERTY(cityName)
WCDB_PROPERTY(cityId)
WCDB_PROPERTY(createTime)
WCDB_PROPERTY(distance)

@end
