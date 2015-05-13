//
//  ErrorHelper.h
//  iOS-RestKit-Node-Express-Client
//
//  Created by Domenico Vacchiano on 12/05/15.
//  Copyright (c) 2015 DomenicoVacchiano. All rights reserved.
//

#import <Foundation/Foundation.h>

// Error entity helper
@class RKObjectMapping;
@class Error;
@interface ErrorHelper : NSObject
+(NSError*)getObjectFromJSONString:(NSString*)jsonString andError: (NSError*)error;
@end
