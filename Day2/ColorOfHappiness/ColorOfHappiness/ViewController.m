//
//  ViewController.m
//  ColorOfHappiness
//
//  Created by Admin on 12/7/15.
//  Copyright (c) 2015 iKompass. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property NSArray *colorArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    UIColor *red = [UIColor redColor];
    UIColor *green = [UIColor greenColor];
    UIColor *yellow = [UIColor yellowColor];
    UIColor *blue = [UIColor blueColor];
    UIColor *orange = [UIColor orangeColor];
    UIColor *gray = [UIColor grayColor];
    
    self.colorArray = [NSArray arrayWithObjects: red, green, yellow, blue, orange, gray, nil];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.colorArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell" forIndexPath:indexPath];
    
    cell.backgroundColor = [self.colorArray objectAtIndex:indexPath.row];
    
    //cell.textLabel.text = [NSString stringWithFormat:@"Row %i", indexPath.row ];
    
    /*
    if (fmod(indexPath.row+1,4) == 1){
        cell.backgroundColor = [UIColor redColor];
    } else if (fmod(indexPath.row+1,4) == 2){
        cell.backgroundColor = [UIColor greenColor];
    } else if (fmod(indexPath.row+1,4) == 3){
        cell.backgroundColor = [UIColor yellowColor];
    } else if (fmod(indexPath.row+1,4) == 0){
        cell.backgroundColor = [UIColor blueColor];
    }*/
    
    return cell;
}

@end
