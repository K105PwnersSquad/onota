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
    for (int i = 0; i < self.fieldWidth * self.fieldHeight; i++) {
        Cell *cell1 = self.gameField[i];
        Cell *cell2 = self.templateField[i];
        if (cell1.cellState != cell2.cellState) {
            return NO;
        }
    }
    return YES;
}

-(BOOL) moveLeft
{
    IntegerPoint *ip = [IntegerPoint integerPointWithX:self.currentPosition.x - 1 andY:self.currentPosition.y];
    if (ip.x < 0)  {
        return NO;
    }
    Cell *newCell = self.gameField[ip.x + ip.y * self.fieldWidth];
    if (newCell.cellState == CellStateEmpty) {
        return NO;
    }
    Cell *oldCell = self.gameField[self.currentPosition.x + self.currentPosition.y * self.fieldWidth];
    switch (newCell.cellState) {
        case CellStateOne:
            switch (oldCell.cellState) {
                case CellStateOne:
                    break;
                case CellStateTwo:
                    newCell.cellState = CellStateThree;
                    break;
                case CellStateThree:
                    newCell.cellState = CellStateTwo;
                    break;
                default: [NSException raise:@"cell_state_exception_move_left" format:@"invalid cell state"];
                    break;
            }
            break;
        case CellStateTwo:
            switch (oldCell.cellState) {
                case CellStateOne:
                    newCell.cellState = CellStateThree;
                    break;
                case CellStateTwo:
                    break;
                case CellStateThree:
                    newCell.cellState = CellStateOne;
                    break;
                default: [NSException raise:@"cell_state_exception_move_left" format:@"invalid cell state"];
                    break;
            }
            break;
        case CellStateThree:
            switch (oldCell.cellState) {
                case CellStateOne:
                    newCell.cellState = CellStateTwo;
                    break;
                case CellStateTwo:
                    newCell.cellState = CellStateOne;
                    break;
                case CellStateThree:
                    break;
                default: [NSException raise:@"cell_state_exception_move_left" format:@"invalid cell state"];
                    break;
            }
            break;
        default: [NSException raise:@"cell_state_exception_move_left" format:@"invalid cell state"];
            break;
    }
    self.previousPosition = self.currentPosition;
    self.currentPosition = ip;
    self.gameField[ip.x + ip.y * self.fieldWidth] = newCell;
    return YES;
}

-(BOOL) moveRight
{
    IntegerPoint *ip = [IntegerPoint integerPointWithX:self.currentPosition.x + 1 andY:self.currentPosition.y];
    if (ip.x >= self.fieldWidth)  {
        return NO;
    }
    Cell *newCell = self.gameField[ip.x + ip.y * self.fieldWidth];
    if (newCell.cellState == CellStateEmpty) {
        return NO;
    }
    Cell *oldCell = self.gameField[self.currentPosition.x + self.currentPosition.y * self.fieldWidth];
    switch (newCell.cellState) {
        case CellStateOne:
            switch (oldCell.cellState) {
                case CellStateOne:
                    break;
                case CellStateTwo:
                    newCell.cellState = CellStateThree;
                    break;
                case CellStateThree:
                    newCell.cellState = CellStateTwo;
                    break;
                default: [NSException raise:@"cell_state_exception_move_right" format:@"invalid cell state"];
                    break;
            }
            break;
        case CellStateTwo:
            switch (oldCell.cellState) {
                case CellStateOne:
                    newCell.cellState = CellStateThree;
                    break;
                case CellStateTwo:
                    break;
                case CellStateThree:
                    newCell.cellState = CellStateOne;
                    break;
                default: [NSException raise:@"cell_state_exception_move_right" format:@"invalid cell state"];
                    break;
            }
            break;
        case CellStateThree:
            switch (oldCell.cellState) {
                case CellStateOne:
                    newCell.cellState = CellStateTwo;
                    break;
                case CellStateTwo:
                    newCell.cellState = CellStateOne;
                    break;
                case CellStateThree:
                    break;
                default: [NSException raise:@"cell_state_exception_move_right" format:@"invalid cell state"];
                    break;
            }
            break;
        default: [NSException raise:@"cell_state_exception_move_right" format:@"invalid cell state"];
            break;
    }
    self.previousPosition = self.currentPosition;
    self.currentPosition = ip;
    self.gameField[ip.x + ip.y * self.fieldWidth] = newCell;
    return YES;
}

