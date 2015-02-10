//
//  Field.m
//  onota
//
//  Created by Admin on 10.02.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "Field.h"

@implementation Field


- (id) init
{
    self = [super init];
    if (self)
    {
        self.gameField = [NSMutableArray new];
        self.templateField = [NSMutableArray new];
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
    
}

@end
