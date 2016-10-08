//
//  FYHashGenerationTests.m
//  FyberTestTask
//
//  Created by Amin Ur Rehman on 08/10/2016.
//  Copyright © 2016 FyberTask. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Utils.h"

@interface FYHashGenerationTests : XCTestCase

@end

@implementation FYHashGenerationTests

- (void)testGenerateHashKeyNormal {
    NSMutableDictionary *queryDictionary = [[NSMutableDictionary alloc] init];
    [queryDictionary setObject:@"113" forKey:@"appid"];
    [queryDictionary setObject:@"AppleIDFA" forKey:@"apple_idfa"];
    [queryDictionary setObject:@"json" forKey:@"format"];
    [queryDictionary setObject:@"192.168.0.13" forKey:@"ip"];
    [queryDictionary setObject:@"DE" forKey:@"locale"];
    [queryDictionary setObject:@"112" forKey:@"offer_types"];
    [queryDictionary setObject:@"1475930714" forKey:@"timestamp"];
    [queryDictionary setObject:@"6554" forKey:@"uid"];
    
    NSString *hash = [Utils generateHashKeyFromQueryParameters:queryDictionary  apiKey:@"0b0254d9820d4fe18c317e5a759dd8e1"];
    NSString *expectedHash = @"295ab6c6f4b9635ecb8ffed654bfdcb671e4f4f7";
    
    XCTAssertTrue([hash isEqualToString:expectedHash],@"Incorrect hash key generated.");
    
}

- (void)testGenerateHashKeyNilParameters {
    NSString *hash = [Utils generateHashKeyFromQueryParameters:nil  apiKey:@"0b0254d9820d4fe18c317e5a759dd8e1"];
    XCTAssertNil(hash,@"Incorrect hash key generated.");
}


@end
