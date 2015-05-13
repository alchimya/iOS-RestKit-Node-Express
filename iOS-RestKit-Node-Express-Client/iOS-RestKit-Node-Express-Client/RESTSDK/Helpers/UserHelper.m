//
//  UserItemHelper.m
//  iOS-RestKit-Node-Express-Client
//
//  Created by Domenico Vacchiano on 12/05/15.
//  Copyright (c) 2015 DomenicoVacchiano. All rights reserved.
//

#import "UserHelper.h"
#import <RestKit/RestKit.h>

#import "User.h"
#import "RESTRoutes.h"
#import "RKHelper.h"
#import "UserMap.h"

@implementation UserHelper

//returns an array of RKResponseDescriptor
+(NSArray*)getResponseDescriptors{
    @try {
        
        RKObjectMapping*mapping=[UserMap getObjectMapping];
        
        // Register our mappings with the provider using a response descriptor
        RKResponseDescriptor *signInPostDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:mapping
                                                                                                  method:RKRequestMethodPOST
                                                                                             pathPattern:ROUTE_USER_SIGNIN
                                                                                                 keyPath:nil
                                                                                             statusCodes:[NSIndexSet indexSetWithIndex:200]];
        
        
        return [[NSArray alloc] initWithObjects:
                signInPostDescriptor,
                nil];
    }
    @catch (NSException *exception) {
        @throw exception;
    }
    
}

//returns an entity object from a JSON string
+(User*)getObjectFromJSONString:(NSString*)jsonString{
    
    @try {
        RKMappingResult*result=nil;
        
        result=[RKHelper mapJSONString:jsonString
                               forType:[User class] andMappings:[self getResponseMappingsDictonary]];
        if (result) {
            return (User*)[result.dictionary objectForKey:@"user"];
        }
        return nil;
    }
    @catch (NSException *exception) {
        @throw exception;
    }
}

//private
+(NSDictionary*)getResponseMappingsDictonary{
    return @{  @"user": [UserMap getObjectMapping] };
}


@end
