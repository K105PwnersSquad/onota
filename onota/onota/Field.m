//
//  Field.m
//  onota
//
//  Created by Admin on 10.02.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "Field.h"
#import "Cell.h"

@implementation Field


- (id) init
{
    self = [super init];
    if (self)
    {
        self.fieldHeight = FIELD_HEIGHT;
        self.fieldWidth = FIELD_WIDTH;
        [self generateField];
    }
    return self;
}

-(BOOL) isCorrect
{
    return NO;
}

-(void) moveLeft
{
    
}

-(void) moveRight
{
    
}

-(void) moveUp
{
    
}

-(void) moveDown
{
    
}

-(void) generateField
{
    self.gameField = [NSMutableArray new];
    self.templateField = [NSMutableArray new];
    
    Cell *cell1 = [Cell new];
    cell1.cellState = CellStateOne;
    Cell *cell2 = [Cell new];
    cell2.cellState = CellStateTwo;
    Cell *cell3 = [Cell new];
    cell3.cellState = CellStateThree;
    Cell *cellEmpty = [Cell new];
    cellEmpty.cellState = CellStateEmpty;
    for (int i = 0; i < _fieldHeight * _fieldWidth; i++) {
        [_gameField addObject:cell1];
    }
    _gameField[2] = cell2;
    _gameField[3] = cell3;
    _gameField[9] = cell2;
    _gameField[10] = cell3;
    _gameField[7] = cellEmpty;
//        _gameField =               (NSMutableArray *)@[
//                                cell1, cell1, cell2, cell2, cell3, cell3, cell1, cell2,
//                                cell1, cell1, cell2, cell2, cell3, cell3, cell1, cell2,
//                                cell1, cell1, cell2, cell2, cell3, cell3, cell1, cell2,
//                                cell1, cell1, cell2, cell2, cell3, cell3, cell1, cell2,
//                                cell1, cell1, cell2, cell2, cell3, cell3, cell1, cell2,
//                                cell1, cell1, cell2, cell2, cell3, cell3, cell1, cell2
//                               ];
}

@end
