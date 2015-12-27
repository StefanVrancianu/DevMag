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
@property (nonatomic, assign) BOOL logat;

@end

static NSString *userName = @"Stefan";
static NSString *passWord = @"mafiotu";

@implementation LoginViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void) saveLogInfo {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setBool:self.logat forKey:@"kLogInfo"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void) removeObjectForKey {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey:@"kLogInfo"];
    [userDefaults synchronize];
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
    
    if([self.userTextField.text isEqualToString:userName] && [self.passTextField.text isEqualToString:passWord]) {
        
        [self removeObjectForKey];
        self.logat = FALSE;
        [self saveLogInfo];
        
        AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        delegate.window.rootViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"TabBarController"];
        
    }
    else {
        [self.alertWrongUserLabel setText:@"Incorrect username or password !"];
    }
    


    
}

@end
