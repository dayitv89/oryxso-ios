//
//  OXRESTAPIClient.m
//  oryxso
//
//  Created by gauravds on 29/05/17.
//  Copyright © 2017 Oryxso workgroup. All rights reserved.
//

#import "OXRESTAPIClient.h"


@interface OXRESTAPIClient ()

@end


@implementation OXRESTAPIClient

+ (instancetype)sharedInstance {
    return [self clientWithBaseURL:nil];
}


+ (instancetype)clientWithBaseURL:(NSString*)url {
    static dispatch_once_t oncePredicate = 0;
    static id sharedInstance = nil;
    dispatch_once(&oncePredicate, ^{
        NSURL *nsurl = url ? [NSURL URLWithString:url] : nil;
        sharedInstance = [[self alloc] initWithBaseURL:nsurl];
    });
    return sharedInstance;
}


+ (void)setBaseURL:(NSString*)baseURL {
    [self clientWithBaseURL:baseURL];
}

- (void)sendResponse:(id)responseObj isSuccess:(BOOL)success toBlock:(ResponseBlock _Nullable)response {
    if (response) {
        success ? response(YES, responseObj, nil) : response(NO, nil, responseObj);
    }
}


- (NSURLSessionDataTask*)GET:(NSString*_Nullable)uri
                      params:(nullable id)parameters
                    response:(ResponseBlock _Nullable)response {
    return [self GET:uri
          parameters:parameters
            progress:nil
             success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                 [self sendResponse:responseObject isSuccess:YES toBlock:response];
             }
             failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                 [self sendResponse:error isSuccess:NO toBlock:response];
             }];
}

@end
