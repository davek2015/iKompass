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
    
    NSLog(@"%f , %f", point.x, point.y);
    
    if (CGRectContainsPoint(self.labelOne.frame, point)){
        if ([self.labelOne.text isEqualToString:@"?"]){
            self.labelOne.text = self.whichPlayerLabel.text;
            [self changePlayer];
        }
    }
    
    if (CGRectContainsPoint(self.labelTwo.frame, point)){
        if ([self.labelTwo.text isEqualToString:@"?"]){
            self.labelTwo.text = self.whichPlayerLabel.text;
            [self changePlayer];
        }
    }
    
    if (CGRectContainsPoint(self.labelThree.frame, point)){
        if ([self.labelThree.text isEqualToString:@"?"]){
            self.labelThree.text = self.whichPlayerLabel.text;
            [self changePlayer];
        }
    }
    
    if (CGRectContainsPoint(self.labelFour.frame, point)){
        if ([self.labelFour.text isEqualToString:@"?"]){
            self.labelFour.text = self.whichPlayerLabel.text;
            [self changePlayer];
        }
    }
    
    if (CGRectContainsPoint(self.labelFive.frame, point)){
        if ([self.labelFive.text isEqualToString:@"?"]){
            self.labelFive.text = self.whichPlayerLabel.text;
            [self changePlayer];
        }
    }
    
    if (CGRectContainsPoint(self.labelSix.frame, point)){
        if ([self.labelSix.text isEqualToString:@"?"]){
            self.labelSix.text = self.whichPlayerLabel.text;
            [self changePlayer];
        }
    }
    
    if (CGRectContainsPoint(self.labelSeven.frame, point)){
        if ([self.labelSeven.text isEqualToString:@"?"]){
            self.labelSeven.text = self.whichPlayerLabel.text;
            [self changePlayer];
        }
    }
    
    if (CGRectContainsPoint(self.labelEight.frame, point)){
        if ([self.labelEight.text isEqualToString:@"?"]){
            self.labelEight.text = self.whichPlayerLabel.text;
            [self changePlayer];
        }
    }
    
    if (CGRectContainsPoint(self.labelNine.frame, point)){
        if ([self.labelNine.text isEqualToString:@"?"]){
            self.labelNine.text = self.whichPlayerLabel.text;
            [self changePlayer];
        }
    }
    

}
         
-(void) changePlayer{
    
    if ([self.whichPlayerLabel.text isEqualToString:@"X"]){
        self.whichPlayerLabel.text = @"O";
    }
    else{
        self.whichPlayerLabel.text = @"X";
    }
}

@end
