//
//  ViewController.m
//  TicTacToe
//
//  Created by DK Standard on 19/7/15.
//  Copyright (c) 2015 iKompass. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *whichPlayerLabel;
@property (weak, nonatomic) IBOutlet UILabel *labelOne;
@property (weak, nonatomic) IBOutlet UILabel *labelTwo;
@property (weak, nonatomic) IBOutlet UILabel *labelThree;
@property (weak, nonatomic) IBOutlet UILabel *labelFour;
@property (weak, nonatomic) IBOutlet UILabel *labelFive;
@property (weak, nonatomic) IBOutlet UILabel *labelSix;
@property (weak, nonatomic) IBOutlet UILabel *labelSeven;
@property (weak, nonatomic) IBOutlet UILabel *labelEight;
@property (weak, nonatomic) IBOutlet UILabel *labelNine;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)findLabelUsingPoint: (CGPoint)point{
    
}

-(IBAction)onLabelTap:(UITapGestureRecognizer *)sender{
    
    CGPoint point = [sender locationInView:self.view];
    NSString *tmpString = self.whichPlayerLabel.text;
    
    if (CGRectContainsPoint(self.labelOne.frame, point)){
        if ([self.labelOne.text isEqualToString:@"?"]){
                self.labelOne.text = self.whichPlayerLabel.text;
        }
    }

    if (CGRectContainsPoint(self.labelOne.frame, point)){
        if ([self.labelOne.text isEqualToString:@"?"]){
            self.labelOne.text = self.whichPlayerLabel.text;
        }
    }
    else if (CGRectContainsPoint(self.labelOne.frame, point)){
        if ([self.labelOne.text isEqualToString:@"?"]){
            self.labelOne.text = self.whichPlayerLabel.text;
        }
    }
    else if (CGRectContainsPoint(self.labelOne.frame, point)){
        if ([self.labelOne.text isEqualToString:@"?"]){
            self.labelOne.text = self.whichPlayerLabel.text;
        }
    }
    if (CGRectContainsPoint(self.labelOne.frame, point)){
        if ([self.labelOne.text isEqualToString:@"?"]){
            self.labelOne.text = self.whichPlayerLabel.text;
        }
    }    if (CGRectContainsPoint(self.labelOne.frame, point)){
        if ([self.labelOne.text isEqualToString:@"?"]){
            self.labelOne.text = self.whichPlayerLabel.text;
        }
    }
    if (CGRectContainsPoint(self.labelOne.frame, point)){
        if ([self.labelOne.text isEqualToString:@"?"]){
            self.labelOne.text = self.whichPlayerLabel.text;
        }
    }
    if (CGRectContainsPoint(self.labelOne.frame, point)){
        if ([self.labelOne.text isEqualToString:@"?"]){
            self.labelOne.text = self.whichPlayerLabel.text;
        }
    }
    if (CGRectContainsPoint(self.labelOne.frame, point)){
        if ([self.labelOne.text isEqualToString:@"?"]){
            self.labelOne.text = self.whichPlayerLabel.text;
        }
    }
    if (CGRectContainsPoint(self.labelOne.frame, point)){
        if ([self.labelOne.text isEqualToString:@"?"]){
            self.labelOne.text = self.whichPlayerLabel.text;
        }
    }
    
    
}

@end
