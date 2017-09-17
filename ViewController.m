//
//  ViewController.m
//  SocialNetworking
//
//  Created by Ziying Feng on 2/20/17.
//  Copyright © 2017 Ziying Feng. All rights reserved.
//

#import "ViewController.h"
#import "Social/Social.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *tweetTextView;
@property (weak, nonatomic) IBOutlet UITextView *facebookTextView;
@property (weak, nonatomic) IBOutlet UITextView *moreTextView;

@end

@implementation ViewController
//-(void)showAlertMessage(*NSString message){
    
//}

- (IBAction)tweetButton:(id)sender {
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]){
        SLComposeViewController *tweetVC = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        
        if([self.tweetTextView.text length] < 140){
            [tweetVC setInitialText:self.tweetTextView.text];
        }
        
        else{
            [tweetVC setInitialText:[self.tweetTextView.text substringToIndex:140]];
        }
        
        [self presentViewController:tweetVC animated:YES completion:nil];
    }
    
    else{
        UIAlertController *shareView = [UIAlertController alertControllerWithTitle:@"shareView" message:@"Please sign in to Twitter" preferredStyle:UIAlertControllerStyleAlert];
        [self presentViewController:shareView animated:YES completion:nil];
        UIAlertAction *okay = [UIAlertAction actionWithTitle:@"okay" style:UIAlertActionStyleDefault handler:nil];
        [shareView addAction:okay];
        
        
    }
}

- (IBAction)facebookButton:(id)sender {
    SLComposeViewController *facebookVC = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    [facebookVC setInitialText:self.facebookTextView.text];
    [self presentViewController:facebookVC animated:YES completion:nil];
}


- (IBAction)moreButton:(id)sender {
    UIActivityViewController *moreVC = [[UIActivityViewController alloc] initWithActivityItems:@[self.moreTextView.text] applicationActivities:nil];
    [self presentViewController:moreVC animated:YES completion:nil];
}

- (IBAction)nothingButton:(id)sender {
    UIAlertController *nothingVC = [UIAlertController alertControllerWithTitle:@"nothing" message:@"Do nothing" preferredStyle:UIAlertControllerStyleAlert];    
    UIAlertAction *okay = [UIAlertAction actionWithTitle:@"okay" style:UIAlertActionStyleDefault handler:nil];
    [nothingVC addAction:okay];
    [self presentViewController:nothingVC animated:YES completion:nil];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tweetTextView.layer.backgroundColor = [UIColor colorWithRed:1.0 green:0.5 blue:0.5 alpha:1.0].CGColor;
    self.facebookTextView.layer.backgroundColor = [UIColor colorWithRed:0.5 green:0.5 blue:1.0 alpha:1.0].CGColor;
    self.moreTextView.layer.backgroundColor = [UIColor colorWithRed:0.4 green:0.4 blue:0.5 alpha:1.0].CGColor;
    
    // UIColor is just an Objective-C object wrapper of the C object CGColor.
    // alpha is opacity
    
    self.tweetTextView.layer.cornerRadius = 10.0;
    self.facebookTextView.layer.cornerRadius = 10.0;
    self.moreTextView.layer.cornerRadius = 10.0;
    
    self.tweetTextView.layer.borderWidth = 2.0;
    self.facebookTextView.layer.borderWidth = 2.0;
    self.moreTextView.layer.borderWidth = 2.0;
    
    self.tweetTextView.layer.borderColor = [UIColor colorWithWhite:0 alpha:0.5].CGColor;
    self.facebookTextView.layer.borderColor = [UIColor colorWithWhite:0 alpha:0.5].CGColor;
    self.moreTextView.layer.borderColor = [UIColor colorWithWhite:0 alpha:0.5].CGColor;
                                           
                                        
                                           
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
