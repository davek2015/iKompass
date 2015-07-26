//
//  WatchedMovieViewController.m
//  MoviesGalore
//
//  Created by DK Standard on 25/7/15.
//  Copyright (c) 2015 iKompass. All rights reserved.
//

#import "WatchedMovieViewController.h"
#import "UserMovie.h"

@interface WatchedMovieViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property NSArray *movieArray;

@property NSArray *selectedMovieArray;

@end

@implementation WatchedMovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"UserMovie" inManagedObjectContext:self.managedObjectContext];
    
    NSString *documentDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *filepath = [documentDirectory stringByAppendingPathComponent:@"MyFile"];
    
    NSString *userId = [NSString stringWithContentsOfFile:filepath encoding:NSUTF8StringEncoding error:nil];
    NSString *firstAttribute = @"userId";
    NSString *attributeValue = userId;
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K = %@", firstAttribute, attributeValue];
    
    [fetchRequest setPredicate:predicate];
    [fetchRequest setEntity:entity];
    
    self.selectedMovieArray = [self.managedObjectContext executeFetchRequest:fetchRequest error:nil];
    
//    NSLog([NSString stringWithFormat:@"%ld",[self.selectedMovieArray count]]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.selectedMovieArray count];
//    return 1;
}


-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell" forIndexPath:indexPath];
    
    UserMovie *managedObject = [self.selectedMovieArray objectAtIndex:indexPath.row];
    
    UILabel *nameLabel = (UILabel *)[cell viewWithTag:1001];
    nameLabel.text = [managedObject valueForKeyPath:@"name"];

    UILabel *actorLabel = (UILabel *)[cell viewWithTag:1002];
    actorLabel.text = [managedObject valueForKeyPath:@"actor"];
    
    if ([managedObject.isWatched intValue] > 0){
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }else{
        cell.accessoryType = UITableViewCellAccessoryNone;
    }

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UserMovie *managedObject = [self.selectedMovieArray objectAtIndex:indexPath.row];
    if ([managedObject.isWatched boolValue]) {
        
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        cell.accessoryType = UITableViewCellAccessoryNone;
        managedObject.isWatched = [NSNumber numberWithInt:0];
    }else{
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        managedObject.isWatched = [NSNumber numberWithInt:1];
    }
    
    [self.managedObjectContext save:nil];
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    
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
