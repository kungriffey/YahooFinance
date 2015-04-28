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
  //initializing textfield delegate
  self.textField = [[UITextField alloc]initWithFrame:CGRectMake(20, 60, 280, 20)];
  self.textField.text = @"AAPL";
  //disable Auto Correct
  self.textField.autocorrectionType = UITextAutocorrectionTypeNo;
  //change the keyboard to Done
  self.textField.returnKeyType = UIReturnKeyDone;
  //make the keyboard disappear
  [self.view addSubview:self.textField];
  self.textField.delegate = self;

  
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

//Delegate Method to hide keyboard
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
  [self.textField resignFirstResponder];
  
  return YES;
  
}


- (void)getQuote {
  
  //stringWithFormat takes the argument in the textField and inserts it into the weblink at %@ location and saves the object as quoteAddress
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
