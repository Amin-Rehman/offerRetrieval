//
//  Utils.h
//  FyterTestTask
//
//  Created by Amin Ur Rehman on 06/10/2016.
//  Copyright © 2016 FyberTask. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utils : NSObject
+ (NSString *)generateHashKeyFromQueryParameters:(NSDictionary *)queryParameters apiKey:(NSString *)apiKey;
+ (NSString *)getIPAddress;
@end
