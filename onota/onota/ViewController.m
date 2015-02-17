//
//  ViewController.m
//  onota
//
//  Created by Admin on 10.02.15.
//  Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
//
#define SCREEN_WIDTH (UIInterfaceOrientationIsPortrait([UIApplication sharedApplication].statusBarOrientation) ? [[UIScreen mainScreen] bounds].size.width : [[UIScreen mainScreen] bounds].size.height)
#define SCREEN_HEIGHT (UIInterfaceOrientationIsPortrait([UIApplication sharedApplication].statusBarOrientation) ? [[UIScreen mainScreen] bounds].size.height : [[UIScreen mainScreen] bounds].size.width)
#import "Field.h"
#import "ViewController.h"
#import "Cell.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

@end

@implementation ViewController

NSMutableArray *buttons;
NSMutableArray *templateButtons;

Field *field;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"privet");
//    [self.view setBackgroundColor:[UIColor blueColor]];
    
    field = [[Field alloc] init];
    buttons = [NSMutableArray new];
    templateButtons = [NSMutableArray new];
    
    int cellWidthField = SCREEN_WIDTH * 7 / 12 / field.fieldWidth;
    
    CGPoint fieldStartPoint = CGPointMake(SCREEN_WIDTH * 1 / 8,
                                           SCREEN_HEIGHT * 1.5 / 17);
    
    for (int i = 0; i < field.fieldWidth * field.fieldHeight; i++) {
        buttons[i] = [[UIButton alloc] initWithFrame:CGRectMake(fieldStartPoint.x + i % field.fieldWidth * (cellWidthField + 1),
                                                                fieldStartPoint.y + i / field.fieldWidth * (cellWidthField + 1),
                                                                cellWidthField - 1,
                                                                cellWidthField - 1)];
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
    UIButton *button = buttons[field.initialPosition.x + field.initialPosition.y * field.fieldWidth ];
    [self changeButtonFrame:button forState:YES];
    
    int cellWidthTemplate = SCREEN_HEIGHT / 5 / field.fieldWidth;
    CGPoint templateStartPoint = CGPointMake(SCREEN_WIDTH * 25 / 32,
                                             SCREEN_HEIGHT * 1 / 16);
    
    for (int i = 0; i < field.fieldWidth * field.fieldHeight; i++) {
        templateButtons[i] = [[UIButton alloc] initWithFrame:CGRectMake(templateStartPoint.x + i % field.fieldWidth * (cellWidthTemplate + 1),
                                                                templateStartPoint.y + i / field.fieldWidth * (cellWidthTemplate + 1),
                                                                cellWidthTemplate - 1,
                                                                cellWidthTemplate - 1)];
        Cell *cell = [field.templateField objectAtIndex:i];
        BOOL isEmpty = NO;
        switch (cell.cellState) {
            case CellStateOne:
                [templateButtons[i] setBackgroundColor:[UIColor redColor]];
                break;
            case CellStateTwo:
                [templateButtons[i] setBackgroundColor:[UIColor greenColor]];
                break;
            case CellStateThree:
                [templateButtons[i] setBackgroundColor:[UIColor blueColor]];
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
            [self.view addSubview:templateButtons[i]];
        }
    }
    for (int i = 0; i < field.fieldHeight * field.fieldWidth; i++) {
        UIButton *button = buttons[i];
        UIImage *lvlImage = [UIImage imageNamed:@"chest-67592_1280.jpg"];
        CGImageRef bigImage = lvlImage.CGImage;
        CGImageRef partOfBigImage =
            CGImageCreateWithImageInRect(bigImage,
                                    CGRectMake(lvlImage.size.width / field.fieldWidth * (i % field.fieldWidth),
                                               lvlImage.size.height / field.fieldHeight * (i / field.fieldWidth),
                                                lvlImage.size.width / field.fieldWidth,
                                                lvlImage.size.height / field.fieldHeight));
        
        UIImage *partOfImage = [UIImage imageWithCGImage:partOfBigImage];
        [button setImage:partOfImage forState:UIControlStateNormal];
        UIButton *templateButton = templateButtons[i];
        [templateButton setImage:partOfImage forState:UIControlStateNormal];
    }
    
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

- (IBAction)upButtonTouch:(id)sender {
    if ([field moveUp]) {
        [self paintCell:field.currentPosition];
        [self changeButtonFrame:buttons[field.previousPosition.x + field.previousPosition.y * field.fieldWidth] forState:NO];
        [self changeButtonFrame:buttons[field.currentPosition.x + field.currentPosition.y * field.fieldWidth] forState:YES];
        if ([field isCorrect]) {
            [self levelCompleted];
        }
    }
}

- (IBAction)rightButtonTouch:(id)sender {
    if ([field moveRight]) {
        [self paintCell:field.currentPosition];
        [self changeButtonFrame:buttons[field.previousPosition.x + field.previousPosition.y * field.fieldWidth] forState:NO];
        [self changeButtonFrame:buttons[field.currentPosition.x + field.currentPosition.y * field.fieldWidth] forState:YES];
        if ([field isCorrect]) {
            [self levelCompleted];
        }
    }
}

- (IBAction)leftButtonTouch:(id)sender {
    if ([field moveLeft]) {
        [self paintCell:field.currentPosition];
        [self changeButtonFrame:buttons[field.previousPosition.x + field.previousPosition.y * field.fieldWidth] forState:NO];
        [self changeButtonFrame:buttons[field.currentPosition.x + field.currentPosition.y * field.fieldWidth] forState:YES];
        if ([field isCorrect]) {
            [self levelCompleted];
        }
    }
}

- (IBAction)downButtonTouch:(id)sender {
    if ([field moveDown]) {
        [self paintCell:field.currentPosition];
        [self changeButtonFrame:buttons[field.previousPosition.x + field.previousPosition.y * field.fieldWidth] forState:NO];
        [self changeButtonFrame:buttons[field.currentPosition.x + field.currentPosition.y * field.fieldWidth] forState:YES];
        if ([field isCorrect]) {
            [self levelCompleted];
        }
    }
}

- (void) paintCell: (IntegerPoint *) ip
{
    int buttonPosition = ip.x + ip.y * field.fieldWidth;
    Cell *cell = field.gameField[buttonPosition];
    switch (cell.cellState) {
        case CellStateOne:
            [buttons[buttonPosition] setBackgroundColor:[UIColor redColor]];
            break;
        case CellStateTwo:
            [buttons[buttonPosition] setBackgroundColor:[UIColor greenColor]];
            break;
        case CellStateThree:
            [buttons[buttonPosition] setBackgroundColor:[UIColor blueColor]];
            break;
        default:
            [NSException raise:@"cell_state_exception" format:@"invalid cell state"];
            break;
    }
}

-(void) levelCompleted
{
    NSLog(@"igra okonchena, vse svobodni");
}

@end
