//
//  CustomerMap.m
//  iOS-RestKit-Node-Express-Client
//
//  Created by Domenico Vacchiano on 12/05/15.
//  Copyright (c) 2015 DomenicoVacchiano. All rights reserved.
//



#import <RestKit/RestKit.h>
#import "CustomerMap.h"
#import "Customer.h"


@implementation CustomerMap


+(RKObjectMapping*)getObjectMapping{
    @try {
        
        // Setup our object mappings
        RKObjectMapping *map = [RKObjectMapping mappingForClass:[Customer class]];
        [map addAttributeMappingsFromDictionary:@{
                                                  @"id" : @"customerId",
                                                  @"email" : @"email",
                                                  @"firstName" : @"firstName",
                                                  @"lastName" : @"lastName"
                                                  }];
        
        
        return map;
    }
    @catch (NSException *exception) {
        @throw exception;
    }
    
}


@end