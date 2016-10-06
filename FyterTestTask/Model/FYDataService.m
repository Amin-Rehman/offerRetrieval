//
//  FYDataService.m
//  FyterTestTask
//
//  Created by Amin Ur Rehman on 05/10/2016.
//  Copyright © 2016 FyberTask. All rights reserved.
//

#import "FYDataService.h"
#import <AdSupport/ASIdentifierManager.h>
#import "Utils.h"


@implementation FYDataService

static NSString const *BASE_URL = @"http://api.fyber.com";

+ (void)makeGetRequestWithUid:(NSString *)uid
                       apiKey:(NSString *)apiKey
                        appId:(NSString *)appId
              completionBlock:(void(^)(NSDictionary *))completionBlock {
    
    NSString *appleIdfa = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    NSString *ipAddress = [Utils getIPAddress];
    NSDate *dateItem = [[NSDate alloc] init];
    NSString *timeStamp = [NSString stringWithFormat:@"%d",(int)[dateItem timeIntervalSince1970]];
    
    
    NSURLSessionConfiguration *defaultConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration:defaultConfiguration];
    
    
    NSString *listURLPath = [BASE_URL stringByAppendingPathComponent:@"feed/v1/offers.json?"];
    
    NSMutableDictionary *queryDictionary = [[NSMutableDictionary alloc] init];
    [queryDictionary setObject:appId forKey:@"appid"];
    [queryDictionary setObject:appleIdfa forKey:@"apple_idfa"];
    [queryDictionary setObject:@"json" forKey:@"format"];
    [queryDictionary setObject:ipAddress forKey:@"ip"];
    [queryDictionary setObject:@"DE" forKey:@"locale"];
    [queryDictionary setObject:@"112" forKey:@"offer_types"];
    [queryDictionary setObject:timeStamp forKey:@"timestamp"];
    [queryDictionary setObject:uid forKey:@"uid"];
    
    
    NSString *hashKey = [Utils generateHashKeyFromQueryParameters:queryDictionary apiKey:apiKey];
    [queryDictionary setObject:hashKey forKey:@"hashkey"];
    
    
    NSMutableArray *queryItems = [NSMutableArray array];
    for (NSString *key in queryDictionary) {
        [queryItems addObject:[NSURLQueryItem queryItemWithName:key value:queryDictionary[key]]];
    }

    NSURLComponents *urlComponents = [NSURLComponents componentsWithString:listURLPath];
    
    [urlComponents setQueryItems:queryItems];
    
    NSURL * url = [urlComponents URL];
    
    void (^requestCompletionBlock)(NSData *data, NSURLResponse *response, NSError *error) = ^(NSData *data, NSURLResponse *response, NSError *error) {
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        
        if([httpResponse statusCode] == 200) {
            NSError *errorReq;
            NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&errorReq];
            completionBlock(result);

        } else {
            NSLog(@"Error in the REST call while retrieving offer");
        }
        
    };
    
    NSURLSessionDataTask * dataTask = [defaultSession dataTaskWithURL:url
                                                    completionHandler:requestCompletionBlock];
    [dataTask resume];
    
    
}
@end
