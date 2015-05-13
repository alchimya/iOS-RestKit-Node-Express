//
//  OrderMap.m
//  iOS-RestKit-Node-Express-Client
//
//  Created by Domenico Vacchiano on 12/05/15.
//  Copyright (c) 2015 DomenicoVacchiano. All rights reserved.
//

#import <RestKit/RestKit.h>
#import "OrderMap.h"
#import "Order.h"


@implementation OrderMap


+(RKObjectMapping*)getObjectMapping{
    @try {
        
        // Setup our object mappings
        RKObjectMapping *map = [RKObjectMapping mappingForClass:[Order class]];
        [map addAttributeMappingsFromDictionary:@{
                                                  @"id" : @"orderId",
                                                  @"customerId" : @"customerId",
                                                  @"price" : @"price",
                                                  @"quantity" : @"quantity",
                                                  @"description" : @"itemDescription"
                                                  }];
        
        
        return map;
    }
    @catch (NSException *exception) {
        @throw exception;
    }
    
}


@end