//
//  FYDataSource.m
//  FyterTestTask
//
//  Created by Amin Ur Rehman on 05/10/2016.
//  Copyright © 2016 FyberTask. All rights reserved.
//

#import "FYDataSource.h"
#import "FYDataService.h"
#import "FYPayloadParser.h"

@interface FYDataSource ()
@end

@implementation FYDataSource

- (void)retrieveOffersWithUid:(NSString *)uid apiKey:(NSString *)apiKey appId:(NSString *)appId {
    
    [FYDataService makeGetRequestWithUid:uid
                                  apiKey:apiKey
                                   appId:appId
                         completionBlock:^(NSDictionary *payload){
                             
                             dispatch_async(dispatch_get_main_queue(), ^{
                                 NSArray *offerItems = [FYPayloadParser parsePayload:payload];
                                 
                                 if (self.delegate) {
                                     [self.delegate offerUpdatedWithItems:offerItems];
                                 }
                             });
                         }];
}

@end
