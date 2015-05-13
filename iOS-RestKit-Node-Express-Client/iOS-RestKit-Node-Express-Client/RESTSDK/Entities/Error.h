//
//  Error.h
//  iOS-RestKit-Node-Express-Client
//
//  Created by Domenico Vacchiano on 12/05/15.
//  Copyright (c) 2015 DomenicoVacchiano. All rights reserved.
//

#import <Foundation/Foundation.h>

//it maps a backend Error response data
@interface Error : NSObject
@property (nonatomic,assign) int code;
@property (nonatomic,strong) NSString*message;
@property (nonatomic,strong) NSString*domain;
@end
