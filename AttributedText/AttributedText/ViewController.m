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
    
    // 1    使用UIKIT的NSForegroundColorAttributeName 设置为greenColor
//    NSDictionary *attributes = @{NSForegroundColorAttributeName: [UIColor greenColor]};
//    NSDictionary *attributes = @{NSForegroundColorAttributeName: [UIColor greenColor],
//                                 NSUnderlineStyleAttributeName: [NSNumber numberWithInt:NSUnderlineStyleSingle]};

    
    //NSKern 设置字符的间距
//    NSDictionary *attributes = @{NSForegroundColorAttributeName: [UIColor blueColor],
//                                 NSFontAttributeName: [UIFont fontWithName:@"Zapfino" size:24.0],
//                                 NSBackgroundColorAttributeName: [UIColor orangeColor],
//                                 NSKernAttributeName: @-3.0};
    /*
    NSShadow *myShadow = [[NSShadow alloc] init];
    myShadow.shadowColor = [UIColor grayColor];
    myShadow.shadowBlurRadius = 5.0f;
    myShadow.shadowOffset = CGSizeMake(1, 1);
    
    NSDictionary *attributes = @{NSUnderlineStyleAttributeName: [NSNumber numberWithInt:NSUnderlineStyleSingle],
                                 NSStrikethroughStyleAttributeName: [NSNumber numberWithInt:NSUnderlineStyleSingle],
                                 NSForegroundColorAttributeName: [UIColor blueColor],
                                 NSShadowAttributeName: myShadow};
    
    // 2
    NSAttributedString *aString = [[NSAttributedString alloc] initWithString:@"Green message!" attributes:attributes];
    
    // 3
    label.attributedText = aString;
    */
    
    NSShadow *myShadow = [[NSShadow alloc] init];
    myShadow.shadowBlurRadius = 2.0;
    myShadow.shadowColor = [UIColor grayColor];
    myShadow.shadowOffset = CGSizeMake(1, 1);
    
    NSDictionary *attributes = @{
                                 NSForegroundColorAttributeName: [UIColor colorWithRed:0.2 green:0.239 blue:0.451 alpha:1],
                                 NSShadowAttributeName: myShadow};
    
    NSString* txt = @"(UIFont*) Sets the font to render the text. If you want bold or italic text provide the correct name for each given font. These vary depending on the font family.\nFor example for the \"Helvetica Neue\" font you need to provide \"HelveticaNeue-Bold\" name for a bolded font, and \"HelveticaNeue-Italic\" for italic font.\nHowever, if you would like to use \"Courier New\", the font names are: \"CourierNewPS- ItalicMT\" for italic and \"CourierNewPS-BoldMT\" for bold.";
    
    NSAttributedString *aString = [[NSAttributedString alloc] initWithString:txt attributes: attributes];
    label.attributedText = aString;
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
