//
//  UserMap.m
//  iOS-RestKit-Node-Express-Client
//
//  Created by Domenico Vacchiano on 12/05/15.
//  Copyright (c) 2015 DomenicoVacchiano. All rights reserved.
//



#import <RestKit/RestKit.h>
#import "UserMap.h"
#import "User.h"


@implementation UserMap


+(RKObjectMapping*)getObjectMapping{
    @try {
        
        // Setup our object mappings
        RKObjectMapping *map = [RKObjectMapping mappingForClass:[User class]];
        [map addAttributeMappingsFromDictionary:@{
                                                  @"uid" : @"uid",
                                                  @"pwd" : @"pwd",
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
