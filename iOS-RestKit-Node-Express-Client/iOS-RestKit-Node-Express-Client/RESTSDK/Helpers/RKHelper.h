//
//  RKHelper.h
//  QRPark
//
//  Created by Domenico Vacchiano on 25/03/15.
//  Copyright (c) 2015 LamCube. All rights reserved.
//

#import <Foundation/Foundation.h>

//RestKit helper with some useful methods

@class RKMappingResult;
@class RKObjectMapping;
@interface RKHelper : NSObject

+ (RKMappingResult *)mapJSONString:(NSString *)jsonString forType:(id)T andMappings:(NSDictionary*)mappingsDictionary;
+ (NSString *)getJSONStringForObject:(id)object andMapping:(RKObjectMapping*)mapping;
+ (NSDictionary *)getJSONDictionaryForObject:(id)object andMapping:(RKObjectMapping*)mapping;
@end
