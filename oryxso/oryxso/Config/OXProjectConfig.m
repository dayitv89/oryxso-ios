//
//  OXProjectConfig.m
//  oryxso
//
//  Created by gauravds on 29/05/17.
//  Copyright © 2017 Oryxso workgroup. All rights reserved.
//

#import "OXProjectConfig.h"
#import "OXRESTAPIClient.h"

@interface OXProjectConfig ()

@property (nonatomic) BOOL sandbox;

@end


@implementation OXProjectConfig

+ (instancetype)sharedInstance {
    static dispatch_once_t oncePredicate = 0;
    static id sharedInstance = nil;
    dispatch_once(&oncePredicate, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (void)setNetworkClient:(NSString*)baseURL isSandbox:(BOOL)sandbox {
    [OXRESTAPIClient setBaseURL:baseURL];
    [self setSandbox:sandbox];
}

@end
