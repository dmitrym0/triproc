//
//  triproctest.m
//  triproctest
//
//  Created by Dmitry M on 2012-10-22.
//  Copyright (c) 2012 Dmitry M. All rights reserved.
//

#import "triproctest.h"
#import "DNATriproc.h"

@implementation triproctest

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testExample
{
    //STFail(@"Unit tests are not implemented yet in triproctest");
}


-(void) testPoint
{
    DNAPoint* p = [[DNAPoint alloc] initWithString:@"0.01 0.02 0.03"];
    STAssertEquals(p.x, 0.01, @"Expecting 0.01");
    STAssertEquals(p.y, 0.02, @"Expecting 0.02");
    STAssertEquals(p.z, 0.03, @"Expecting 0.03");

}

@end
