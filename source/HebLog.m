//
//  HebLog.m
//  HebLog
//
//  Created by Benny Davidovitz
//  Copyright © 2016 Benny-iPhone. All rights reserved.
//

#import "HebLog.h"

@implementation NSString (heblog)

- (NSString *) hebrew{
    NSString* strT= [self stringByReplacingOccurrencesOfString:@"\\U" withString:@"\\u"];
    CFStringRef transform = CFSTR("Any-Hex/Java");
    CFStringTransform((__bridge CFMutableStringRef)strT, NULL, transform, YES);
    
    return strT;
}

@end

#include <stdio.h>

void HebLog(NSString *format, ...){
#ifdef DEBUG
    va_list ap;
    va_start(ap, format);
    NSString *formattedString = [[NSString alloc] initWithFormat:format arguments:ap];
    va_end(ap);
    
    NSLog(@"%@",[formattedString hebrew]);
#endif
}