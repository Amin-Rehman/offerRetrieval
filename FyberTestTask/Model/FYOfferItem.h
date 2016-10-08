//
//  FYOfferItem.h
//  FyberTestTask
//
//  Created by Amin Ur Rehman on 06/10/2016.
//  Copyright © 2016 FyberTask. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FYOfferItem : NSObject
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *teaser;
@property (nonatomic,copy) NSString *thumbnailURL;
@property long payout;

- (instancetype)initWithTitle:(NSString *)title teaser:(NSString *)teaser thumbnail:(NSString *)thumbnail payout:(long)payout;
@end
