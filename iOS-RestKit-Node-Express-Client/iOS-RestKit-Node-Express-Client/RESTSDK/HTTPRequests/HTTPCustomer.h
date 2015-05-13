//
//  HTTPCustomer.h
//  iOS-RestKit-Node-Express-Client
//
//  Created by Domenico Vacchiano on 12/05/15.
//  Copyright (c) 2015 DomenicoVacchiano. All rights reserved.
//

#import <Foundation/Foundation.h>

//gateway class to interac via RestKit with our backend
@interface HTTPCustomer : NSObject
+(void)getCustomerWithId:(NSString*)customerId andDelegate:(id)delegate;
+(void)getCustomersWithDelegate:(id)delegate;
@end
