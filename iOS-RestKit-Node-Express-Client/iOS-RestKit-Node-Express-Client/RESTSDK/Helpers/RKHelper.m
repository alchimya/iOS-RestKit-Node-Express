//
//  RKHelper.m
//  QRPark
//
//  Created by Domenico Vacchiano on 25/03/15.
//  Copyright (c) 2015 LamCube. All rights reserved.
//

#import <RestKit/RestKit.h>
#import "RKHelper.h"

@implementation RKHelper

//returns a NSData from an entity object and a RKObjectMapping
+(NSData*)getJSONDataForObject:(id)object andMapping:(RKObjectMapping*)mapping {
    
    NSMutableDictionary *jsonDict = [NSMutableDictionary dictionary];
    
    
    RKMappingOperation *operation = [[RKMappingOperation alloc] initWithSourceObject:object
                                                                   destinationObject:jsonDict
                                                                             mapping:[mapping inverseMapping]];
    
    RKManagedObjectMappingOperationDataSource *dataSource = [RKManagedObjectMappingOperationDataSource new];
    operation.dataSource = dataSource;
    
    
    NSError *error = nil;
    [operation performMapping:&error];
    
    return [RKMIMETypeSerialization dataFromObject:jsonDict
                                                  MIMEType:RKMIMETypeJSON
                                                     error:&error];

    
}
//returns a NSDictionary from an entity object and a RKObjectMapping
+ (NSDictionary *)getJSONDictionaryForObject:(id)object andMapping:(RKObjectMapping*)mapping {
    
    NSError *error = nil;
    NSData*data=[self getJSONDataForObject:object andMapping:mapping];
    return  [NSJSONSerialization JSONObjectWithData:data
                                                         options:kNilOptions
                                                           error:&error];

    
}
//returns a NSString JSON from an entity object and a RKObjectMapping
+ (NSString *)getJSONStringForObject:(id)object andMapping:(RKObjectMapping*)mapping {
    

    NSData*data=[self getJSONDataForObject:object andMapping:mapping];
    return  [[NSString alloc] initWithData:data
                                                 encoding:NSUTF8StringEncoding];

}


//returns a RKMappingResult (entity object)  from a JSON string and  a mapping dictionary
+ (RKMappingResult *)mapJSONString:(NSString *)jsonString forType:(id)T andMappings:(NSDictionary*)mappingsDictionary{
    
    @try {
        RKMappingResult *result = nil;
        
       // NSLog(@"%@",jsonString);
        
        NSError* error;
        NSData *data = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
        id parsedData = [RKMIMETypeSerialization objectFromData:data MIMEType:RKMIMETypeJSON error:&error];
        
        
        if (parsedData == nil && error) {
            @throw [NSException exceptionWithName:error.description reason:error.localizedFailureReason userInfo:error.userInfo];
        }
        
        id obj = [[[T class] alloc] init];
        RKMapperOperation *mapper = [[RKMapperOperation alloc] initWithRepresentation:parsedData mappingsDictionary:mappingsDictionary];
        NSError *mappingError = nil;
        mapper.targetObject = obj;
        BOOL isMapped = [mapper execute:&mappingError];
        
        
        
        if (isMapped && !mappingError) {
            result = [mapper mappingResult];
        } else{
            @throw [NSException exceptionWithName:mappingError.description reason:mappingError.localizedFailureReason userInfo:mappingError.userInfo];
        }

        
        return result;

    }
    @catch (NSException *exception) {
        @throw exception;
    }

    
  }


@end
