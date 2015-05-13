//
//  Order.h
//  iOS-RestKit-Node-Express-Client
//
//  Created by Domenico Vacchiano on 12/05/15.
//  Copyright (c) 2015 DomenicoVacchiano. All rights reserved.
//

#import <Foundation/Foundation.h>

//it maps a backend Order entity (see app\entities on the backend)
@interface Order : NSObject
@property (nonatomic,strong)NSString*orderId;
@property (nonatomic,strong)NSString*customerId;
@property (nonatomic,assign)float price;
@property (nonatomic,assign)float quantity;
@property (nonatomic,strong)NSString*itemDescription;
@end

