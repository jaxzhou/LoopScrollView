//
//  ViewController.m
//  LoopScrollView
//
//  Created by Zhou Jinxiu on 13-8-23.
//  Copyright (c) 2013年 Zhou Jinxiu. All rights reserved.
//

#import "ViewController.h"
#import "LoopScrollView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    loopview =[[LoopScrollView alloc] initWithFrame:CGRectMake(0, 50, 320, 150)];
    [self.view addSubview:loopview];
    for (int i = 0; i < 5; i ++) {
        UIView *sub = [[UIView alloc] initWithFrame:CGRectMake(i*100+1, 0, 98, 50)];
        [sub setBackgroundColor:[UIColor grayColor]];
        UILabel *l = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 98, 50)];
        [l setBackgroundColor:[UIColor clearColor]];
        [l setText:[NSString stringWithFormat:@"%d",i]];
        [l setTextColor:[UIColor whiteColor]];
        [sub addSubview:l];
        [loopview addSubview:sub];
    }
    [loopview setContentSize:CGSizeMake(500, 50)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
