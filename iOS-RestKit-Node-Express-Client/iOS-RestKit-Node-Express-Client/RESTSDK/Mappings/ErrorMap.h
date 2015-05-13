//
//  ErrorMap.h
//  iOS-RestKit-Node-Express-Client
//
//  Created by Domenico Vacchiano on 12/05/15.
//  Copyright (c) 2015 DomenicoVacchiano. All rights reserved.
//

#import <Foundation/Foundation.h>

//it maps backend data

@class RKObjectMapping;
@interface ErrorMap : NSObject
+(RKObjectMapping*)getObjectMapping;
@end