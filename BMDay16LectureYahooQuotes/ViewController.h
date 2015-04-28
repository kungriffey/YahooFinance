//
//  ViewController.h
//  BMDay16LectureYahooQuotes
//
//  Created by Kunwardeep Gill on 2015-04-27.
//  Copyright (c) 2015 ProjectDGW. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>


//UITextField
@property (strong, nonatomic) UITextField *textField;
//NSString
@property (strong, nonatomic) NSString *quotes;
//UILabel
@property (strong, nonatomic) UILabel *myLabel;
//Quote Method
- (void)getQuote;

@end

