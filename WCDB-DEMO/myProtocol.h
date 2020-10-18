//
//  myProtocol.h
//  WCDB-DEMO
//
//  Created by 李辉 on 2020/10/18.
//  Copyright © 2020 黄坤. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol myProtocol <NSObject>
@required
-(void)xxx:(NSString *)x;
@optional
-(void)YYY:(int)y;

@end

NS_ASSUME_NONNULL_END
