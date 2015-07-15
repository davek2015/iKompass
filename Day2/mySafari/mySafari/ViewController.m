//
//  ViewController.m
//  mySafari
//
//  Created by DK Standard on 15/7/15.
//  Copyright (c) 2015 iKompass. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIWebViewDelegate, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UITextField *urlTextField;
@property (weak, nonatomic) IBOutlet UIButton *goBackButton;
@property (weak, nonatomic) IBOutlet UIButton *goForwardButton;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property(nonatomic, readonly, retain) UIScrollView *scrollView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.goBackButton.enabled = FALSE;
    self.goForwardButton.enabled = FALSE;
    self.webView.scrollView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    if (self.webView.canGoBack){
        self.goBackButton.enabled = TRUE;
    }else{
        self.goBackButton.enabled = FALSE;
    }
    
    if (self.webView.canGoForward) {
        self.goForwardButton.enabled = TRUE;
    }else{
        self.goForwardButton.enabled = FALSE;
    }
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
   
    NSURLRequest *currentRequest = [self.webView request];
    NSURL *currentURL = [currentRequest URL];
    self.urlTextField.text = [NSString stringWithFormat:@"%@", currentURL.absoluteString];
    
    self.titleLabel.text = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    
    self.webView.scrollView.scrollEnabled = YES;
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{

    if (![self.urlTextField.text hasPrefix:@"http://"]){
        
        self.urlTextField.text = [NSString stringWithFormat:@"http://%@",self.urlTextField.text];
    }
    
    NSString *urlString = [NSString stringWithFormat:@"%@",self.urlTextField.text];
    NSURLRequest *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [self.webView loadRequest:request];
    
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)onBackButtonPressed:(UIButton *)sender {
    [self.webView goBack];
}
    
- (IBAction)onForwardButtonPressed:(UIButton *)sender {
    [self.webView goForward];
}

- (IBAction)onStopLoadingButtonPressed:(UIButton *)sender {
    [self.webView stopLoading];
}

- (IBAction)onReloadButtonPressed:(UIButton *)sender {
    [self.webView reload];
}

- (IBAction)onTeaserButtonPressed:(UIButton *)sender {
    UIAlertController * alert=  [UIAlertController alertControllerWithTitle:@"Coming soon!"
                                  message:@""
                                  preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)scrollViewDidScroll :(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.y == 0) //Show toolbar when at top
    {
        [self.urlTextField setHidden:NO];
    }
    else
    {
        [self.urlTextField setHidden:YES];
    }
}

@end
