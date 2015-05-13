//
//  OrderHelper.h
//  iOS-RestKit-Node-Express-Client
//
//  Created by Domenico Vacchiano on 12/05/15.
//  Copyright (c) 2015 DomenicoVacchiano. All rights reserved.
//

#import <Foundation/Foundation.h>

// Order entity helper
@class RKObjectMapping;
@class RKResponseDescriptor;
@class Order;
@interface OrderHelper : NSObject
+(NSArray*)getResponseDescriptors;
+(Order*)getObjectFromJSONString:(NSString*)jsonString;

@end
