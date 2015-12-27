//
//  LoginViewController.h
//  DevMag
//
//  Created by Stefan Vrancianu on 17/12/15.
//  Copyright © 2015 Stefan Vrancianu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *userTextField;
@property (strong, nonatomic) IBOutlet UITextField *passTextField;


@end
