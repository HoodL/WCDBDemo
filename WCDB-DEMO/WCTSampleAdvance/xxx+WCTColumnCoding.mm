//
//  xxx+WCTColumnCoding.mm
//  WCDB-DEMO
//
//  Created by 李辉 on 2020/10/18.
//  Copyright © 2020 黄坤. All rights reserved.
//

#import "xxx.h"
#import <Foundation/Foundation.h>
#import <WCDB/WCDB.h>

@interface xxx (WCTColumnCoding) <WCTColumnCoding>
@end

@implementation xxx (WCTColumnCoding)

+ (instancetype)unarchiveWithWCTValue:(NSData *)value
{
    return /* <#Unarchive xxx From NSData *#> */;
}

- (NSData *)archivedWCTValue
{
    return /* <#Archive NSData * To xxx#> */;
}

+ (WCTColumnType)columnTypeForWCDB
{
    return WCTColumnTypeBinary;
}

@end
