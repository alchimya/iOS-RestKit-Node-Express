//
//  ViewController.m
//  iOS-RestKit-Node-Express-Client
//
//  Created by Domenico Vacchiano on 12/05/15.
//  Copyright (c) 2015 DomenicoVacchiano. All rights reserved.
//

#import "ViewController.h"
#import "RKHelper.h"

#import "User.h"
#import "UserMap.h"
#import "HTTPUser.h"

#import "Customer.h"
#import "CustomerMap.h"
#import "HTTPCustomer.h"

#import "Order.h"
#import "OrderMap.h"
#import "HTTPOrder.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *txtResponse;
-(IBAction)testUser:(id)sender;
-(IBAction)testCustomers:(id)sender;
-(IBAction)testCustomerWithId:(id)sender;
-(IBAction)testOrders:(id)sender;
-(IBAction)testOrderWithId:(id)sender;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - HTTPRequest Test IBActionS
-(IBAction)testUser:(id)sender{
    //loadWithUsername invokes a POST on /user/signin route
    //see HTTPUser.m for details
    [HTTPUser loadWithUsername:@"dome" andPassword:@"test" andDelegate:self];
}
-(IBAction)testCustomers:(id)sender{
    [HTTPCustomer getCustomersWithDelegate:self];
}
-(IBAction)testCustomerWithId:(id)sender{
    //I will send a customerId.
    //In a real scenario you can send a valid id to load a customer
    [HTTPCustomer getCustomerWithId:@"10001" andDelegate:self];
}
-(IBAction)testOrders:(id)sender{
    [HTTPOrder getOrderssWithDelegate:self];
}
-(IBAction)testOrderWithId:(id)sender{
    [HTTPOrder getOrderWithId:@"OD0001" andDelegate:self];
}

#pragma mark - HTTPRequestCallbackDelegate
////////////////////////////////////////////////////////////////////////
//HTTPRequestCallbackDelegate


- (void)HTTPRequestCallback_Success:(id)response withSender:(id) sender{
    
    self.txtResponse.text=nil;
     
    
    if ([sender isEqual:[HTTPUser class]]) {
        //HTTPUser request
        self.txtResponse.text=[RKHelper getJSONStringForObject:response andMapping:[UserMap getObjectMapping ]];
    }else if ([sender isEqual:[HTTPCustomer class]]) {
        //HTTPCustomer request
        if ([response isKindOfClass:[NSArray class]]) {
            self.txtResponse.text=[self getJSONStringWithObjectArray:response andMapping:[CustomerMap getObjectMapping ]];
        }else{
            self.txtResponse.text=[RKHelper getJSONStringForObject:response andMapping:[CustomerMap getObjectMapping ]];
        }
    }else if ([sender isEqual:[HTTPOrder class]]) {
        //HTTPOrder request
        if ([response isKindOfClass:[NSArray class]]) {
            self.txtResponse.text=[self getJSONStringWithObjectArray:response andMapping:[OrderMap getObjectMapping ]];
        }else{
            self.txtResponse.text=[RKHelper getJSONStringForObject:response andMapping:[OrderMap getObjectMapping ]];
        }

    }

    
}
- (void)HTTPRequestCallback_Error:(NSError*)error withSender:(id) sender{
    self.txtResponse.text=[error localizedDescription ];
}
////////////////////////////////////////////////////////////////////////

-(NSString*)getJSONStringWithObjectArray :(NSArray*)items andMapping:(id)mapping{
   
    
    @try {
        NSMutableString*ret=[[NSMutableString alloc]initWithCapacity:10];
        for (int i=0; i<items.count; i++) {
            [ret appendString:[RKHelper getJSONStringForObject:[items objectAtIndex:i] andMapping:mapping]];
        }
        return ret;
    }
    @catch (NSException *exception) {
        return nil;
    }

    
}

@end
