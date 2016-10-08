//
//  FYDataService.h
//  FyberTestTask
//
//  Created by Amin Ur Rehman on 05/10/2016.
//  Copyright © 2016 FyberTask. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FYDataService : NSObject
+ (void)makeGetRequestWithUid:(NSString *)uid apiKey:(NSString *)apiKey appId:(NSString *)appId completionBlock:(void(^)(NSDictionary *))completionBlock;
@end
