//
//  ViewController.m
//  onota
//
//  Created by Admin on 10.02.15.
//  Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
//

#import "Field.h"
#import "ViewController.h"
#import "Cell.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

@end

@implementation ViewController

NSMutableArray *buttons;

Field *field;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"privet");
//    [self.view setBackgroundColor:[UIColor blueColor]];
    
    field = [[Field alloc] init];
    buttons = [NSMutableArray new];
    int cellWidth = [[UIScreen mainScreen] bounds].size.height / 17;
    
    CGPoint buttonStartPoint = CGPointMake([[UIScreen mainScreen] bounds].size.width * 4 / 22,
                                           [[UIScreen mainScreen] bounds].size.height * 1.5 / 17);
    
    for (int i = 0; i < field.fieldWidth * field.fieldHeight; i++) {
        buttons[i] = [[UIButton alloc] initWithFrame:CGRectMake(buttonStartPoint.x + i % field.fieldWidth * (cellWidth + 1),
                                                                buttonStartPoint.y + i / field.fieldWidth * (cellWidth + 1),
                                                                cellWidth - 1,
                                                                cellWidth - 1)];
        Cell *cell = [field.gameField objectAtIndex:i];
        BOOL isEmpty = NO;
        switch (cell.cellState) {
            case CellStateOne:
                [buttons[i] setBackgroundColor:[UIColor redColor]];
                break;
            case CellStateTwo:
                [buttons[i] setBackgroundColor:[UIColor greenColor]];
                break;
            case CellStateThree:
                [buttons[i] setBackgroundColor:[UIColor blueColor]];
                break;
            case CellStateEmpty:
                isEmpty = YES;
                break;
            default:
                [NSException raise:@"cell_state_exception" format:@"invalid cell state"];
                break;
        }
//        [buttons[i] addTarget:self action:@selectorpressBtn:) forControlEvents:UIControlEventTouchUpInside];
        if (!isEmpty) {
            [self.view addSubview:buttons[i]];
        }
    }
//    UIButton *button = buttons[0];
//    [button setFrame:CGRectMake(button.frame.origin.x - 1,
//                                button.frame.origin.y - 1,
//                                button.frame.size.width + 2,
//                                button.frame.size.height + 2)];
//    button.layer.borderWidth = 3.0;
//    button.layer.borderColor = [[UIColor yellowColor] CGColor];
    UIButton *button = buttons[0];
    [self changeButtonFrame:button forState:YES];
    [self changeButtonFrame:button forState:NO];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)changeButtonFrame:(UIButton *) button forState:(BOOL) active
{
    if (active) {   //dobavit' frame
        [button setFrame:CGRectMake(button.frame.origin.x - 1,
                                    button.frame.origin.y - 1,
                                    button.frame.size.width + 2,
                                    button.frame.size.height + 2)];
        button.layer.borderWidth = 3.0;
        button.layer.borderColor = [[UIColor yellowColor] CGColor];
    } else {        //ubrat' frame
        [button setFrame:CGRectMake(button.frame.origin.x + 1,
                                    button.frame.origin.y + 1,
                                    button.frame.size.width - 2,
                                    button.frame.size.height - 2)];
        button.layer.borderWidth = 0.0;
    }
}

@end
