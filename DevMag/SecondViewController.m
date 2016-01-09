//
//  SecondViewController.m
//  DevMag
//
//  Created by Stefan Vrancianu on 17/12/15.
//  Copyright © 2015 Stefan Vrancianu. All rights reserved.
//

#import "SecondViewController.h"
#import "AppDelegate.h"
#import "UIColor+MyColor.h"

@interface SecondViewController ()

@property (nonatomic, assign) BOOL logat;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
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

- (void) changeTheme1 {
    
    [self.tabBarController.tabBar setBackgroundColor:[UIColor redColor]];
    [self.logoutButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.settingsPageLabel setTextColor:[UIColor redColor]];
    [self.changeThemeLabel setTextColor:[UIColor redColor]];
    [self.changeThemeButton setTintColor:[UIColor redColor]];
    [self.logoutButton setBackgroundColor:[UIColor myRed]];
    
    
}


- (void) changeTheme2 {
    
    [self.tabBarController.tabBar setBackgroundColor:[UIColor blueColor]];
    [self.logoutButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.settingsPageLabel setTextColor:[UIColor blueColor]];
    [self.changeThemeLabel setTextColor:[UIColor blueColor]];
    [self.changeThemeButton setTintColor:[UIColor blueColor]];
    [self.logoutButton setBackgroundColor:[UIColor myBlue]];

    
}


- (IBAction)logoutButton:(id)sender {
    
    [self removeObjectForKey];
    self.logat = TRUE;
    [self saveLogInfo];
    
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    delegate.window.rootViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    
}
- (IBAction)switchTheme:(UISegmentedControl *)sender {
    
    if (sender.selectedSegmentIndex == 1) {

        [self changeTheme1];
        [[NSNotificationCenter defaultCenter] postNotificationName: @"changeTabBarControllerBackGr1" object:nil];
        
    }else {

        [self changeTheme2];
        [[NSNotificationCenter defaultCenter] postNotificationName: @"changeTabBarControllerBackGr2" object:nil];
    }
    
    
    
}

@end
