//
//  HTTPCustomer.m
//  iOS-RestKit-Node-Express-Client
//
//  Created by Domenico Vacchiano on 12/05/15.
//  Copyright (c) 2015 DomenicoVacchiano. All rights reserved.
//

#import "HTTPCustomer.h"
#import <RestKit/RestKit.h>
#import "RESTRoutes.h"
#import "HTTPRequestCallbackProtocol.h"
#import "RKHelper.h"
#import "ErrorHelper.h"
#import "Customer.h"
#import "CustomerHelper.h"
#import "CustomerMap.h"


@implementation HTTPCustomer


//consumes an Customer resource on REST service (/customers) with a GET verb
+(void)getCustomersWithDelegate:(id)delegate{
    [self getCustomerWithId:nil andDelegate:delegate];
}

//consumes an Customer resource on REST service (/customers/:id) with a GET verb
+(void)getCustomerWithId:(NSString*)customerId andDelegate:(id)delegate{
    @try {
        
        RKObjectManager *objectManager = [RKObjectManager sharedManager];
        
        
        NSString*path;
        if (customerId) {
            path=[NSString stringWithFormat:@"%@/%@",ROUTE_CUSTOMERS,customerId];

        }else{
            path=ROUTE_CUSTOMERS;
        }
        
        
        [objectManager getObject:nil path:path
                       parameters:nil
                          success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
                              
                              if (delegate != NULL && [delegate respondsToSelector:@selector(HTTPRequestCallback_Success:withSender:)]) {
                                  [delegate HTTPRequestCallback_Success:
                                   [CustomerHelper getObjectFromJSONString:operation.HTTPRequestOperation.responseString]
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

