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
  self.textField.text = @"AAPL";
  [self.view addSubview:self.textField];
  
  //Create the Label
  self.myLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 100, 280, 40)];
  self.myLabel.text = @"$0.00";
  [self.view addSubview:self.myLabel];
  
  //Create the Button
  UIButton *myButtonPressed = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  myButtonPressed.frame = CGRectMake(20, 180, 280, 40);
  [myButtonPressed setTitle:@"Get Quote" forState:UIControlStateNormal];
  [myButtonPressed addTarget:self action:@selector(getQuote) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:myButtonPressed];
}


- (void)getQuote {
  
  NSString *quoteAddress = [NSString stringWithFormat:@"http://download.finance.yahoo.com/d/quotes.csv?s=%@&f=sl1d1t1c1ohgv&e=.csv", self.textField.text];
  
  //Create a URL
  NSURL *theUrl = [[NSURL alloc]initWithString:[quoteAddress stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]];
  NSURLRequest *theRequest = [[NSURLRequest alloc]initWithURL:theUrl];
  NSURLResponse *theResponse = nil;
  
  NSError *theError = nil;
  //You are using the address for the reponse and error
  NSData *data = [NSURLConnection sendSynchronousRequest:theRequest returningResponse:&theResponse error:&theError];
  NSMutableString *contentString = [[NSMutableString alloc]initWithData:data encoding:NSUTF8StringEncoding];
  
  NSArray *arrayData = [contentString componentsSeparatedByString:@","];
  self.myLabel.text = [arrayData objectAtIndex:1];
  NSLog(@"%@", contentString);
  
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
