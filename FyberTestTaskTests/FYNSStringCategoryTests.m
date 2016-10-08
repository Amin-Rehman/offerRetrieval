//
//  FYCategoryTests.m
//  FyberTestTask
//
//  Created by Amin Ur Rehman on 08/10/2016.
//  Copyright © 2016 FyberTask. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSString+FYHash.h"

@interface FYNSStringCategoryTests : XCTestCase

@end

@implementation FYNSStringCategoryTests

- (void)testNSStringHash {
    NSString *inputString = @"UserName";
    NSString *sha = [inputString calculateSHA];
    NSString *expectedSHA = @"e90ed7a9db5e1d4dd3bc2c23b48aad6594d59d3d";
    
    XCTAssertTrue([sha isEqualToString:expectedSHA], @"Test failed. Incorrect hash evaluation");
}

- (void)testNSStringHashEmptyString {
    NSString *inputString = @"";
    NSString *sha = [inputString calculateSHA];
    NSString *expectedSHA = @"da39a3ee5e6b4b0d3255bfef95601890afd80709";
    
    XCTAssertTrue([sha isEqualToString:expectedSHA], @"Test failed. Incorrect hash evaluation");
}

- (void)testNSStringHashLongString {
    NSString *inputString = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Comprehensum, quod cognitum non habet? Si quicquam extra virtutem habeatur in bonis. Equidem etiam Epicurum, in physicis quidem, Democriteum puto. Duo Reges: constructio interrete. Et quod est munus, quod opus sapientiae? Que Manilium, ab iisque M. Sed ad haec, nisi molestum est, habeo quae velim. Sed haec quidem liberius ab eo dicuntur et saepius.";
    NSString *sha = [inputString calculateSHA];
    NSString *expectedSHA = @"4da8553a5d9fd47f638c61b34cc1d92e874c736b";
    
    XCTAssertTrue([sha isEqualToString:expectedSHA], @"Test failed. Incorrect hash evaluation");
}


@end
