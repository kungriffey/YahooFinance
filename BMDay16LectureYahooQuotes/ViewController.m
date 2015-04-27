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
  
  //Create the Label
  self.myLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 100, 280, 40)];
  [self.view addSubview:self.myLabel];
  
  //Create the Button
  UIButton *myButtonPressed = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  myButtonPressed.frame = CGRectMake(20, 180, 280, 40);
  [self.view addSubview:myButtonPressed];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
