//
//  ViewController.m
//  MyMovies
//
//  Created by DK Standard on 19/7/15.
//  Copyright (c) 2015 iKompass. All rights reserved.
//

#import "ViewController.h"
#import "Movie.h"
#import "SelectedMovieViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property NSArray *movieArray;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    
    NSURL *url = [NSURL URLWithString:@"http://www.ikompass.com.sg/iOS.json"];
    NSURLRequest *request =  [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        //     NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        //     NSLog(@"%@", jsonString);
        
        if (!data) {
            //Display error message here
            NSLog(@"Error");
        } else {
            self.movieArray = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            
            [self.tableView reloadData];
        }
    }];
    //NSLog(@"I run first");
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

- (IBAction)onSaveButtonPressed:(UIBarButtonItem *)sender {
    
    for (NSDictionary *eachDictionary in self.movieArray){
        
        // This is how you get a ref to the entity so that you can fill details to the entity and add to the managedObjectContent
        NSManagedObject *movie = [NSEntityDescription insertNewObjectForEntityForName:@"Movie" inManagedObjectContext:self.managedObjectContext];
        
        NSString *name = [eachDictionary objectForKey:@"name"];
        [movie setValue:name forKey:@"name"];
        
        [movie setValue: [eachDictionary objectForKey:@"actor"] forKey:@"actor"];
        
        [movie setValue: [eachDictionary objectForKey:@"genre"] forKey:@"genre"];
    }
    [self.managedObjectContext save:nil];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    SelectedMovieViewController *svc = segue.destinationViewController;
    
    svc.managedObjectContext = self.managedObjectContext;
    
}

@end

