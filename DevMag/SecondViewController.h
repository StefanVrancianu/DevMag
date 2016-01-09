//
//  SecondViewController.h
//  DevMag
//
//  Created by Stefan Vrancianu on 17/12/15.
//  Copyright © 2015 Stefan Vrancianu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *logoutButton;

@property (weak, nonatomic) IBOutlet UILabel *settingsPageLabel;

@property (weak, nonatomic) IBOutlet UILabel *changeThemeLabel;

@property (weak, nonatomic) IBOutlet UISegmentedControl *changeThemeButton;

@property (strong, nonatomic) IBOutlet UIView *settingsView;

@end

