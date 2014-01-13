//
//  webViewController.m
//  TicTacToe
//
//  Created by Sonam Mehta on 1/12/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import "webViewController.h"

@interface webViewController () <UIWebViewDelegate, UITextFieldDelegate, UIScrollViewDelegate>
{
    
    __weak IBOutlet UIButton *backButton;
    __weak IBOutlet UIButton *forwardButton;
    __weak IBOutlet UITextField *myURLTextField;
    __weak IBOutlet UIWebView *myWebView;
    __weak IBOutlet UIActivityIndicatorView *spinner;

 
}

@end

@implementation webViewController

-(void)viewDidLoad

{
    [super viewDidLoad];
    myWebView.scrollView.delegate = self;
    NSURL *url = [NSURL URLWithString:@"http://en.wikipedia.org/wiki/Tic-tac-toe"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [myWebView loadRequest:request];
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGPoint translation = [scrollView.panGestureRecognizer translationInView:scrollView.superview];
    
    if (translation.y > 0)
    {
        NSLog(@"Scrolling Down");
        myURLTextField.alpha += 0.05;
    }
    else
    {
        NSLog(@"Scrolling Up");
        myURLTextField.alpha -= 0.05;
    }
    
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [spinner startAnimating];
    
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    myURLTextField.alpha = 1;
}


- (void) webViewDidFinishLoad:(UIWebView *)webView {
    NSString *currentURL = myWebView.request.URL.absoluteString;
    myURLTextField.text = currentURL;
    
    self.navigationItem.title = [myWebView stringByEvaluatingJavaScriptFromString:@"document.title"];
    
    NSLog (@"Finished");
    [spinner stopAnimating];
    spinner.hidden = YES;
    
}
- (IBAction)onComingSoonButtonPressed:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:nil delegate:nil cancelButtonTitle:@"Coming Soon!"otherButtonTitles: nil];
    [alert show];
}


- (IBAction)onBackButtonPressed:(id)sender {
    [myWebView goBack];
}

- (IBAction)onReloadButtonPressed:(id)sender {
    [myWebView reload];
}


- (IBAction)onStopLoadingButtonPressed:(id)sender {
    [myWebView stopLoading];
}

- (IBAction)onForwardButtonPressed:(id)sender {
    [myWebView goForward];
}

- (BOOL)textFieldShouldReturn:(UITextField *)tf

{
    NSString *http = [tf.text substringToIndex:7];
    
    
    if ([http isEqualToString:@"http://"])
    {
        NSURL *url = [NSURL URLWithString:myURLTextField.text];
        NSURLRequest *rq = [NSURLRequest requestWithURL:url];
        [myWebView loadRequest:rq];
        spinner.hidden = NO;
        [spinner startAnimating];
        
    } else {
        NSString *urlString = [@"http://" stringByAppendingString:myURLTextField.text];
        NSURL *url = [NSURL URLWithString:urlString];
        NSURLRequest *rq = [NSURLRequest requestWithURL:url];
        [myWebView loadRequest:rq];
        
    }
    
    
    
    [myURLTextField resignFirstResponder];
    return YES;
    
    
}



@end
