//
//  MyModel+Extension.h
//  WCDB-DEMO
//
//  Created by 李辉 on 2020/10/18.
//  Copyright © 2020 黄坤. All rights reserved.
//

#import "MyModel.h"
#import "myProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface MyModel (Extension)<myProtocol>
//-(void)xxx:(NSString *)x;
@end
 
NS_ASSUME_NONNULL_END
