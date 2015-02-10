//
//  Cell.h
//  onota
//
//  Created by Admin on 10.02.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    CellStateOne = 0,
    CellStateTwo,
    CellStateThree,
    numCellStates
} CellState;

@interface Cell : NSObject

@property (nonatomic, readwrite) CellState cellState;

@end
