//
//  HTTPOrders.m
//  iOS-RestKit-Node-Express-Client
//
//  Created by Domenico Vacchiano on 12/05/15.
//  Copyright (c) 2015 DomenicoVacchiano. All rights reserved.
//

#import "HTTPOrder.h"

#import <RestKit/RestKit.h>
#import "RESTRoutes.h"
#import "HTTPRequestCallbackProtocol.h"
#import "RKHelper.h"
#import "ErrorHelper.h"
#import "Order.h"
#import "OrderHelper.h"
#import "OrderMap.h"


@implementation HTTPOrder

//consumes an Order resource on REST service (/orders) with a GET verb
+(void)getOrderssWithDelegate:(id)delegate{
    [self getOrderWithId:nil andDelegate:delegate];
}
//consumes an Order resource on REST service (/orders/:id) with a GET verb
+(void)getOrderWithId:(NSString*)orderId andDelegate:(id)delegate{
    @try {
        
        RKObjectManager *objectManager = [RKObjectManager sharedManager];
        
        
        NSString*path;
        if (orderId) {
            path=[NSString stringWithFormat:@"%@/%@",ROUTE_ORDERS,orderId];
            
        }else{
            path=ROUTE_ORDERS;
        }
        
        
        [objectManager getObject:nil path:path
                      parameters:nil
                         success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
                             
                             if (delegate != NULL && [delegate respondsToSelector:@selector(HTTPRequestCallback_Success:withSender:)]) {
                                 [delegate HTTPRequestCallback_Success:
                                  [OrderHelper getObjectFromJSONString:operation.HTTPRequestOperation.responseString]
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

