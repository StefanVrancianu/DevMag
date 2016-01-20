//
//  DetailsViewController.h
//  DevMag
//
//  Created by Stefan Vrancianu on 14/01/16.
//  Copyright © 2016 Stefan Vrancianu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Produs.h"

@interface DetailsViewController : UIViewController <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *detailDetails;
@property (weak, nonatomic) IBOutlet UILabel *priceDetails;
@property (weak, nonatomic) IBOutlet UILabel *disponibilityDetails;
@property (weak, nonatomic) IBOutlet UIScrollView *imageScrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageController;
@property (strong, nonatomic) Produs *product;

@end
