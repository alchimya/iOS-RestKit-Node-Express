//
//  ErrorMap.m
//  iOS-RestKit-Node-Express-Client
//
//  Created by Domenico Vacchiano on 12/05/15.
//  Copyright (c) 2015 DomenicoVacchiano. All rights reserved.
//

#import "ErrorMap.h"
#import <RestKit/RestKit.h>
#import "Error.h"

@implementation ErrorMap

+(RKObjectMapping*)getObjectMapping{
    @try {
        
        // Setup our object mappings
        RKObjectMapping *map = [RKObjectMapping mappingForClass:[Error class]];
        [map addAttributeMappingsFromDictionary:@{
                                                  @"code" : @"code",
                                                  @"message" : @"message",
                                                  @"domain" : @"domain"
                                                  }];
        
        
        
        
        return map;
    }
    @catch (NSException *exception) {
        @throw exception;
    }
    
}



@end
