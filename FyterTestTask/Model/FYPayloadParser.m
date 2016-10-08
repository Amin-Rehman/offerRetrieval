//
//  FYPayloadParser.m
//  FyterTestTask
//
//  Created by Amin Ur Rehman on 06/10/2016.
//  Copyright © 2016 FyberTask. All rights reserved.
//

#import "FYPayloadParser.h"
#import "FYOfferItem.h"

@implementation FYPayloadParser

+ (NSArray *)parsePayload:(NSDictionary *)payload {
    NSMutableArray *offersArray = [[NSMutableArray alloc] init];
    
    NSDictionary *offersDictionary = payload[@"offers"];
    
    for(id itemDictionary in offersDictionary) {
        
        if([itemDictionary isKindOfClass:[NSDictionary class]]) {
            
            FYOfferItem *offer = [[FYOfferItem alloc] initWithTitle:itemDictionary[@"title"]
                                                             teaser:itemDictionary[@"teaser"]
                                                          thumbnail:itemDictionary[@"thumbnail"][@"hires"]
                                                             payout:[itemDictionary[@"payout"] longValue]];
            [offersArray addObject:offer];
        }
    }
    
    return [offersArray copy];
}

@end
