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


-(void) testTriangle
{
    DNAPoint* p1 = [[DNAPoint alloc] initWithString:@"0.01 0.02 0.03"];
    DNAPoint* p2 = [[DNAPoint alloc] initWithString:@"0.01 0.02 0.03"];
    DNAPoint* p3 = [[DNAPoint alloc] initWithString:@"0.01 0.02 0.03"];

    DNATriangle* t = [[DNATriangle alloc] initWithP1:p1 p2:p2 p3:p3];
    STAssertNotNil(t, @"Triangle can't be nil");
    STAssertEquals(t.points.count,(NSUInteger) 3, @"Should be 3 points");
}

-(void) testSubtract
{
    DNAPoint* p1 = [[DNAPoint alloc] initWithString:@"-5 4 -5"];
    DNAPoint* p2 = [[DNAPoint alloc] initWithString:@"-5 -4 6"];
    DNAPoint* newP = [p1 subtract:p2];
    STAssertEquals(0.0, newP.x, @"");
    STAssertEquals(8.0, newP.y, @"");
    STAssertEquals(-11.0, newP.z, @"");
}

-(void) testArea
{
    // from here: http://answers.yahoo.com/question/index?qid=20110210122955AARoWJb
    DNAPoint* p1 = [[DNAPoint alloc] initWithString:@"-5 4 -5"];
    DNAPoint* p2 = [[DNAPoint alloc] initWithString:@"-5 -4 6"];
    DNAPoint* p3 = [[DNAPoint alloc] initWithString:@"3 -3 4"];
    DNATriangle* t = [[DNATriangle alloc] initWithP1:p1 p2:p2 p3:p3];
    STAssertTrue(t.area - 54.463290389 < AREA_ERROR, @"Unexpected area!");
    
}
@end
