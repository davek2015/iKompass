//
//  ViewController.m
//  Multiply
//
//  Created by Admin on 11/7/15.
//  Copyright (c) 2015 iKompass. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *numberTextField;

@property (weak, nonatomic) IBOutlet UILabel *multiplierLabel;

@property (weak, nonatomic) IBOutlet UILabel *answerLabel;

@property (weak, nonatomic) IBOutlet UISlider *myslider;

@property (weak, nonatomic) IBOutlet UISegmentedControl *operatorSegmentControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)onCalculateButtonPressed:(UIButton *)sender {
    
    [self doCalculateButtonPressed:sender];
    

}

- (void)doCalculateButtonPressed:(UIButton *)sender {
    NSNumber *numberText = [NSNumber numberWithInt: self.numberTextField.text.integerValue];
    NSNumber *multiplierlbl = [NSNumber numberWithInt: self.multiplierLabel.text.integerValue];
    
    NSNumber *total = 0;
    
    if (self.operatorSegmentControl.selectedSegmentIndex == 0){
        
        total = [NSNumber numberWithLong: numberText.integerValue * multiplierlbl.integerValue];
    }
    else {
        total = [NSNumber numberWithLong: numberText.integerValue / multiplierlbl.integerValue];
    }
    
    self.answerLabel.text = [NSString stringWithFormat:@"%.2lf", total.doubleValue];
    
    if (total.longValue >= 20) {
        self.view.backgroundColor = [UIColor greenColor];
    } else {
        self.view.backgroundColor = [UIColor whiteColor];
    }
    
    if ((fmod(total.doubleValue, 3) == 0) && ((fmod(total.doubleValue, 5) == 0))) {
        self.answerLabel.text = @"fizzbuzz";
    }
    else if ((fmod(total.doubleValue, 3)) == 0) {
        self.answerLabel.text = @"fizz";
    }
    else if (fmod(total.doubleValue, 5) == 0) {
        self.answerLabel.text = @"buzz";
    }
    
    [self.numberTextField resignFirstResponder];
}

- (IBAction)onSliderChange:(UISlider *)sender {

    self.multiplierLabel.text = [NSString stringWithFormat: @"%d", (int) sender.value ];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
