//
//  IntegerPoint.h
//  onota
//
//  Created by Admin on 10.02.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IntegerPoint : NSObject

@property (nonatomic, readwrite) NSInteger x;
@property (nonatomic, readwrite) NSInteger y;

+ (IntegerPoint *) integerPointWithX:(NSInteger) x andY:(NSInteger) y;
- (BOOL) isEqualToPoint:(IntegerPoint *) point;
-(BOOL) makesRayWithPoint1:(IntegerPoint *) point1 andPoint2:(IntegerPoint *) point2;


@end
