//
//  DNATriproc.m
//  triproc
//
//  Created by Dmitry M on 2012-10-22.
//  Copyright (c) 2012 Dmitry M. All rights reserved.
//

#import "DNATriproc.h"
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
@end


@implementation DNATriangle
-(id) initWithX:(DNAPoint*)x y:(DNAPoint*)y z:(DNAPoint*)z
{
    self = [super init];
    if (self) {
        _points = [[NSMutableArray alloc] init];
        [_points addObject:x];
        [_points addObject:y];
        [_points addObject:z];
    }
    return self;
}
@end


@implementation DNATriangleGenerator
-(NSArray*) generateWithFile:(NSString *)filePath
{
    //    FileReader* fr = [[FileReader alloc] initWithFilePath:filePath];
    
    //    NSString* line1 = [fr readTrimmedLine];
    //    NSString* line2 = [fr readTrimmedLine];
    //    NSString* line3 = [fr readTrimmedLine];
    return nil;
}
@end