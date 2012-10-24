//
//  main.m
//  triproc
//
//  Created by Dmitry M on 2012-10-22.
//  Copyright (c) 2012 Dmitry M. All rights reserved.
//
#define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#import <Foundation/Foundation.h>
#import "FileReader.h"
#import "DNATriproc.h"

int main(int argc, const char * argv[])
{

    if (argc == 1)
    {
        NSLog(@"triproc <filename>");
        return 0;
    }
    
    @autoreleasepool {
        DLog(@"Starting!");
        
        NSString* file = [NSString stringWithCString:argv[1] encoding:NSASCIIStringEncoding];
        if (![[NSFileManager defaultManager] fileExistsAtPath:file])
        {
            NSLog(@"File %@ not available.", file);
            return 0;
        }

        DNATriangleGenerator* generator = [[DNATriangleGenerator alloc] init];
        NSArray* triangles = [generator generateWithFile:file];
        
        DLog(@"%d triangles", (int)triangles.count);
        
        NSArray* sortedTriangles = [triangles sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
            DNATriangle* t1 = (DNATriangle*) obj1;
            DNATriangle* t2 = (DNATriangle*) obj2;
            return [[NSNumber numberWithDouble:t1.area] compare:[NSNumber numberWithDouble:t2.area]];
        }];
        
        
        NSMutableArray* finalTriangleList = [[NSMutableArray alloc] init];
        
        double lastArea = 0;
        for (DNATriangle* t in sortedTriangles)
        {
            if (t.area < AREA_ERROR)
            {
                DLog(@"Degenerate triangle");
            }
            else if(abs(lastArea - t.area) < AREA_ERROR)
            {
                
                // check to see if points are the same
                DLog(@"Same area: %f", t.area);
            } else {
                lastArea = t.area;
                [finalTriangleList addObject:t];
            }
                
        }
        
        DLog(@"Done.");
    
    }
    return 0;
}



