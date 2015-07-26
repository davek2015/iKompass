//
//  ViewController.m
//  MoviesGalore
//
//  Created by DK Standard on 25/7/15.
//  Copyright (c) 2015 iKompass. All rights reserved.
//

#import "ViewController.h"
#import "GlobalConstants.h"
#import "SignUpViewController.h"
#import "MovieViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

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

- (IBAction)onLoginButtonPressed:(UIButton *)sender {

    NSString *urlString = [NSString stringWithFormat:@"%@%@", kBASE_URL, kUSER_LOGIN_URL];
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    
    NSString *userName = self.userNameTextField.text;
    NSString *password = self.passwordTextField.text;
    
    NSDictionary *signupDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:userName, @"username", password, @"password", nil];
    
    NSData *postData = [NSJSONSerialization dataWithJSONObject:signupDictionary options:0 error:nil];
    
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:[NSString stringWithFormat:@"%ld", [postData length]]  forHTTPHeaderField:@"Content-Length"];
    [request setHTTPBody:postData];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        if (connectionError == nil) {
            NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            
            NSNumber *error = [responseDictionary objectForKey:@"error"];
            if (![error boolValue]) {
                
                NSString *userId = [NSString stringWithFormat:@"%@", [responseDictionary objectForKey:@"id"]];
                
                //Get document directory
                
                NSString *documentDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
                
                //Get file path
                
                NSString *filepath = [documentDirectory stringByAppendingPathComponent:@"MyFile"];
                
                //Write to file
                
                [userId writeToFile:filepath atomically:YES encoding:NSUTF8StringEncoding error:nil];
                
                [self performSegueWithIdentifier:@"loginSegue" sender:nil];
            
            }
            else{
//                NSString *errormsg = [responseDictionary objectForKey:@"message"];
                    
                UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Login failure" message:@"Bad Donut" preferredStyle:UIAlertControllerStyleAlert];
                    
                UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertViewStyleDefault handler:nil];
                [alertController addAction:alertAction];
                    
                [self presentViewController:alertController animated:YES completion:nil];
            }
        }
    }];

}

-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    
    if ([identifier isEqualToString:@"loginSegue"]) {
        return NO;
    }
    return YES;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

    if ([segue.identifier isEqualToString:@"loginSegue"]) {
        MovieViewController *svc = segue.destinationViewController;
        
        svc.managedObjectContext = self.managedObjectContext;
    }
    
    if ([segue.identifier isEqualToString:@"signupSegue"])
    {
        SignUpViewController *svc = segue.destinationViewController;
        svc.managedObjectContext = self.managedObjectContext;
        
    }
}

@end
