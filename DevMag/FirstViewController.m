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
#import "AFHTTPSessionManager.h"
#import "UIImageView+AFNetworking.h"
#import <PureLayout.h>
#import "CustomTableViewCell.h"
#import "DetailsViewController.h"

@interface FirstViewController ()

@property (nonatomic, strong) NSMutableArray *produse;
@property (nonatomic, strong) NSArray *jsonArray;
@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.tableViewColor registerNib:[UINib nibWithNibName:NSStringFromClass([CustomTableViewCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([CustomTableViewCell class])];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(changeTheme1)
                                                 name:@"changeTabBarControllerBackGr1"
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(changeTheme2)
                                                 name:@"changeTabBarControllerBackGr2"
                                               object:nil];
    
   
        //--------------------------  Accesarea requestului + parsare + trimiterea datelor in celule --------------------------//
    
    self.dataSource = [[NSMutableArray alloc] init];
    
    AFHTTPSessionManager *manager = [self getRequestOperationManager];
    NSString *url = @"http://demo3723180.mockable.io/GetProducts";
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionTask * _Nonnull operation, id  _Nonnull responseObject)
    {
        if([responseObject isKindOfClass:[NSArray class]])
        {   self.dataSource = responseObject;
            [self.tableViewColor reloadData];
        }
    }
    failure:^(NSURLSessionTask * _Nullable operation, NSError * _Nonnull error) {
        
        //Cod...
    }];
    
    
}

    //-------------------- Functia pentru AFNetworking Manager ---------------------//

- (AFHTTPSessionManager *) getRequestOperationManager {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
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
    
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([CustomTableViewCell class])];
    
    if(cell == nil) {
        cell = [[CustomTableViewCell alloc] init];
    }
    
    Produs *product        =   [[Produs alloc] initWithDictionary:[self.dataSource objectAtIndex:indexPath.row]];
    
    cell.nameLabel.text    =   product.pName;
    cell.priceLabel.text   =   [NSString stringWithFormat:@"%@", product.pPrice];
    cell.stockLabel.text   =   product.pAvailability;
    
    
    
    NSURL *urll = [NSURL URLWithString:[NSString stringWithFormat:@"%@", [[[self.dataSource objectAtIndex:indexPath.row ] objectForKey:@"photos"]firstObject]]];
    NSURLRequest *request = [NSURLRequest requestWithURL:urll];
    UIImage *placeholderImage = [UIImage imageNamed:@"your_placeholder"];
    
    __weak CustomTableViewCell *weakCell = cell;
    
    [cell.imageForCell setImageWithURLRequest:request
                          placeholderImage:placeholderImage
                                   success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
                                       
                                       weakCell.imageForCell.image = image;
                                       [weakCell setNeedsLayout];
                                       
                                   } failure:nil];
    
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 79;
}

        //----------------------------------    Click pe Row    --------------------------------------//

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Produs *prod = [[Produs alloc] initWithDictionary:[self.dataSource objectAtIndex:indexPath.row]];
    DetailsViewController *dvc = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([DetailsViewController class])];
    dvc.product = prod;
    dvc.navigationItem.title = @"Informatii produs";
    [self.navigationController pushViewController:dvc animated:YES];

}

- (void) changeTheme1 {
    
    [self.tabBarController.tabBar setBackgroundColor:[UIColor redColor]];
}


- (void) changeTheme2 {
    
    [self.tabBarController.tabBar setBackgroundColor:[UIColor blueColor]];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
