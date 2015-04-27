//
//  ViewController.m
//  BMDay16LectureYahooQuotes
//
//  Created by Kunwardeep Gill on 2015-04-27.
//  Copyright (c) 2015 ProjectDGW. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.textField = [[UITextField alloc]initWithFrame:CGRectMake(20, 60, 280, 20)];
  self.textField.text = @"Insert Text Here";
  [self.view addSubview:self.textField];
  
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
