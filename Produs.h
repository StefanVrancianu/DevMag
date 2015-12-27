//
//  Produs.h
//  DevMag
//
//  Created by Stefan Vrancianu on 17/12/15.
//  Copyright © 2015 Stefan Vrancianu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Produs : NSObject

@property (nonatomic, weak) NSString *pName;
@property (nonatomic, weak) NSNumber *pId;
@property (nonatomic, weak) NSString *pDescription;
@property (nonatomic) NSInteger pQuantity;
@property (nonatomic, weak) NSString *pPrice;
@property (nonatomic, strong) NSMutableArray *pPictures;


@end
