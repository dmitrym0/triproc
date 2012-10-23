//
//  DNATriproc.h
//  triproc
//
//  Created by Dmitry M on 2012-10-22.
//  Copyright (c) 2012 Dmitry M. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DNAPoint: NSObject
@property (nonatomic, assign) double x;
@property (nonatomic, assign) double y;
@property (nonatomic, assign) double z;
-(id) initWithString:(NSString*) str;
@end



@interface DNATriangle : NSObject
@property( nonatomic, strong) NSMutableArray* points;
-(id) initWithX:(DNAPoint*)x y:(DNAPoint*)y z:(DNAPoint*)z;
@end




@interface DNATriangleGenerator : NSObject
-(NSArray*) generateWithFile:(NSString*) filePath;
@end


