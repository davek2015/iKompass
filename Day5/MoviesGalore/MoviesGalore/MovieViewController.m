//
//  MovieViewController.m
//  MoviesGalore
//
//  Created by DK Standard on 25/7/15.
//  Copyright (c) 2015 iKompass. All rights reserved.
//

#import "MovieViewController.h"
#import "GlobalConstants.h"
#import "WatchedMovieViewController.h"
#import "UserMovie.h"

@interface MovieViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property NSArray *movieArray;
@property NSString *userId;

@end

@implementation MovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //Get document directory
    
    NSString *documentDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    
    //Get file path
    
    NSString *filepath = [documentDirectory stringByAppendingPathComponent:@"MyFile"];
    
    //Read from file
    
    self.userId = [NSString stringWithContentsOfFile:filepath encoding:NSUTF8StringEncoding error:nil];

    NSString *urlString = [NSString stringWithFormat:@"%@%@",kBASE_URL,kGET_MOVIES];
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request =  [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        if (!data) {
            //Display error message here
            NSLog(@"Error");
        } else {
            
            NSDictionary *movieDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            
            self.movieArray = [movieDictionary objectForKey:@"movies"];
            
            [self.tableView reloadData];
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.movieArray count];
}


-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell" forIndexPath:indexPath];
    
    NSDictionary *tmpDictionary = [self.movieArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [tmpDictionary objectForKey:@"name"];
    cell.detailTextLabel.text = [tmpDictionary objectForKey:@"actor"];
    
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"UserMovie"];
    
    NSArray *moviesFromDBArray = [self.managedObjectContext executeFetchRequest:fetchRequest error:nil];
    
    for (NSDictionary *eachDictionary in self.movieArray){
        
        NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"UserMovie" inManagedObjectContext:self.managedObjectContext];
        
        UserMovie *userMovie = [[UserMovie alloc] initWithEntity:entityDescription insertIntoManagedObjectContext:nil];
        
        userMovie.name = [eachDictionary objectForKey:@"name"];
        userMovie.actor = [eachDictionary objectForKey:@"actor"];
        userMovie.genre = [eachDictionary objectForKey:@"genre"];
        userMovie.isWatched = [NSNumber numberWithInt:0];
        userMovie.movieId = [eachDictionary objectForKey:@"id"];
        
        userMovie.userId = [NSNumber numberWithLong:[self.userId longLongValue]];
    
        if (![self checkIfAlreadyInDB:userMovie listOfMovies:moviesFromDBArray]){
            NSLog(@"Inside MovieViewControll - prepareforsegue2");
            [self.managedObjectContext insertObject:userMovie];
        }
        
    }
    
    [self.managedObjectContext save:nil];
    
    WatchedMovieViewController *svc = segue.destinationViewController;
    
    svc.managedObjectContext = self.managedObjectContext;
    
    
    NSLog(@"Inside MovieViewControll - prepareforsegue3");
}

-(BOOL)checkIfAlreadyInDB:(UserMovie *)userMovie listOfMovies:(NSArray *)movieList{
    
    BOOL found = false;
    
    for (UserMovie *eachMovie in movieList){
        if (([eachMovie.movieId integerValue] == [userMovie.movieId integerValue]
            
            &&
            
            [eachMovie.userId integerValue] == [userMovie.userId integerValue])){
            
            found = true;
            break;
        }
    }
    return found;
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
