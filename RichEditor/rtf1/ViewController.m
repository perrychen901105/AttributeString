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
    NSArray *fontsDataSource;
}
@end

@implementation ViewController

- (void)awakeFromNib
{
    fontsDataSource = @[@[@12, @14, @18, @24],
                        @[@"Arial", @"AmericanTypewriter", @"Helvetica", @"Zapfino"]];
}

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

- (void)applyAttributesToTextArea:(NSDictionary *)attrs
{
    NSRange selection = editor.selectedRange;
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithAttributedString:editor.attributedText];
//    [text setAttributes:attrs range:selection];
    [text addAttributes:attrs range:selection];
    editor.attributedText = text;
    editor.selectedRange = selection;
}

-(IBAction)btnBTapped:(id)sender
{
    NSRange selection = editor.selectedRange;
    if (selection.length == 0) {
        [[[UIAlertView alloc] initWithTitle:@"Warning" message:@"Select text to highlight fist" delegate:nil cancelButtonTitle:@"Close" otherButtonTitles: nil] show];
        return;
    }
    UIColor *bgColor = [editor.attributedText attribute:NSBackgroundColorAttributeName atIndex:selection.location effectiveRange:nil];
    
    UIColor *newColor;
    if (CGColorGetAlpha(bgColor.CGColor) == 0.0) {
        newColor = [UIColor yellowColor];
    } else {
        newColor = [UIColor clearColor];
    }
    
    NSDictionary *bStyle = @{NSBackgroundColorAttributeName: newColor};
    
    [self applyAttributesToTextArea:bStyle];
    
}

-(IBAction)btnITapped:(id)sender
{
    NSRange selection = editor.selectedRange;
    if (selection.length > 0) {
        
        // 1
        NSMutableAttributedString *a = [[NSMutableAttributedString alloc] initWithAttributedString:editor.attributedText];
        
        // 2
        [editor.attributedText enumerateAttributesInRange:selection options:kNilOptions usingBlock:^(NSDictionary *rangeAttrs, NSRange range, BOOL *stop) {
            // apply formatting
            NSShadow *currentShadow = rangeAttrs[NSShadowAttributeName];
            NSShadow *newShadow = [[NSShadow alloc] init];
            if (!currentShadow || currentShadow.shadowBlurRadius==0.0) {
                newShadow.shadowColor = [UIColor redColor];
                newShadow.shadowBlurRadius = 6.0;
            } else {
                newShadow.shadowColor = [UIColor clearColor];
                newShadow.shadowBlurRadius = 0;
            }
            [a addAttribute:NSShadowAttributeName value:newShadow range:range];
        }];
    
        // 3
        editor.attributedText = a;
        editor.selectedRange = selection;
    } else {
        // 1
        NSMutableDictionary *pendingAttrs = [[NSMutableDictionary alloc] initWithDictionary:editor.typingAttributes];
        
        // 2
        NSShadow *currentShadow = pendingAttrs[NSShadowAttributeName];
        NSShadow *newShadow = [[NSShadow alloc] init];
        
        if (!currentShadow || currentShadow.shadowBlurRadius==0.0) {
            newShadow.shadowColor = [UIColor redColor];
            newShadow.shadowBlurRadius = 6.0;
        } else {
            newShadow.shadowColor = [UIColor clearColor];
            newShadow.shadowBlurRadius = 0;
        }
        
        // 3
        [pendingAttrs setObject:newShadow forKey:NSShadowAttributeName];
        
        // 4
        editor.typingAttributes = pendingAttrs;
    }
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
