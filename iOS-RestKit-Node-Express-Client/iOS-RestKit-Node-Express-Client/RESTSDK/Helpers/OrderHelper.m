//
//  OrderHelper.m
//  iOS-RestKit-Node-Express-Client
//
//  Created by Domenico Vacchiano on 12/05/15.
//  Copyright (c) 2015 DomenicoVacchiano. All rights reserved.
//



#import "OrderHelper.h"
#import <RestKit/RestKit.h>
#import "Order.h"
#import "RESTRoutes.h"
#import "RKHelper.h"
#import "OrderMap.h"

@implementation OrderHelper

//returns an array of RKResponseDescriptor

+(NSArray*)getResponseDescriptors{
    @try {
        
        RKObjectMapping*mapping=[OrderMap getObjectMapping];
        
        // Register our mappings with the provider using a response descriptor
        RKResponseDescriptor *ordersGetDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:mapping
                                                                                                   method:RKRequestMethodGET
                                                                                              pathPattern:ROUTE_ORDERS
                                                                                                  keyPath:nil
                                                                                              statusCodes:[NSIndexSet indexSetWithIndex:200]];
        
        RKResponseDescriptor *orderGetDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:mapping
                                                                                                   method:RKRequestMethodGET
                                                                                              pathPattern:[NSString stringWithFormat:@"%@/:id",ROUTE_ORDERS]
                                                                                                  keyPath:nil
                                                                                              statusCodes:[NSIndexSet indexSetWithIndex:200]];
        
        return [[NSArray alloc] initWithObjects:
                ordersGetDescriptor,
                orderGetDescriptor,
                nil];
    }
    @catch (NSException *exception) {
        @throw exception;
    }
    
}

//returns an entity object from a JSON string
+(Order*)getObjectFromJSONString:(NSString*)jsonString{
    
    @try {
        RKMappingResult*result=nil;
        
        result=[RKHelper mapJSONString:jsonString
                               forType:[Order class] andMappings:[self getResponseMappingsDictonary]];
        if (result) {
            return (Order*)[result.dictionary objectForKey:@"orders"];
        }
        return nil;
    }
    @catch (NSException *exception) {
        @throw exception;
    }
}
//private
+(NSDictionary*)getResponseMappingsDictonary{
    return @{  @"orders": [OrderMap getObjectMapping] };
}


@end
