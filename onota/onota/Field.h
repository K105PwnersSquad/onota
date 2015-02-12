//
//  Field.h
//  onota
//
//  Created by Admin on 10.02.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Field : NSObject

@property (nonatomic, readwrite) NSMutableArray *gameField;
@property (nonatomic, readwrite) NSMutableArray *templateField;
@property (nonatomic, readwrite) IntegerPoint *currentPosition;
@property (nonatomic, readwrite) IntegerPoint *initialPosition;
@property (nonatomic, readwrite) int fieldHeight;
@property (nonatomic, readwrite) int fieldWidth;

-(BOOL) isCorrect;

-(void) moveLeft;
-(void) moveRight;
-(void) moveUp;
-(void) moveDown;
-(void) generateField;

@end