//
//  NSString+GetmanagerHashSha.m
//  jiami
//
//  Created by ZhiYuan on 2019/8/16.
//  Copyright © 2019 郭徽. All rights reserved.
//

#import "NSString+GetmanagerHashSha.h"
#include <CommonCrypto/CommonDigest.h>
#include <CommonCrypto/CommonHMAC.h>

@implementation NSString (GetmanagerHashSha)
#pragma mark - 工具方法 HmacSHA1加密；
//!!!!: 2. HmacSHA1加密；
+ (NSString *)HmacSha1:(NSString *)key data:(NSString *)value
{
    NSData *keyData = [key dataUsingEncoding:NSUTF8StringEncoding];
    NSData *valueData = [value dataUsingEncoding:NSUTF8StringEncoding];
    
    unsigned char result[CC_SHA1_DIGEST_LENGTH];
    CCHmac(kCCHmacAlgSHA1, [keyData bytes], [keyData length], [valueData bytes], [valueData length], result);
    
    NSData *HMAC = [[NSData alloc] initWithBytes:result
                                          length:sizeof(result)];
    //    NSLog(@"%d行  %@",__LINE__,HMAC);
    
    NSString *str =  [NSString convertDataToHexStr:HMAC];
    //    NSLog(@"%d行  %@",__LINE__,str);
    
    return str;
}


//NSdata转16进制字符串
+ (NSString *)convertDataToHexStr:(NSData *)data {
    if (!data || [data length] == 0) {
        return @"";
    }
    NSMutableString *string = [[NSMutableString alloc] initWithCapacity:[data length]];
    
    [data enumerateByteRangesUsingBlock:^(const void *bytes, NSRange byteRange, BOOL *stop) {
        unsigned char *dataBytes = (unsigned char*)bytes;
        for (NSInteger i = 0; i < byteRange.length; i++) {
            NSString *hexStr = [NSString stringWithFormat:@"%x", (dataBytes[i]) & 0xff];
            if ([hexStr length] == 2) {
                [string appendString:hexStr];
            } else {
                [string appendFormat:@"0%@", hexStr];
            }
        }
    }];
    
    return string;
}

+ (NSString *)rb_base64EncodingString:(NSString *)string {
    NSData *data = [string dataUsingEncoding:(NSUTF8StringEncoding)];
    
    return [data base64EncodedStringWithOptions:(NSDataBase64Encoding64CharacterLineLength)];
}


+ (NSString *)pureStrWithOriginStr:(NSString *)originStr {
    // 去掉换行符号 与下面👇注释代码效果一样
    originStr = [originStr stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    
    originStr = [originStr stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    originStr = [originStr stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    originStr = [originStr stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    originStr = [originStr stringByReplacingOccurrencesOfString:@" " withString:@""]; // 1-10这个只能取出普通空格。对于系统通讯录中的空格无能为力。
    
    originStr = [originStr stringByReplacingOccurrencesOfString:@"\0" withString:@""];
    originStr = [originStr stringByReplacingOccurrencesOfString:@"-" withString:@""];
    originStr = [originStr stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    
    return originStr;
}
@end
