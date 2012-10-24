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
        
        
        // read the file
        NSString* file = [NSString stringWithCString:argv[1] encoding:NSASCIIStringEncoding];
        
        if (![[NSFileManager defaultManager] fileExistsAtPath:file])
        {
            NSLog(@"File %@ not available.", file);
            return 0;
        }

        
        // generate triangles from the data
        DNATriangleGenerator* generator = [[DNATriangleGenerator alloc] init];
        NSArray* triangles = [generator generateWithFile:file];
        
        DLog(@"%d triangles", (int)triangles.count);
        
        // sort triangles by area
        NSArray* sortedTriangles = [triangles sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
            DNATriangle* t1 = (DNATriangle*) obj1;
            DNATriangle* t2 = (DNATriangle*) obj2;
            return [[NSNumber numberWithDouble:t1.area] compare:[NSNumber numberWithDouble:t2.area]];
        }];
        
        
        
        // go through the sorted list, remove duplicates and degenerates
        NSMutableArray* finalTriangleList = [[NSMutableArray alloc] init];
        
        DNATriangle* previousTraingle = nil;
        int degenerateTriangles = 0;
        int identicalTriangles = 0;

        for (DNATriangle* t in sortedTriangles)
        {
            if (t.area < AREA_ERROR)
            {
                DLog(@"Degenerate triangle.");
                degenerateTriangles++;
            }
            else if(abs(previousTraingle.area - t.area) < ERROR && [t isEqual:previousTraingle])
            {
                DLog(@"Identical triangle.");
                identicalTriangles++;
            } else {
                [finalTriangleList addObject:t];
            }
            
            previousTraingle = t;
        }
        
       
        DLog(@"Identical triangles=%d. Degenerate triangles=%d total resulting triangles=%d original number of triangles=%d", identicalTriangles, degenerateTriangles, (int)finalTriangleList.count, (int)sortedTriangles.count);
    
    }
    return 0;
}



