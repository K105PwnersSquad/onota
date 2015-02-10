//
//  IntegerPoint.m
//  onota
//
//  Created by Admin on 10.02.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "IntegerPoint.h"

@implementation IntegerPoint

+ (IntegerPoint *) integerPointWithX:(NSInteger) x andY:(NSInteger) y
{
    IntegerPoint *ip = [IntegerPoint new];
    
    ip.x = x;
    ip.y = y;
    
    return ip;
}

- (BOOL) isEqualToPoint:(IntegerPoint *) point
{
    if (self.x == point.x && self.y == point.y) {
        return YES;
    } else {
        return NO;
    }
}

-(BOOL) makesRayWithPoint1:(IntegerPoint *) point1 andPoint2:(IntegerPoint *) point2
{
    if (((((self.y - point1.y) < 0 && (point1.y - point2.y) < 0) ||
          ((self.y - point1.y) > 0 && (point1.y - point2.y) > 0)) &&
         self.x == point1.x && point1.x == point2.x) ||
        ((
          ((self.x - point1.x) < 0 && (point1.x - point2.x) < 0) ||
          ((self.x - point1.x) > 0 && (point1.x - point2.x) > 0)) &&
         self.y == point1.y && point1.y == point2.y)) {
            return YES;
        } else {
            return NO;
        }
}

@end
