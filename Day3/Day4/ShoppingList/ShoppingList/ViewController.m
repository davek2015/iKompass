//
//  ViewController.m
//  ShoppingList
//
//  Created by DK Standard on 19/7/15.
//  Copyright (c) 2015 iKompass. All rights reserved.
//

#import "ViewController.h"
#import "Cart.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *typedItem;
@property NSArray *savedShoppingArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self fetchShoppingItem];
}

- (void)fetchShoppingItem {
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Cart" inManagedObjectContext:self.managedObjectContext];
    
    [fetchRequest setEntity:entity];
    self.savedShoppingArray = [self.managedObjectContext executeFetchRequest:fetchRequest error:nil];}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onSaveButtonPressed:(UIButton *)sender {
    
    NSManagedObject *cart = [NSEntityDescription insertNewObjectForEntityForName:@"Cart" inManagedObjectContext:self.managedObjectContext];

    [cart setValue: [NSString stringWithFormat:@"%@", self.typedItem.text] forKey:@"item"];
    
    [self.managedObjectContext save:nil];
    [self fetchShoppingItem];
    [self.tableView reloadData];
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.savedShoppingArray count];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell" forIndexPath:indexPath];
    
    NSManagedObject *managedObject = [self.savedShoppingArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [managedObject valueForKeyPath:@"item"];
    
    return cell;
}

@end
