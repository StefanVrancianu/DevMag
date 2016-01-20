//
//  CustomTableViewCell.h
//  DevMag
//
//  Created by Stefan Vrancianu on 14/01/16.
//  Copyright © 2016 Stefan Vrancianu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageForCell;
@property (weak, nonatomic) IBOutlet UILabel *stockLabel;

@end
