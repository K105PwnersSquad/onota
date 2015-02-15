//
//  ViewController.h
//  onota
//
//  Created by Admin on 10.02.15.
//  Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *upButton;
@property (weak, nonatomic) IBOutlet UIButton *leftButton;
@property (weak, nonatomic) IBOutlet UIButton *rightButton;
@property (weak, nonatomic) IBOutlet UIButton *downButton;
- (IBAction)upButtonTouch:(id)sender;
- (IBAction)rightButtonTouch:(id)sender;
- (IBAction)leftButtonTouch:(id)sender;
- (IBAction)downButtonTouch:(id)sender;

@end
