//
//  ViewController.m
//  SpiderBrowser
//
//  Created by Admin on 12/7/15.
//  Copyright (c) 2015 iKompass. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIWebViewDelegate, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UITextField *textURL;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //NSString *urlString = @"http://www.ikompass.edu.sg";
    //NSURLRequest *url = [NSURL URLWithString:urlString];
    //NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    //[self.webView loadRequest:request];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    NSString *urlString = [NSString stringWithFormat:@"http://%@",self.textURL.text];
    NSURLRequest *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [self.webView loadRequest:request];
    [textField resignFirstResponder];
    return YES;
}

@end
