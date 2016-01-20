//
//  DetailsViewController.m
//  DevMag
//
//  Created by Stefan Vrancianu on 14/01/16.
//  Copyright © 2016 Stefan Vrancianu. All rights reserved.
//

#import "DetailsViewController.h"
#import "UIImageView+AFNetworking.h"
#import "Produs.h"

@interface DetailsViewController ()

{NSNumber *width; NSNumber *heigth;}

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect frame = [self.imageScrollView frame];
    self->width  = [[NSNumber alloc] initWithDouble: frame.size.width];
    self->heigth = [[NSNumber alloc] initWithDouble: frame.size.height];
    
    self.imageScrollView.delegate = self;
    
    self.pageController.numberOfPages = [self.product.pPictures count];
    self.pageController.currentPage   = 0;
    
    [self.detailDetails setText:[NSString stringWithFormat:@"%@", self.product.pDescription]];
    [self.priceDetails setText:[NSString stringWithFormat:@"%@", self.product.pPrice]];
    [self.disponibilityDetails setText:[NSString stringWithFormat:@"%@", self.product.pAvailability]];
    
    [self getPictures];
    [self.view addSubview: self.imageScrollView];
    [self.view addSubview: self.pageController];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) getPictures {
    
    self.imageScrollView.contentSize = CGSizeMake(self->width.intValue * [self.product.pPictures count], self->heigth.intValue);
    
    for (int i = 0; i < [self.product.pPictures count]; i++){
        
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@", [self.product.pPictures objectAtIndex:i]]];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        UIImage *placeholderImage = [UIImage imageNamed:@"your_placeholder"];
        
        UIImageView *image1 = [[UIImageView alloc] initWithFrame:CGRectMake(self->width.intValue * i, 0, self->width.intValue, self->heigth.intValue)];
        __weak UIImageView *image2 = image1;

        
        [image1 setImageWithURLRequest:request
                                 placeholderImage:placeholderImage
                                          success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
                                              
                                               image2.image = image;
                                              [image2 setNeedsLayout];
                                              
                                          } failure:nil];
        [self.imageScrollView addSubview:image1];
        
    }
}

#pragma mark - ScrollViewDelegate methods

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (scrollView == self.imageScrollView) {
        self.pageController.currentPage = (int)(scrollView.contentOffset.x/self->width.intValue);
    }
}

@end
