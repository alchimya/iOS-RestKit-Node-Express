//
//  UserItemHelper.h
//  iOS-RestKit-Node-Express-Client
//
//  Created by Domenico Vacchiano on 12/05/15.
//  Copyright (c) 2015 DomenicoVacchiano. All rights reserved.
//

#import <Foundation/Foundation.h>


// User entity helper

@class RKObjectMapping;
@class RKResponseDescriptor;
@class User;
@interface UserHelper : NSObject
+(NSArray*)getResponseDescriptors;
+(User*)getObjectFromJSONString:(NSString*)jsonString;

@end
