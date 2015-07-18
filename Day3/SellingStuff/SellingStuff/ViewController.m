//
//  ViewController.m
//  SellingStuff
//
//  Created by DK Standard on 18/7/15.
//  Copyright (c) 2015 iKompass. All rights reserved.
//

#import "ViewController.h"
#import "DataModel.h"
#import "ProductDetailViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property DataModel *dataModel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    Product *product1 = [[Product alloc] init];
    product1.name = @"Blue Jeans";
    product1.quantity = 3;
    
    Product *product2 = [[Product alloc] init];
    product2.name = @"Red T-Shirt";
    product2.quantity = 4;
    
    Product *product3 = [[Product alloc] init];
    product3.name = @"Addidas Shoes";
    product3.quantity = 1;
    
    Product *product4 = [[Product alloc] init];
    product4.name = @"Scooter";
    product4.quantity = 5;
    
    Product *product5 = [[Product alloc] init];
    product5.name = @"Mountain Bike";
    product5.quantity = 10;
    
    self.dataModel = [[DataModel alloc] init];
    
    self.dataModel.productArray = [NSMutableArray arrayWithObjects:product1, product2, product3, product4, product5, nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataModel.productArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    // this method is called for each cell. The indexPath.row will return first 0 and increments
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell" forIndexPath:indexPath];

    //cell.textLabel.text = [self.productArray objectAtIndex:indexPath.row];
    
    //Product *tmpProduct = [self.productArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = ((Product *)[self.dataModel.productArray objectAtIndex:indexPath.row]).name;
    
    //cell.detailTextLabel.text = [NSString stringWithFormat:@"%d",((Product *)[self.productArray objectAtIndex:indexPath.row]).quantity];
    // same as above
    cell.detailTextLabel.text = @(((Product *) [self.dataModel.productArray objectAtIndex:indexPath.row]).quantity).description;
    
    return cell;
    
}

- (IBAction)onTotalPressed:(UIButton *)sender {
    NSNumber *i = [self.dataModel getTotal:self.dataModel.productArray];
    self.totalLabel.text = [NSString stringWithFormat:@"%d", [i intValue]];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    ProductDetailViewController *dvc = segue.destinationViewController;
    UITableViewCell *cell = sender;
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    
    dvc.product = [self.dataModel.productArray objectAtIndex:indexPath.row];
    
}

@end
