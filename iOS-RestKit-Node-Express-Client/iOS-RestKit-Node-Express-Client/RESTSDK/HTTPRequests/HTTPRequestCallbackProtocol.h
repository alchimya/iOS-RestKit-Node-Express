//
//  HTTPRequestCallbackProtocol.h
//  iOS-RestKit-Node-Express-Client
//
//  Created by Domenico Vacchiano on 12/05/15.
//  Copyright (c) 2015 DomenicoVacchiano. All rights reserved.
//

#ifndef iOS_RestKit_Node_Express_Client_HTTPRequestCallbackProtocol_h
#define iOS_RestKit_Node_Express_Client_HTTPRequestCallbackProtocol_h

#import "Error.h"

@protocol HTTPRequestCallbackDelegate <NSObject>

@optional
- (void)HTTPRequestCallback_Success:(id)response withSender:(id) sender;
- (void)HTTPRequestCallback_Error:(NSError*)error withSender:(id) sender;
@end

#endif
