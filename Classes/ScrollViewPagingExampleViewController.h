//
//  ScrollViewPagingExampleViewController.h
//  ScrollViewPagingExample
//
//  Created by Alexander Repty on 12.02.10.
//  Copyright Enough Software 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScrollViewPagingExampleViewController : UIViewController <UIScrollViewDelegate> {
	IBOutlet UIScrollView	*_scrollView;
	IBOutlet UIPageControl	*_pageControl;
}

- (IBAction) actionPageControlTapped:(UIPageControl*)control;

@end

