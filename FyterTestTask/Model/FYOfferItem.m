//
//  FYOfferItem.m
//  FyterTestTask
//
//  Created by Amin Ur Rehman on 06/10/2016.
//  Copyright © 2016 FyberTask. All rights reserved.
//

#import "FYOfferItem.h"

@interface FYOfferItem ()
@end


@implementation FYOfferItem
- (instancetype)initWithTitle:(NSString *)title teaser:(NSString *)teaser thumbnail:(NSString *)thumbnail payout:(long) payout {
    self = [super init];
    if (self) {
        _title = title;
        _teaser = teaser;
        _thumbnailURL = thumbnail;
        _payout = payout;
    }
    return self;
}

@end
