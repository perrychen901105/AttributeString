//
//  ColorViewController.m
//  rtf1
//
//  Created by Marin Todorov on 07/08/2012.
//  Copyright (c) 2012 Marin Todorov. All rights reserved.
//

#import "ColorViewController.h"

@interface ColorViewController ()
{
    NSArray *colorsDataSource;
    NSArray *colorsName;
}
@end

@implementation ColorViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Color picker";
    
    colorsDataSource = @[
                         [UIColor colorWithRed:0.106 green:0.49 blue:0.035 alpha:1],
                         [UIColor colorWithRed:0.129 green:0.243 blue:0.725 alpha:1],
                         [UIColor colorWithRed:0.725 green:0.129 blue:0.298 alpha:1],
                         [UIColor colorWithRed:0.941 green:0.604 blue:0.02 alpha:1],
                         [UIColor colorWithRed:0.941 green:0.02 blue:0.929 alpha:1],
                         [UIColor colorWithRed:0.373 green:0.235 blue:0.035 alpha:1],
                         [UIColor blackColor]
                         ];
    
    colorsName = @[
                   @"Green",
                   @"Blue",
                   @"Red",
                   @"Orange",
                   @"Pink",
                   @"Brown",
                   @"Black"];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return colorsDataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    // Configure the cell...
    NSDictionary *attr = @{
                           NSForegroundColorAttributeName: colorsDataSource[indexPath.row]};
    cell.textLabel.attributedText = [[NSAttributedString alloc] initWithString:colorsName[indexPath.row] attributes:attr];
    
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.delegate selectedColor:colorsDataSource[indexPath.row]];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
