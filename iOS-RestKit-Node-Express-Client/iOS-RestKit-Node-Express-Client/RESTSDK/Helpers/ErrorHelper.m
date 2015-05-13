//
//  ErrorHelper.m
//  iOS-RestKit-Node-Express-Client
//
//  Created by Domenico Vacchiano on 12/05/15.
//  Copyright (c) 2015 DomenicoVacchiano. All rights reserved.
//

#import "ErrorHelper.h"
#import <RestKit/RestKit.h>
#import "Error.h"
#import "RKHelper.h"
#import "ErrorMap.h"
@implementation ErrorHelper


+(NSError*)getObjectFromJSONString:(NSString*)jsonString andError: (NSError*)error{
    
    @try {
        if (jsonString==nil) {
            return error;
        }else{
            RKMappingResult*result=nil;
            
            result=[RKHelper mapJSONString:jsonString
                                   forType:[Error class] andMappings:[self getMappingsDictonary]];
            if (result) {
                Error*err=(Error*)[result.dictionary objectForKey:@"error"];
                if (err){
                    return [NSError errorWithDomain:err.domain
                                               code:err.code
                                           userInfo:@{NSLocalizedDescriptionKey: err.message}];
                }
                return error;
            }
            return error;
        }
    }
    @catch (NSException *exception) {
        @throw exception;
    }
    
}

//private
+(NSDictionary*)getMappingsDictonary{
    return @{  @"error": [ErrorMap getObjectMapping] };
}

@end
