//
//  FYDataSource.h
//  FyberTestTask
//
//  Created by Amin Ur Rehman on 05/10/2016.
//  Copyright © 2016 FyberTask. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol FYDataSourceDelegate <NSObject>
- (void)offerUpdatedWithItems:(NSArray *)itemsList;
@end

@interface FYDataSource : NSObject

@property (nonatomic,weak) id<FYDataSourceDelegate> delegate;

- (void)retrieveOffersWithUid:(NSString *)uid apiKey:(NSString *)apiKey appId:(NSString *)appId;

@end
