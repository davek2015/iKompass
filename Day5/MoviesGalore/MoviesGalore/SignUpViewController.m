//
//  SignUpViewController.m
//  MoviesGalore
//
//  Created by DK Standard on 25/7/15.
//  Copyright (c) 2015 iKompass. All rights reserved.
//

#import "SignUpViewController.h"
#import "GlobalConstants.h"
#import "MovieViewController.h"

@interface SignUpViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *confirmpasswordTextField;

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onSignupButtonPressed:(UIButton *)sender {

    NSString *urlString = [NSString stringWithFormat:@"%@%@", kBASE_URL, kUSER_SIGNUP_URL];
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    
    NSString *userName = self.usernameTextField.text;
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
                
                [self performSegueWithIdentifier:@"signupSegue" sender:nil];
                
            }
            else{
//                NSString *errormsg = [responseDictionary objectForKey:@"message"];
                
                UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Sign up failure" message:@"Bad Donut" preferredStyle:UIAlertControllerStyleAlert];
                
                UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertViewStyleDefault handler:nil];
                [alertController addAction:alertAction];
                
                [self presentViewController:alertController animated:YES completion:nil];
            }
        }
    }];
}

-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    
    return NO;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    MovieViewController *svc = segue.destinationViewController;
        
    svc.managedObjectContext = self.managedObjectContext;

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
