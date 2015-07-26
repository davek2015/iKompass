//
//  ViewController.m
//  ShoppingList2
//
//  Created by DK Standard on 23/7/15.
//  Copyright (c) 2015 iKompass. All rights reserved.
//

#import "ViewController.h"
#import "Cart.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

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
    
    self.savedShoppingArray = [self.managedObjectContext executeFetchRequest:fetchRequest error:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onSaveButtonPressed:(UIButton *)sender {
    
    NSManagedObject *cart = [NSEntityDescription insertNewObjectForEntityForName:@"Cart" inManagedObjectContext:self.managedObjectContext];
    
    [cart setValue: [NSString stringWithFormat:@"%@", self.typedItem.text] forKey:@"item"];
    [cart setValue: [NSNumber numberWithBool:NO] forKey:@"done"];
    
    [self.managedObjectContext save:nil];
    [self fetchShoppingItem];
    [self.tableView reloadData];
}

- (IBAction)onClearButtonPressed:(UIButton *)sender {
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Cart" inManagedObjectContext:self.managedObjectContext];
    
    [fetchRequest setEntity:entity];
    
    //new added
    [fetchRequest setIncludesPropertyValues:NO]; // only fetch the managedObjectID
    
    NSError *error = nil;
    NSArray *fetchshop = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    for (NSManagedObject *object in fetchshop)
    {
        [self.managedObjectContext deleteObject:object];
    }
    
    error = nil;
    [self.managedObjectContext save:&error];
    
    self.savedShoppingArray = [self.managedObjectContext executeFetchRequest:fetchRequest error:nil];
    [self.tableView reloadData];
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.savedShoppingArray count];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell" forIndexPath:indexPath];
    
    NSManagedObject *managedObject = [self.savedShoppingArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [managedObject valueForKeyPath:@"item"];

    if ((BOOL)[managedObject valueForKeyPath:@"done"] == YES)
    {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Cart" inManagedObjectContext:self.managedObjectContext];
    
    [fetchRequest setEntity:entity];
    
    NSArray *fetchshop = [self.managedObjectContext executeFetchRequest:fetchRequest error:nil];
    
    NSManagedObject *object = [fetchshop objectAtIndex:indexPath.row];
    
    if ((BOOL)[object valueForKeyPath:@"done"] == YES)
    {
        [object setValue:[NSNumber numberWithBool:NO] forKey:@"done"];
    }
    else
    {
        [object setValue: [NSNumber numberWithBool:YES] forKey:@"done"];
    }
    
    [self.managedObjectContext save:nil];
    
    self.savedShoppingArray = [self.managedObjectContext executeFetchRequest:fetchRequest error:nil];

    [self.tableView reloadData];
}


@end
