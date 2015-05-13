//
//  HTTPUser.h
//  iOS-RestKit-Node-Express-Client
//
//  Created by Domenico Vacchiano on 12/05/15.
//  Copyright (c) 2015 DomenicoVacchiano. All rights reserved.
//

#import <Foundation/Foundation.h>

//gateway class to interact via RestKit with our backend
@interface HTTPUser : NSObject
+(void)loadWithUsername:(NSString*)userName andPassword:(NSString*)passwprd andDelegate:(id)delegate;
@end
