//
//  RESTSDK.h
//  iOS-RestKit-Node-Express-Client
//
//  Created by Domenico Vacchiano on 12/05/15.
//  Copyright (c) 2015 DomenicoVacchiano. All rights reserved.
//

#import <Foundation/Foundation.h>



#import "RESTSDKConfig.h"

//a singleton class to configure RestKit access with RESTSDKConfig data
@interface RESTSDK : NSObject

@property (nonatomic,strong)RESTSDKConfig*configuration;
+ (instancetype)sharedInstance;
-(void)startWithConfiguration:(RESTSDKConfig*)configuration;
@end
