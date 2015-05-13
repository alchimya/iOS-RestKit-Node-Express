//
//  HTTPUser.m
//  iOS-RestKit-Node-Express-Client
//
//  Created by Domenico Vacchiano on 12/05/15.
//  Copyright (c) 2015 DomenicoVacchiano. All rights reserved.
//

#import "HTTPUser.h"

#import <RestKit/RestKit.h>
#import "RESTRoutes.h"
#import "HTTPRequestCallbackProtocol.h"
#import "RKHelper.h"
#import "ErrorHelper.h"
#import "User.h"
#import "UserHelper.h"
#import "UserMap.h"


@implementation HTTPUser

//consumes an User resource on REST service (/signin) with a POST verb
+(void)loadWithUsername:(NSString*)userName andPassword:(NSString*)passwprd andDelegate:(id)delegate{
    @try {
        
        RKObjectManager *objectManager = [RKObjectManager sharedManager];
        
        NSDictionary *pamars = [NSDictionary dictionaryWithObjectsAndKeys:
                                userName,@"uid",passwprd,@"pwd", nil];
        
        
        
        [objectManager postObject:nil path:ROUTE_USER_SIGNIN
                       parameters:pamars
                          success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
                              
                              if (delegate != NULL && [delegate respondsToSelector:@selector(HTTPRequestCallback_Success:withSender:)]) {
                                  [delegate HTTPRequestCallback_Success:
                                   [UserHelper getObjectFromJSONString:operation.HTTPRequestOperation.responseString]
                                                     withSender:self
                                   ];
                              }
                              
                              
                          }
                          failure:^(RKObjectRequestOperation *operation, NSError *error) {
                              
                              if (delegate != NULL && [delegate respondsToSelector:@selector(HTTPRequestCallback_Error:withSender:)]) {
                                  [delegate HTTPRequestCallback_Error:
                                   [ErrorHelper getObjectFromJSONString:
                                    operation.HTTPRequestOperation.responseString andError:error]
                                                   withSender:self
                                   ];
                              }
                              
                          }];
        
        
        
        
    }
    @catch (NSException *exception) {
        @throw exception;
    }

}

@end
