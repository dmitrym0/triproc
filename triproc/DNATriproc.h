//
//  DNATriproc.h
//  triproc
//
//  Created by Dmitry M on 2012-10-22.
//  Copyright (c) 2012 Dmitry M. All rights reserved.
//

#import <Foundation/Foundation.h>


#define AREA_ERROR 0.0001
#define ERROR 0.0001

@interface DNAPoint: NSObject
@property (nonatomic, assign) double x;
@property (nonatomic, assign) double y;
@property (nonatomic, assign) double z;
-(id) initWithString:(NSString*) str;
-(DNAPoint*) subtract:(DNAPoint *)p;
@end



@interface DNATriangle : NSObject
@property( nonatomic, strong) NSMutableArray* points;
-(id) initWithP1:(DNAPoint*)p1 p2:(DNAPoint*)p2 p3:(DNAPoint*)p3;
-(double) area;
@end




@interface DNATriangleGenerator : NSObject
-(NSArray*) generateWithFile:(NSString*) filePath;
@end


