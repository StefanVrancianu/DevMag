//
//  FirstViewController.m
//  DevMag
//
//  Created by Stefan Vrancianu on 17/12/15.
//  Copyright © 2015 Stefan Vrancianu. All rights reserved.
//

#import "FirstViewController.h"
#import "Produs.h"
#import "AppDelegate.h"

@interface FirstViewController ()

@property (nonatomic, strong) NSMutableArray *produse;
@property (nonatomic, strong) NSArray *jsonArray;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self parseJSON];
    [self makeProducts];
    
}

        //----------------------------------    Parsarea JSON    --------------------------------------//

- (void) parseJSON {
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"produs" ofType:@"json"];
    NSString *myJSON = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:NULL];
    NSError *error =  nil;
    self.jsonArray = [NSJSONSerialization JSONObjectWithData:[myJSON dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&error];
}

        //----------------------------------    Crearea obiectelor    --------------------------------------//

- (void) makeProducts {
   
    self.produse = [[NSMutableArray alloc] init];
    for(int i=0; i < [self.jsonArray count]; i++){
        
        Produs *prod = [[Produs alloc] init];
        prod.pId = [[self.jsonArray objectAtIndex:i] objectForKey:@"id"];
        prod.pName = [[self.jsonArray objectAtIndex:i] objectForKey:@"name"];
        prod.pDescription = [[self.jsonArray objectAtIndex:i] objectForKey:@"description"];
        prod.pQuantity = [[[self.jsonArray objectAtIndex:i] objectForKey:@"qty"] integerValue];
        prod.pPrice = [[self.jsonArray objectAtIndex:i] objectForKey:@"price"];
        prod.pPictures = [[self.jsonArray objectAtIndex:i] objectForKey:@"photos"];
        [self.produse addObject:prod];
        
    }

}

        //----------------------------------    Numarul de randuri din sectiune    --------------------------------------//

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.produse count];
}



        //----------------------------------    Crearea celulelor    --------------------------------------//

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = @"Identifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    
    UIImage *imagine = [UIImage imageNamed:[NSString stringWithFormat:@"%@", [[self.produse objectAtIndex:indexPath.row]pPictures ]]];
    
    
    cell.textLabel.text = [[self.produse objectAtIndex:indexPath.row] pName];
    cell.detailTextLabel.text = [[self.produse objectAtIndex:indexPath.row] pDescription];
    cell.imageView.image = imagine;
    
    
    return cell;
}

        //----------------------------------    Click pe Row    --------------------------------------//

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    NSString *message = [NSString stringWithFormat:@"Pret: %@\nCantitate: %ld", [[self.produse objectAtIndex:indexPath.row] pPrice], [[self.produse objectAtIndex:indexPath.row] pQuantity]];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Detalii produs" message:message preferredStyle:(UIAlertControllerStyleAlert)];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {}];
    
    [alert addAction:okAction];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
