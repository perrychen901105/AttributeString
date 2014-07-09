//
//  FontsViewController.h
//  rtf1
//
//  Created by Marin Todorov on 07/08/2012.
//  Copyright (c) 2012 Marin Todorov. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FontsViewControllerDelegate <NSObject>

- (void)selectedFontName:(NSString *)fontName withSize:(NSNumber*)fontSize;

@end

@interface FontsViewController : UIViewController
// 选择一个新的字体时接收通知消息。
@property (weak) UIViewController<FontsViewControllerDelegate> *delegate;
@property (strong) UIFont *preselectedFont;

@end
