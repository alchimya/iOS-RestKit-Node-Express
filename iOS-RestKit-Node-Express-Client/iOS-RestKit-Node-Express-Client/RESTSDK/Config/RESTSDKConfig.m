//
//  RESTSDKConfig.m
//  iOS-RestKit-Node-Express-Client
//
//  Created by Domenico Vacchiano on 12/05/15.
//  Copyright (c) 2015 DomenicoVacchiano. All rights reserved.
//

#import "RESTSDKConfig.h"


@implementation RESTSDKConfig


@synthesize accountId;
@synthesize apiKey;
@synthesize remoteHost;

-(id)initWithAccountId:(NSString*)accountId andApiKey:(NSString*)apiKey andRemoteHost:(NSString*)remoteHost{
    
    self.accountId=accountId;
    self.apiKey=apiKey;
    self.remoteHost=remoteHost;
    
    return self;
}

@end
