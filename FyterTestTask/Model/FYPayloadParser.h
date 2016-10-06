//
//  FYPayloadParser.h
//  FyterTestTask
//
//  Created by Amin Ur Rehman on 06/10/2016.
//  Copyright © 2016 FyberTask. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FYPayloadParser : NSObject
+ (NSArray *)parsePayload:(NSDictionary *)payload;
@end
