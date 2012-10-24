//
//  DNATriproc.h
//  triproc
//
//  Created by Dmitry M on 2012-10-22.
//  Copyright (c) 2012 Dmitry M. All rights reserved.
//

#import <Foundation/Foundation.h>


#define AREA_ERROR 2.0
#define ERROR 0.0001

// a 3D point representation
@interface DNAPoint: NSObject
@property (nonatomic, assign) double x;
@property (nonatomic, assign) double y;
@property (nonatomic, assign) double z;

// init like @"0.01 0.02 0.03"
-(id) initWithString:(NSString*) str;
// returns a point that is a result of subtracting argument from this point
-(DNAPoint*) subtract:(DNAPoint *)p;
@end

// triangle representation
@interface DNATriangle : NSObject
@property( nonatomic, strong) NSMutableArray* points;
-(id) initWithP1:(DNAPoint*)p1 p2:(DNAPoint*)p2 p3:(DNAPoint*)p3;
-(double) area;
@end


// pass a file that's a collection of space seperated triangle vertices in 3d, one point per line.
@interface DNATriangleGenerator : NSObject
// returns an array of DNATriangles.
-(NSArray*) generateWithFile:(NSString*) filePath;
@end


