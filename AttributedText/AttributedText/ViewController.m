//
//  ViewController.m
//  AttributedText
//
//  Created by Perry on 14-7-9.
//  Copyright (c) 2014年 Perrychen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    
    __weak IBOutlet UILabel *label;

}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // 1
    NSDictionary *attributes = @{NSForegroundColorAttributeName: [UIColor greenColor]};
    
    // 2
    NSAttributedString *aString = [[NSAttributedString alloc] initWithString:@"Green message!" attributes:attributes];
    
    // 3
    label.attributedText = aString;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
