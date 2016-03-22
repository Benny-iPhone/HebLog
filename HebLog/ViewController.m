//
//  ViewController.m
//  HebLog
//
//  Created by Benny Davidovitz
//  Copyright © 2016 Benny-iPhone. All rights reserved.
//

#import "ViewController.h"
#import "HebLog.h"

typedef enum : NSUInteger {
    LogTypeNSLog,
    LogTypeHebLog,
} LogType;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (IBAction)logSegmentedControlAction:(UISegmentedControl *)sender {
    
    NSURL *url = [NSURL URLWithString:@"http://www.hebcal.com/hebcal/?v=1&cfg=json&maj=on&min=on&mod=on&nx=on&year=now&month=x&ss=on&mf=on&c=on&geo=geoname&geonameid=3448439&m=50&s=on"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
       
        id obj = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        [self printObject:obj withLogType:sender.selectedSegmentIndex];
        
    }];
}

- (void) printObject:(id)obj withLogType:(LogType)type{
    switch (type) {
        case LogTypeNSLog:
            NSLog(@"%@",obj);
            break;
        case LogTypeHebLog:
            HebLog(@"%@",obj);
            break;
    }
}


@end
