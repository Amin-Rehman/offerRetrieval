//
//  FYPayloadParserTests.m
//  FyberTestTask
//
//  Created by Amin Ur Rehman on 08/10/2016.
//  Copyright © 2016 FyberTask. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FYPayloadParser.h"
#import "FYOfferItem.h"

@interface FYPayloadParserTests : XCTestCase

@end

@implementation FYPayloadParserTests

- (void)testPayloadParser {
 
    NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"PayloadTestData" ofType:@"plist"];
    NSDictionary *testPayload = [[NSDictionary alloc] initWithContentsOfFile:filePath];

    NSArray <FYOfferItem *> *offerLists = [FYPayloadParser parsePayload:testPayload];
    
    XCTAssertEqual(1, [offerLists count],@"Incorrect number of items from the parse results");
    
    FYOfferItem *offerItem = offerLists[0];
    XCTAssertTrue([offerItem.title isEqualToString:@"Offer Text"],@"Incorrect title evaluated from parser");
    XCTAssertTrue([offerItem.teaser isEqualToString:@"Teaser Text"],@"Incorrect teaser evaluated from parser");
    XCTAssertTrue([offerItem.thumbnailURL isEqualToString:@"http://www.imageurl.com/image.png"],@"Incorrect thumbnail url evaluated from parser");
    XCTAssertTrue((offerItem.payout == 20),@"Incorrect title evaluated from parser");
    
}


@end
