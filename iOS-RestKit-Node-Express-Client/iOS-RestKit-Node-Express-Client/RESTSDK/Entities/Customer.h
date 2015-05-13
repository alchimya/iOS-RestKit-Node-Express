//
//  Customer.h
//  iOS-RestKit-Node-Express-Client
//
//  Created by Domenico Vacchiano on 12/05/15.
//  Copyright (c) 2015 DomenicoVacchiano. All rights reserved.
//

#import <Foundation/Foundation.h>

//it maps a backend Customer entity (see app\entities on the backend)
@interface Customer : NSObject
@property (nonatomic,strong)NSString*customerId;
@property (nonatomic,strong)NSString*firstName;
@property (nonatomic,strong)NSString*lastName;
@property (nonatomic,strong)NSString*email;
@end
