//
//  main.m
//  BonjourPublishServices
//
//  Created by Calvin Cheng on 1/5/15.
//  Copyright (c) 2015 Hello HQ Pte. Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BonjourPublishServices.h"

int main(int argc, const char * argv[]) {

    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        BonjourPublishServices *pubService = [[BonjourPublishServices alloc] init];
        [pubService startServiceOfType:@"_HTTP._tcp." andPort:9711];

        // Use an NSRunLoop to simulate our application lifecyle
        [[NSRunLoop currentRunLoop] run];
        
    }
    

    return 0;
}
