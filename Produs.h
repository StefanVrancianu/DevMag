//
//  Produs.h
//  DevMag
//
//  Created by Stefan Vrancianu on 17/12/15.
//  Copyright © 2015 Stefan Vrancianu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Produs : NSObject

@property (nonatomic, strong) NSString *pName;
@property (nonatomic, strong) NSNumber *pId;
@property (nonatomic, strong) NSString *pDescription;
@property (nonatomic) NSInteger pQuantity;
@property (nonatomic, strong) NSNumber *pPrice;
@property (nonatomic, strong) NSArray *pPictures;
@property (nonatomic, strong) NSString *pAvailability;

- (id) initWithName:(NSString *) pName  description:(NSString *) pDescription   pid:(NSNumber *) pID     quantity:(NSInteger) pQuantity    price:(NSNumber *) pPrice   photos:(NSArray *) pPictures     pAvailability:(NSString *) pAvailability;

- (id) initWithDictionary: (NSDictionary *) dictionary;

@end
