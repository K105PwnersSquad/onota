//
//  Cell.m
//  onota
//
//  Created by Admin on 10.02.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "Cell.h"

@implementation Cell

- (id) init
{
    self = [super init];
    if (self)
    {
        self.cellState = CellStateOne;
    }
    return self;
}

@end
