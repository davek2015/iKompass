//
//  HolidayViewController.m
//  HolidayDestinations
//
//  Created by Admin on 12/7/15.
//  Copyright (c) 2015 iKompass. All rights reserved.
//

#import "HolidayViewController.h"
#import "BookingViewController.h"

@interface HolidayViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *acctName;
@property (weak, nonatomic) IBOutlet UILabel *price;

@end

@implementation HolidayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.imageView.image = self.ImageofCountry;
    
    self.acctName.text = [NSString stringWithFormat: @"Hi %@", self.accountName];
    
    if ([self.title isEqualToString:@"Visit Australia"]){
        self.price.text = @"1000.00";
    } else {
        self.price.text = @"3000.00";
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    BookingViewController *bookingViewCont =segue.destinationViewController;
    
    if ([self.title isEqualToString:@"Visit Australia"]){    bookingViewCont.sbookDestination = @"Australia";
    } else {
        bookingViewCont.sbookDestination = @"Greece";
    }
    bookingViewCont.sbookName = self.accountName;
    bookingViewCont.sbookPrice = self.price.text;
    
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