-(BOOL) moveUp
{
    IntegerPoint *ip = [IntegerPoint integerPointWithX:self.currentPosition.x andY:self.currentPosition.y - 1];
    if (ip.y < 0)  {
        return NO;
    }
    Cell *newCell = self.gameField[ip.x + ip.y * self.fieldWidth];
    if (newCell.cellState == CellStateEmpty) {
        return NO;
    }
    Cell *oldCell = self.gameField[self.currentPosition.x + self.currentPosition.y * self.fieldWidth];
    switch (newCell.cellState) {
        case CellStateOne:
            switch (oldCell.cellState) {
                case CellStateOne:
                    break;
                case CellStateTwo:
                    newCell.cellState = CellStateThree;
                    break;
                case CellStateThree:
                    newCell.cellState = CellStateTwo;
                    break;
                default: [NSException raise:@"cell_state_exception_move_up" format:@"invalid cell state"];
                    break;
            }
            break;
        case CellStateTwo:
            switch (oldCell.cellState) {
                case CellStateOne:
                    newCell.cellState = CellStateThree;
                    break;
                case CellStateTwo:
                    break;
                case CellStateThree:
                    newCell.cellState = CellStateOne;
                    break;
                default: [NSException raise:@"cell_state_exception_move_up" format:@"invalid cell state"];
                    break;
            }
            break;
        case CellStateThree:
            switch (oldCell.cellState) {
                case CellStateOne:
                    newCell.cellState = CellStateTwo;
                    break;
                case CellStateTwo:
                    newCell.cellState = CellStateOne;
                    break;
                case CellStateThree:
                    break;
                default: [NSException raise:@"cell_state_exception_move_up" format:@"invalid cell state"];
                    break;
            }
            break;
        default: [NSException raise:@"cell_state_exception_move_up" format:@"invalid cell state"];
            break;
    }
    self.previousPosition = self.currentPosition;
    self.currentPosition = ip;
    self.gameField[ip.x + ip.y * self.fieldWidth] = newCell;
    return YES;
}

-(BOOL) moveDown
{
    IntegerPoint *ip = [IntegerPoint integerPointWithX:self.currentPosition.x andY:self.currentPosition.y + 1];
    if (ip.y >= self.fieldHeight)  {
        return NO;
    }
    Cell *newCell = self.gameField[ip.x + ip.y * self.fieldWidth];
    if (newCell.cellState == CellStateEmpty) {
        return NO;
    }
    Cell *oldCell = self.gameField[self.currentPosition.x + self.currentPosition.y * self.fieldWidth];
    switch (newCell.cellState) {
        case CellStateOne:
            switch (oldCell.cellState) {
                case CellStateOne:
                    break;
                case CellStateTwo:
                    newCell.cellState = CellStateThree;
                    break;
                case CellStateThree:
                    newCell.cellState = CellStateTwo;
                    break;
                default: [NSException raise:@"cell_state_exception_move_down" format:@"invalid cell state"];
                    break;
            }
            break;
        case CellStateTwo:
            switch (oldCell.cellState) {
                case CellStateOne:
                    newCell.cellState = CellStateThree;
                    break;
                case CellStateTwo:
                    break;
                case CellStateThree:
                    newCell.cellState = CellStateOne;
                    break;
                default: [NSException raise:@"cell_state_exception_move_down" format:@"invalid cell state"];
                    break;
            }
            break;
        case CellStateThree:
            switch (oldCell.cellState) {
                case CellStateOne:
                    newCell.cellState = CellStateTwo;
                    break;
                case CellStateTwo:
                    newCell.cellState = CellStateOne;
                    break;
                case CellStateThree:
                    break;
                default: [NSException raise:@"cell_state_exception_move_down" format:@"invalid cell state"];
                    break;
            }
            break;
        default: [NSException raise:@"cell_state_exception_move_down" format:@"invalid cell state"];
            break;
    }
    self.previousPosition = self.currentPosition;
    self.currentPosition = ip;
    self.gameField[ip.x + ip.y * self.fieldWidth] = newCell;
    return YES;
}

-(void) generateField
{
    self.gameField = [NSMutableArray new];
    self.templateField = [NSMutableArray new];
    self.initialPosition = [IntegerPoint integerPointWithX:INITIAL_POINT_X andY:INITIAL_POINT_Y];
    self.currentPosition = self.initialPosition;
    self.previousPosition = self.initialPosition;
//    Cell *cell1 = [Cell new];
//    cell1.cellState = CellStateOne;
//    Cell *cell2 = [Cell new];
//    cell2.cellState = CellStateTwo;
    Cell *cell3 = [Cell new];
    cell3.cellState = CellStateThree;
    Cell *cellEmpty = [Cell new];
    cellEmpty.cellState = CellStateEmpty;
    for (int i = 0; i < _fieldHeight * _fieldWidth; i++) {
        Cell *cell = [Cell new];
        cell.cellState = i % 3;
        [_gameField addObject:cell];
    }
    for (int i = 0; i < _fieldHeight * _fieldWidth; i++) {
        Cell *cell = [Cell new];
        cell.cellState = i % 3;
        [_templateField addObject:cell];
    }
    _templateField[0] = cell3;
//    _gameField[2] = cell2;
//    _gameField[3] = cell3;
//    _gameField[9] = cell2;
//    _gameField[10] = cell3;
    _gameField[7] = cellEmpty;
    _templateField[7] = cellEmpty;
}

@end
