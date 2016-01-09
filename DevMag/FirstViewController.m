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
#import "AFHTTPRequestOperationManager.h"
#import "UIImageView+AFNetworking.h"

@interface FirstViewController ()

@property (nonatomic, strong) NSMutableArray *produse;
@property (nonatomic, strong) NSArray *jsonArray;
@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

        //--------------------------  Accesarea requestului + parsare + trimiterea datelor in celule --------------------------//
    
    self.dataSource = [[NSMutableArray alloc] init];
    
    AFHTTPRequestOperationManager *manager = [self getRequestOperationManager];
    NSString *url = @"http://demo3723180.mockable.io/GetProducts";
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject)
    {
        if([responseObject isKindOfClass:[NSArray class]])
        {   self.dataSource = responseObject;
            [self.tableViewColor reloadData];
//            NSLog(@"%@", [[self.dataSource objectAtIndex:0 ] objectForKey:@"name"]);

        }
    }
    failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        
        //Cod...
    }];
    
}

    //-------------------- Functia pentru AFNetworking Manager ---------------------//

- (AFHTTPRequestOperationManager *) getRequestOperationManager {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    return manager;
}



        //----------------------------------    Numarul de randuri din sectiune    --------------------------------------//

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataSource count];
}



        //----------------------------------    Crearea celulelor    --------------------------------------//

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = @"Identifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    
    cell.textLabel.text = [[self.dataSource objectAtIndex:indexPath.row] objectForKey:@"name"];
    cell.detailTextLabel.text = [[self.dataSource objectAtIndex:indexPath.row] objectForKey:@"description"];

    
    NSURL *urll = [NSURL URLWithString:[NSString stringWithFormat:@"%@", [[self.dataSource objectAtIndex:indexPath.row ] objectForKey:@"photos"]]];
    NSURLRequest *request = [NSURLRequest requestWithURL:urll];
    UIImage *placeholderImage = [UIImage imageNamed:@"your_placeholder"];
    
    __weak UITableViewCell *weakCell = cell;
    
    [cell.imageView setImageWithURLRequest:request
                          placeholderImage:placeholderImage
                                   success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
                                       
                                       weakCell.imageView.image = image;
                                       [weakCell setNeedsLayout];
                                       
                                   } failure:nil];
    
    
    return cell;
}

        //----------------------------------    Click pe Row    --------------------------------------//

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    NSString *message = [NSString stringWithFormat:@"Pret: %.2f\nCantitate: %ld", [[[self.dataSource objectAtIndex:indexPath.row] objectForKey:@"price"] floatValue] , [[[self.dataSource objectAtIndex:indexPath.row] objectForKey:@"qty"] integerValue]];
    
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
