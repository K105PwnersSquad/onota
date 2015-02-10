//
//  ViewController.m
//  onota
//
//  Created by Admin on 10.02.15.
//  Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
//

#import "Field.h"
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

Field *field;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"privet");
    [self.view setBackgroundColor:[UIColor greenColor]];
    
    field = [[Field alloc] init];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
