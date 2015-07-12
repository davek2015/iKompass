//
//  ViewController.m
//  HolidayDestinations
//
//  Created by Admin on 12/7/15.
//  Copyright (c) 2015 iKompass. All rights reserved.
//

#import "HomeViewController.h"
#import "HolidayViewController.h"

@interface HomeViewController ()

@property (weak, nonatomic) IBOutlet UITextField *AcctName;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    HolidayViewController *destinationViewController = segue.destinationViewController;
    
    destinationViewController.title = [sender currentTitle];
    destinationViewController.accountName = self.AcctName.text;
    
    if ([segue.identifier isEqualToString:@"australia"]) {
        destinationViewController.ImageofCountry = [UIImage imageNamed:@"australia"];
        
        // destinationViewController.view.backgroundColor = [UIColor greenColor];
    } else {
        destinationViewController.ImageofCountry = [UIImage imageNamed:@"greece"];
        
        //destinationViewController.view.backgroundColor = [UIColor blueColor];
    }
    
}

-(IBAction)unwindToThisViewController:(UIStoryboardSegue *)segue{
    
}

@end
