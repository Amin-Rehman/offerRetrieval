//
//  Utils.m
//  FyberTestTask
//
//  Created by Amin Ur Rehman on 06/10/2016.
//  Copyright © 2016 FyberTask. All rights reserved.
//

#include <ifaddrs.h>
#include <arpa/inet.h>
#import "NSString+FYHash.h"
#import "Utils.h"

@implementation Utils


+ (NSString *)generateHashKeyFromQueryParameters:(NSDictionary *)queryParameters apiKey:(NSString *)apiKey{
    
    NSString *result = [[NSString alloc] init];
            
    NSArray *sortedKeys = [[queryParameters allKeys] sortedArrayUsingSelector: @selector(compare:)];
    
    
    for(NSString *key in sortedKeys) {
        NSString *value = [queryParameters objectForKey:key];
        
        if ([key isKindOfClass:[NSString class]] && [value isKindOfClass:[NSString class]]) {
            result = [result stringByAppendingString:key];
            result = [result stringByAppendingFormat:@"=%@&",value];
        }
    }
    result = [result stringByAppendingString:apiKey];
    
    return [result calculateSHA];
}


+ (NSString *)getIPAddress {
    NSString *address = @"error";
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = 0;
    
    success = getifaddrs(&interfaces);
    if (success == 0) {
        temp_addr = interfaces;
        while (temp_addr != NULL) {
            if( temp_addr->ifa_addr->sa_family == AF_INET) {
                if ([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"]) {
                    // Get NSString from C String
                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
                }
            }
            
            temp_addr = temp_addr->ifa_next;
        }
    }
    
    // Free memory
    freeifaddrs(interfaces);
    
    return address;
}

@end

