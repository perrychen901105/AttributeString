//
//  FontsViewController.m
//  rtf1
//
//  Created by Marin Todorov on 07/08/2012.
//  Copyright (c) 2012 Marin Todorov. All rights reserved.
//

#import "FontsViewController.h"

@interface FontsViewController () <UIPickerViewDataSource, UIPickerViewDelegate>
{
    IBOutlet UIPickerView* fontPicker;
    IBOutlet UIButton* btnApply;
    NSArray *fontsDataSource;
}

@end

@implementation FontsViewController

-(void)awakeFromNib
{
    fontsDataSource = @[@[@12, @14, @18, @24],
                        @[@"Arial", @"AmericanTypewriter", @"Helvetica", @"Zapfino", @"AmaticSC-Regular"]];
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Font picker";
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSArray *fontSizes = fontsDataSource[0];
    
    for (int i = 0; i < fontSizes.count; i++) {
        NSNumber *size = fontSizes[i];
        if ([size floatValue] == self.preselectedFont.pointSize) {
            [fontPicker selectRow:i inComponent:0 animated:YES];
            break;
        }
    }
    
    NSArray *fontNames = fontsDataSource[1];
    
    for (int i = 0; i < fontNames.count; i++) {
        NSString *name = fontNames[i];
        if ([name compare:self.preselectedFont.fontName] == NSOrderedSame) {
            [fontPicker selectRow:i inComponent:1 animated:YES];
            break;
        }
    }
}

-(void)viewDidDisappear:(BOOL)animated
{
}


#pragma mark UIPickerViewDataSource methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return fontsDataSource.count;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return ((NSArray *)fontsDataSource[component]).count;
}

- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    // 1
    id data = ((NSArray *)fontsDataSource[component])[row];
    
    // 2
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:[data description]];
    
    if (component == 0) {
        // 3
        float pointSize = [(NSNumber *)data floatValue];
        NSDictionary *attr = @{NSFontAttributeName: [UIFont fontWithName:@"Arial" size:pointSize]};
        [title setAttributes:attr range:NSMakeRange(0, title.length)];
    }
    if (component == 1) {
        // 4
        NSDictionary *attr = @{NSFontAttributeName: [UIFont fontWithName:data size:16.0f]};
        [title setAttributes:attr range:NSMakeRange(0, title.length)];
    }
    // 5
    return title;
}

#pragma mark button actions
-(IBAction)btnDoneTapped:(id)sender
{
}

@end
