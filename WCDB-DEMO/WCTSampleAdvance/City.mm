//
//  WCTSampleAdvance.mm
//  WCDB-DEMO
//
//  Created by 李辉 on 2020/10/18.
//  Copyright © 2020 黄坤. All rights reserved.
//

#import "City+WCTTableCoding.h"
#import "City.h"
#import <WCDB/WCDB.h>

@implementation City

WCDB_IMPLEMENTATION(City)
WCDB_SYNTHESIZE(City, cityName)
WCDB_SYNTHESIZE(City, cityId)
WCDB_SYNTHESIZE(City, distance)
//WCDB_SYNTHESIZE(WCTSampleAdvance, <#property4#>)
//WCDB_SYNTHESIZE_COLUMN(WCTSampleAdvance, <#property5#>, "<#column name#>") // Custom column name
WCDB_SYNTHESIZE_DEFAULT(City, createTime, WCTDefaultTypeCurrentTime) // Default to WCTDefaultTypeCurrentTime, WCTDefaultTypeCurrentDate, WCTDefaultTypeCurrentTimestamp or your custom literal value

//WCDB_PRIMARY_ASC_AUTO_INCREMENT(WCTSampleAdvance, <#property2#>)
WCDB_UNIQUE(City, cityId)
WCDB_NOT_NULL(City, cityName)
  
@end
