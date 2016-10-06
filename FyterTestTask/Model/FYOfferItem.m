//
//  FYOfferItem.m
//  FyterTestTask
//
//  Created by Amin Ur Rehman on 06/10/2016.
//  Copyright © 2016 FyberTask. All rights reserved.
//

#import "FYOfferItem.h"

@interface FYOfferItem ()
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *teaser;
@property (nonatomic,copy) NSString *thumbnailURL;
@property (nonatomic,copy) NSString *payout;
@end


@implementation FYOfferItem
- (instancetype)initWithTitle:(NSString *)title teaser:(NSString *)teaser thumbnail:(NSString *)thumbnail payout:(NSString *)payout  {
    self = [super init];
    if (self) {
        _title = title;
        _teaser = teaser;
        _thumbnailURL = thumbnail;
        _payout = payout;
    }
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"Title: %@ teaser: %@ thumbnail: %@ payout: %@ \r",self.title,self.teaser,self.thumbnailURL,self.payout];
}
@end
