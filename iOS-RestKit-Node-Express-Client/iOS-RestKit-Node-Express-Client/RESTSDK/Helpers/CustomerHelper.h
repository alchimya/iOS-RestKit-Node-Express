//
//  CustomerHelper.h
//  iOS-RestKit-Node-Express-Client
//
//  Created by Domenico Vacchiano on 12/05/15.
//  Copyright (c) 2015 DomenicoVacchiano. All rights reserved.
//

#import <Foundation/Foundation.h>

// Customer entity helper
@class RKObjectMapping;
@class RKResponseDescriptor;
@class Customer;
@interface CustomerHelper : NSObject
+(NSArray*)getResponseDescriptors;
+(Customer*)getObjectFromJSONString:(NSString*)jsonString;
@end
