//
//  LoginViewController.m
//  DevMag
//
//  Created by Stefan Vrancianu on 17/12/15.
//  Copyright © 2015 Stefan Vrancianu. All rights reserved.
//

#import "LoginViewController.h"
#import "AppDelegate.h"


@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userTextField;
@property (weak, nonatomic) IBOutlet UITextField *passTextField;
@property (weak, nonatomic) IBOutlet UILabel *alertWrongUserLabel;

@end

@implementation LoginViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)loginButton:(id)sender {
    
//    FirstViewController *fvc = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([FirstViewController class])];
//    
//    [self.navigationController pushViewController:fvc animated:YES];
    
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    delegate.window.rootViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"TabBarController"];

    
}

@end
