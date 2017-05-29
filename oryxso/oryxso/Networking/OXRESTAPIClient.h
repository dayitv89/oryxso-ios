//
//  OXRESTAPIClient.h
//  oryxso
//
//  Created by gauravds on 29/05/17.
//  Copyright © 2017 Oryxso workgroup. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

typedef void (^ResponseBlock)(BOOL isSuccess, id _Nullable success, NSError * _Nullable error);


@interface OXRESTAPIClient : AFHTTPSessionManager

+ (instancetype _Nonnull )sharedInstance;
+ (void)setBaseURL:(NSString*_Nonnull)baseURL;

- (NSURLSessionDataTask*_Nullable)GET:(NSString*_Nullable)uri
                               params:(nullable id)parameters
                             response:(ResponseBlock _Nullable)response;

@end
