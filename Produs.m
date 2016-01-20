//
//  Produs.m
//  DevMag
//
//  Created by Stefan Vrancianu on 17/12/15.
//  Copyright © 2015 Stefan Vrancianu. All rights reserved.
//

#import "Produs.h"

@implementation Produs

- (id) initWithName:(NSString *) pName  description:(NSString *) pDescription   pid:(NSNumber *) pID     quantity:(NSInteger) pQuantity    price:(NSNumber *) pPrice   photos:(NSArray *) pPictures     pAvailability:(NSString *) pAvailability {
    
    self = [super init];
    if(self) {
        self.pName              =   pName;
        self.pDescription       =   pDescription;
        self.pId                =   pID;
        self.pQuantity          =   pQuantity;
        self.pPrice             =   pPrice;
        self.pPictures          =   pPictures;
        self.pAvailability      =   pAvailability;
        
    }
    
    return self;
}

- (id) initWithDictionary: (NSDictionary *) dictionary {
    
    NSString *pName             =   [dictionary objectForKey:@"name"];
    NSString *pDescription      =   [dictionary objectForKey:@"description"];
    NSNumber *pID               =   [dictionary objectForKey:@"id"];
    NSNumber *pQuantity         =   [dictionary objectForKey:@"qty"];
    NSNumber *pPrice            =   [dictionary objectForKey:@"price"];
    NSArray *pPicture           =   [dictionary objectForKey:@"photos"];
    NSString *pAvailability     =   [dictionary objectForKey:@"disponibility"];
    
    return [ self initWithName:pName description:pDescription pid:pID quantity:[pQuantity integerValue] price:pPrice photos:pPicture pAvailability:pAvailability];
}

@end
