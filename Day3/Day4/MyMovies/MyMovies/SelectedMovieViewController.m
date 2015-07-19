//
//  SelectedMovieViewController.m
//  MyMovies
//
//  Created by DK Standard on 19/7/15.
//  Copyright (c) 2015 iKompass. All rights reserved.
//

#import "SelectedMovieViewController.h"
#import "Movie.h"

@interface SelectedMovieViewController () <UITableViewDataSource, UITableViewDelegate>

@property NSArray *selectedMovieArray;

@end

@implementation SelectedMovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Movie" inManagedObjectContext:self.managedObjectContext];
    
    [fetchRequest setEntity:entity];
    self.selectedMovieArray = [self.managedObjectContext executeFetchRequest:fetchRequest error:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.selectedMovieArray count];
}


-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell2" forIndexPath:indexPath];
    
    NSManagedObject *managedObject = [self.selectedMovieArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [managedObject valueForKeyPath:@"name"];
    cell.detailTextLabel.text = [managedObject valueForKeyPath:@"actor"];
    
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
