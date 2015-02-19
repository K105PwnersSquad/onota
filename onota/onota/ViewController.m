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
        IntegerPoint *ip = [IntegerPoint integerPointWithX:i % field.fieldWidth andY:i / field.fieldWidth];
        Cell *cell = [field.gameField objectAtIndex:i];
        if (cell.cellState == CellStateEmpty) {
            continue;
        }
        [self paintCellForField:YES inPosition:ip];//        [buttons[i] addTarget:self action:@selectorpressBtn:) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:buttons[i]];
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
        IntegerPoint *ip = [IntegerPoint integerPointWithX:i % field.fieldWidth andY:i / field.fieldWidth];
        Cell *cell = [field.templateField objectAtIndex:i];
        if (cell.cellState == CellStateEmpty) {
            continue;
        }
        [self paintCellForField:NO inPosition:ip];
        //        [buttons[i] addTarget:self action:@selectorpressBtn:) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:templateButtons[i]];
    }

    UIImageView *animImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1200, 1200)];
    animImage.animationImages = [self creatAnimation:@"chest-67592_1280.jpg"];
    animImage.animationDuration = 1.0f;
    animImage.animationRepeatCount = 0;
    [self.view addSubview:animImage];
    [self.view bringSubviewToFront:animImage];
    [animImage startAnimating];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (NSArray*)creatAnimation:(NSString*)fileName {
    UIImage *image = [UIImage imageNamed:fileName];
    NSMutableArray *animationImages = [NSMutableArray new];
    NSLog(@"entered createanim");
    for (int i = 0; i<8; i++) {
        CGImageRef imageRef = CGImageCreateWithImageInRect(image.CGImage,
                                                           CGRectMake(i*100.0f, 0.0f, 100.0f, 700.0f));
        UIImage *animationImage = [UIImage imageWithCGImage:imageRef];
        NSLog(@"proc image %d %@", i, imageRef);
        [animationImages addObject:animationImage];
        CGImageRelease(imageRef);
        
    }
    
    return animationImages;
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
        [self paintCellForField:YES inPosition:field.currentPosition];
        [self changeButtonFrame:buttons[field.previousPosition.x + field.previousPosition.y * field.fieldWidth] forState:NO];
        [self changeButtonFrame:buttons[field.currentPosition.x + field.currentPosition.y * field.fieldWidth] forState:YES];
        if ([field isCorrect]) {
            [self levelCompleted];
        }
    }
}

- (IBAction)rightButtonTouch:(id)sender {
    if ([field moveRight]) {
        [self paintCellForField:YES inPosition:field.currentPosition];
        [self changeButtonFrame:buttons[field.previousPosition.x + field.previousPosition.y * field.fieldWidth] forState:NO];
        [self changeButtonFrame:buttons[field.currentPosition.x + field.currentPosition.y * field.fieldWidth] forState:YES];
        if ([field isCorrect]) {
            [self levelCompleted];
        }
    }
}

- (IBAction)leftButtonTouch:(id)sender {
    if ([field moveLeft]) {
        [self paintCellForField:YES inPosition:field.currentPosition];
        [self changeButtonFrame:buttons[field.previousPosition.x + field.previousPosition.y * field.fieldWidth] forState:NO];
        [self changeButtonFrame:buttons[field.currentPosition.x + field.currentPosition.y * field.fieldWidth] forState:YES];
        if ([field isCorrect]) {
            [self levelCompleted];
        }
    }
}

- (IBAction)downButtonTouch:(id)sender {
    if ([field moveDown]) {
        [self paintCellForField:YES inPosition:field.currentPosition];
        [self changeButtonFrame:buttons[field.previousPosition.x + field.previousPosition.y * field.fieldWidth] forState:NO];
        [self changeButtonFrame:buttons[field.currentPosition.x + field.currentPosition.y * field.fieldWidth] forState:YES];
        if ([field isCorrect]) {
            [self levelCompleted];
        }
    }
}

- (void) paintCellForField: (BOOL) game inPosition: (IntegerPoint *) ip
{
    //[buttons[buttonPosition] setBackgroundColor:[UIColor redColor]];
    int buttonPosition = ip.x + ip.y * field.fieldWidth;
    NSString *imageName;
    if (game) {
        Cell *cell = field.gameField[buttonPosition];
        switch (cell.cellState) {
            case CellStateOne:
                imageName = @"Level_1_CellStateOne_Image.jpg";
                break;
            case CellStateTwo:
                imageName = @"Level_1_CellStateTwo_Image.jpg";
                break;
            case CellStateThree:
                imageName = @"Level_1_CellStateThree_Image.jpg";
                break;
            default:
                [NSException raise:@"cell_state_exception" format:@"invalid cell state"];
                break;
        }
        [buttons[buttonPosition] setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    } else {
        Cell *cell = field.templateField[buttonPosition];
        switch (cell.cellState) {
            case CellStateOne:
                imageName = @"Level_1_CellStateOne_Image.jpg";
                break;
            case CellStateTwo:
                imageName = @"Level_1_CellStateTwo_Image.jpg";
                break;
            case CellStateThree:
                imageName = @"Level_1_CellStateThree_Image.jpg";
                break;
            default:
                [NSException raise:@"cell_state_exception" format:@"invalid cell state"];
                break;
        }
        [templateButtons[buttonPosition] setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    }
    
}

-(void) levelCompleted
{
    NSLog(@"igra okonchena, vse svobodni");
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
        }
}

@end
