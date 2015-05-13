//
//  CustomerHelper.m
//  iOS-RestKit-Node-Express-Client
//
//  Created by Domenico Vacchiano on 12/05/15.
//  Copyright (c) 2015 DomenicoVacchiano. All rights reserved.
//

#import "CustomerHelper.h"

#import <RestKit/RestKit.h>

#import "Customer.h"
#import "RESTRoutes.h"
#import "RKHelper.h"
#import "CustomerMap.h"

@implementation CustomerHelper

//returns an array of RKResponseDescriptor
+(NSArray*)getResponseDescriptors{
    @try {
        
        RKObjectMapping*mapping=[CustomerMap getObjectMapping];
        
        // Register our mappings with the provider using a response descriptor
        RKResponseDescriptor *customersGetDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:mapping
                                                                                                  method:RKRequestMethodGET
                                                                                             pathPattern:ROUTE_CUSTOMERS
                                                                                                 keyPath:nil
                                                                                             statusCodes:[NSIndexSet indexSetWithIndex:200]];
        
        RKResponseDescriptor *customerGetDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:mapping
                                                                                                   method:RKRequestMethodGET
                                                                                              pathPattern:[NSString stringWithFormat:@"%@/:id",ROUTE_CUSTOMERS]
                                                                                                  keyPath:nil
                                                                                              statusCodes:[NSIndexSet indexSetWithIndex:200]];
        
        return [[NSArray alloc] initWithObjects:
                customersGetDescriptor,
                customerGetDescriptor,
                nil];
    }
    @catch (NSException *exception) {
        @throw exception;
    }
    
}

//returns an entity object from a JSON string
+(Customer*)getObjectFromJSONString:(NSString*)jsonString{
    
    @try {
        RKMappingResult*result=nil;
        
        result=[RKHelper mapJSONString:jsonString
                               forType:[Customer class] andMappings:[self getResponseMappingsDictonary]];
        if (result) {
            return (Customer*)[result.dictionary objectForKey:@"customers"];
        }
        return nil;
    }
    @catch (NSException *exception) {
        @throw exception;
    }
}
//private
+(NSDictionary*)getResponseMappingsDictonary{
    return @{  @"customers": [CustomerMap getObjectMapping] };
}



@end
