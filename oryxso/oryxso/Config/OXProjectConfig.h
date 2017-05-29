//
//  OXProjectConfig.h
//  oryxso
//
//  Created by gauravds on 29/05/17.
//  Copyright © 2017 Oryxso workgroup. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OXProjectConfig : NSObject

@property (nonatomic, readonly) BOOL sandbox;

+ (instancetype)sharedInstance;
- (void)setNetworkClient:(NSString*)baseURL isSandbox:(BOOL)sandbox;

@end
