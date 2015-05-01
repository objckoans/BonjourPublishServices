//
//  BonjourPublishServices.h
//  BonjourPublishServices
//
//  Created by Calvin Cheng on 1/5/15.
//  Copyright (c) 2015 Hello HQ Pte. Ltd. All rights reserved.
//

#ifndef BonjourPublishServices_BonjourPublishServices_h
#define BonjourPublishServices_BonjourPublishServices_h

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, BonjourPublishStatus) {
    BONJOURPUBLISHSTOPPED,
    BONJOURPUBLISHSTARTED
};

#define BONJOURNOTIFICATIONSTOP @"bonjourstopped"
#define BONJOURNOTIFICATIONSTART @"bonjourstarted"

@interface BonjourPublishServices : NSObject <NSNetServiceDelegate>

@property int status;
@property (strong, nonatomic) NSNetService *service;
@property (retain, nonatomic) NSString *publishedName;

-(void)startServiceOfType:(NSString *)type andPort:(int)port;
-(void)stopService;

@end

#endif
