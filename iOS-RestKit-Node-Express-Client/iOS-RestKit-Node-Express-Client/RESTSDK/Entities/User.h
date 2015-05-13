//
//  User.h
//  iOS-RestKit-Node-Express-Client
//
//  Created by Domenico Vacchiano on 12/05/15.
//  Copyright (c) 2015 DomenicoVacchiano. All rights reserved.
//

#import <Foundation/Foundation.h>

//it maps a backend User entity (see app\entities on the backend)
@interface User : NSObject
@property (nonatomic,strong)NSString*uid;
@property (nonatomic,strong)NSString*pwd;
@property (nonatomic,strong)NSString*firstName;
@property (nonatomic,strong)NSString*lastName;
@end
