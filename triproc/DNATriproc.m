//
//  DNATriproc.m
//  triproc
//
//  Created by Dmitry M on 2012-10-22.
//  Copyright (c) 2012 Dmitry M. All rights reserved.
//

#import "DNATriproc.h"
#import "FileReader.h"

@implementation DNAPoint
-(id) initWithString:(NSString *)line
{
    self = [super init];
    if (self) {
        NSAssert(line.length, @"Line can't be empty.");
        NSArray* components = [line componentsSeparatedByString:@" "];
        NSAssert(components.count == 3, @"Expecting 3 components");
        _x = [components[0] doubleValue];
        _y = [components[1] doubleValue];
        _z = [components[2] doubleValue];
    }
    return self;
}

-(BOOL) isEqual:(DNAPoint*) p
{
    DNAPoint* result = [self subtract:p];
    return (abs(result.x) < ERROR && abs(result.y) < ERROR && abs(result.z) < ERROR);
}

-(DNAPoint*) subtract:(DNAPoint *)p{
    DNAPoint* newPoint = [[DNAPoint alloc] init];
    newPoint.x = self.x - p.x;
    newPoint.y = self.y - p.y;
    newPoint.z = self.z - p.z;
    return newPoint;
}

-(NSString*) description
{
    return [NSString stringWithFormat:@"Pont: [%f %f %f]", self.x, self.y, self.z];
}
@end


@implementation DNATriangle
-(id) initWithP1:(DNAPoint*)p1 p2:(DNAPoint*)p2 p3:(DNAPoint*)p3
{
    self = [super init];
    if (self) {
        _points = [[NSMutableArray alloc] init];
        [_points addObject:p1];
        [_points addObject:p2];
        [_points addObject:p3];
    }
    return self;
}

-(double) area
{
    NSAssert(self.points.count == 3, @"Unexpected number of points here.");
    DNAPoint *p1 = [_points[0] subtract:_points[1]];
    DNAPoint *p2 = [_points[0] subtract:_points[2]];
    
    double c1, c2, c3;
    
    c1 = p1.y * p2.z - p1.z * p2.y;
    c2 = p1.x * p2.z - p2.x * p1.z;
    c3 = p1.x * p2.y - p2.x * p1.y;
    
    return 0.5 * sqrt(pow(c1, 2) +
                      pow(c2, 2) +
                      pow(c3, 2));
}

-(BOOL) isEqual:(DNATriangle*) t
{
    BOOL allThreePointsMatch = YES;
    for (DNAPoint* p1 in self.points) {
        BOOL foundEqualPoint = NO;
        for (DNAPoint* p2 in t.points) {
            if ([p1 isEqual:p2])
            {
                foundEqualPoint = YES;
                break;
            }
        }
        if (!foundEqualPoint)
            allThreePointsMatch = NO;
    }
    return allThreePointsMatch;
    
}
@end


@implementation DNATriangleGenerator
-(NSArray*) generateWithFile:(NSString *)filePath
{
    NSMutableArray* triangles = [[NSMutableArray alloc] init];
    
    FileReader* fr = [[FileReader alloc] initWithFilePath:filePath];

    NSString* line = [fr readTrimmedLine];
    NSMutableArray* points = [[NSMutableArray alloc] init];
    
    while (line) {
        DNAPoint* p = [[DNAPoint alloc] initWithString:line];
        [points addObject:p];
        
        if (points.count == 3) {
            DNATriangle* t = [[DNATriangle alloc] initWithP1:points[0] p2:points[1] p3:points[2]];
            [triangles addObject:t];
            [points removeObjectAtIndex:0];
        }
        line = [fr readTrimmedLine];
    }
    return triangles;
}
@end