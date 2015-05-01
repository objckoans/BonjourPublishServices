//
//  BonjourPublishServices.m
//  BonjourPublishServices
//
//  Created by Calvin Cheng on 1/5/15.
//  Copyright (c) 2015 Hello HQ Pte. Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BonjourPublishServices.h"

@implementation BonjourPublishServices

-(void)startServiceOfType:(NSString *)type andPort:(int)port {
    self.status = BONJOURPUBLISHSTOPPED;
    // leave name as @"" so we will display the device name
    self.service = [[NSNetService alloc] initWithDomain:@"" type:type name:@"" port:port];
    if (self.service) {
        NSLog(@"Begin to setDelegate and publish");
        [self.service setDelegate:self];
        [self.service publish];
    } else {
        NSLog(@"Unable to publish");
        [[NSNotificationCenter defaultCenter] postNotificationName:BONJOURNOTIFICATIONSTOP object:nil];
    }
}

-(void)stopService {
    [self.service stop];
    [[NSNotificationCenter defaultCenter] postNotificationName:BONJOURNOTIFICATIONSTOP object:nil];
}

// 4 delegate methods

// this method is called prior to the service being published through Bonjour
-(void)netServiceWillPublish:(NSNetService *)sender {
    NSLog(@"Going to be published");
    self.status = BONJOURPUBLISHSTOPPED;
}

// this method is called once the service is published
-(void)netServiceDidPublish:(NSNetService *)sender {
    self.status = BONJOURPUBLISHSTARTED;
    self.publishedName = sender.name;
    NSLog(@"Published %@", self.publishedName);
    [[NSNotificationCenter defaultCenter] postNotificationName:BONJOURNOTIFICATIONSTART object:nil];
}

// ping the notification center if the net service fails to publish
-(void)netService:(NSNetService *)sender didNotPublish:(NSDictionary *)errorDict {
    NSLog(@"Failed to publish");
    self.status = BONJOURPUBLISHSTOPPED;
    [[NSNotificationCenter defaultCenter] postNotificationName:BONJOURNOTIFICATIONSTOP object:nil];
}

// ping the notification center if the net service stops
-(void)netServiceDidStop:(NSNetService *)sender {
    NSLog(@"Service stopped");
    self.status = BONJOURPUBLISHSTOPPED;
    [[NSNotificationCenter defaultCenter] postNotificationName:BONJOURNOTIFICATIONSTOP object:nil];
}

@end