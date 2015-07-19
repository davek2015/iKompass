//
//  ViewController.m
//  myFavouriteMovies
//
//  Created by DK Standard on 18/7/15.
//  Copyright (c) 2015 iKompass. All rights reserved.
//

#import "ViewController.h"
#import "MovieDetailViewController.h"
#import "Movie.h"

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
    NSLog(@"I run first");
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
    
    MovieDetailViewController *mdvc = segue.destinationViewController;
    
    UITableViewCell *cell = sender;
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    
    NSDictionary *tmpDictionary = [self.movieArray objectAtIndex:indexPath.row];
    
    if ([tmpDictionary[@"name"] isEqualToString: @"Bourne Identity"]){
        mdvc.movieImage = [UIImage imageNamed:@"bourne"];
    }
}

@end
