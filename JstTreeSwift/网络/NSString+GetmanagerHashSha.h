//
//  NSString+GetmanagerHashSha.h
//  jiami
//
//  Created by ZhiYuan on 2019/8/16.
//  Copyright © 2019 郭徽. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (GetmanagerHashSha)
+ (NSString *)HmacSha1:(NSString *)key data:(NSString *)value;
+ (NSString *)rb_base64EncodingString:(NSString *)string;
+ (NSString *)pureStrWithOriginStr:(NSString *)originStr ;
@end

NS_ASSUME_NONNULL_END
