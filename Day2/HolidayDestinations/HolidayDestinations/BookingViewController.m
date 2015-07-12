//
//  BookingViewController.m
//  HolidayDestinations
//
//  Created by Admin on 12/7/15.
//  Copyright (c) 2015 iKompass. All rights reserved.
//

#import "BookingViewController.h"

@interface BookingViewController ()
@property (weak, nonatomic) IBOutlet UILabel *bookName;
@property (weak, nonatomic) IBOutlet UILabel *bookDestination;
@property (weak, nonatomic) IBOutlet UILabel *bookPrice;
@property (weak, nonatomic) IBOutlet UILabel *bookTax;
@property (weak, nonatomic) IBOutlet UILabel *bookTotal;

@end

@implementation BookingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Confirm Booking";
    self.bookName.text = self.sbookName;
    self.bookDestination.text = self.sbookDestination;
    self.bookPrice.text = self.sbookPrice;
    
    NSNumber *myTicket = [NSNumber numberWithFloat: [self.bookPrice.text floatValue]];
                       
    NSNumber *myTax = [NSNumber numberWithFloat: [myTicket floatValue] * 0.07];
    
    NSNumber *myTotal =  [NSNumber numberWithFloat:[myTicket floatValue] + [myTax floatValue]];
    
    self.bookTax.text = [NSString stringWithFormat:@"%.2f", [myTax floatValue]];
    
    self.bookTotal.text = [NSString stringWithFormat:@"%.2f",[myTotal floatValue]];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
