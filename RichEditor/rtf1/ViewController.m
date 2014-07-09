//
//  ViewController.m
//  rtf1
//
//  Created by Marin Todorov on 07/08/2012.
//  Copyright (c) 2012 Marin Todorov. All rights reserved.
//

#import "ViewController.h"
#import "FontsViewController.h"
#import "ColorViewController.h"

@interface ViewController () <UITextViewDelegate>
{
    IBOutlet UITextView* editor;
    IBOutlet UIView* toolbar;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    toolbar.center = CGPointMake(160, 480);
    [editor becomeFirstResponder];
}

-(IBAction)btnSaveTapped:(id)sender
{
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    [UIView animateWithDuration:0.4 animations:^{
        toolbar.center = CGPointMake(160, 180);
    }];
    return YES;
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView
{
    [UIView animateWithDuration:0.4 animations:^{
        toolbar.center = CGPointMake(160, 440);
    }];
    return YES;
}

-(IBAction)btnBTapped:(id)sender
{
}

-(IBAction)btnITapped:(id)sender
{
}

-(IBAction)btnColorTapped:(id)sender
{
}

-(IBAction)btnFontTapped:(id)sender
{
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
}

@end
