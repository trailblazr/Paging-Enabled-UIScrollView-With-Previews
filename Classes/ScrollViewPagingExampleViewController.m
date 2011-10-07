//
//  ScrollViewPagingExampleViewController.m
//  ScrollViewPagingExample
//
//  Created by Alexander Repty on 12.02.10.
//  Copyright Enough Software 2010. All rights reserved.
//

#import "ScrollViewPagingExampleViewController.h"

@implementation ScrollViewPagingExampleViewController

#pragma mark - Construction & Destruction

- (void)dealloc {
	[_scrollView release];
    [_pageControl release];
	[super dealloc];
}

#pragma mark - UIViewController methods

- (void)viewDidLoad {
	_scrollView.clipsToBounds = NO;
	_scrollView.pagingEnabled = YES;
	_scrollView.showsHorizontalScrollIndicator = NO;
	
	CGFloat contentOffsetX = 0.0f;
	NSArray *imageFilenames = [NSArray arrayWithObjects:@"mborsten.jpg",
							   @"arepty.jpg",
							   @"bmf.jpg",
							   @"mgprot.jpg",
							   @"sgaw.jpg",
							   @"tarasis.jpg",
							   @"uliwitness.jpg",
							   @"cgodefroy.jpg",
							   nil];
    _pageControl.numberOfPages = [imageFilenames count];
    
	for (NSString *currentImageFilename in imageFilenames) {
		CGRect imageViewFrame = CGRectMake(contentOffsetX, 0.0f, _scrollView.frame.size.width, _scrollView.frame.size.height);

		UIImageView *imageView = [[UIImageView alloc] initWithFrame:imageViewFrame];
		imageView.image = [UIImage imageNamed:currentImageFilename];
		imageView.contentMode = UIViewContentModeCenter;
		[_scrollView addSubview:imageView];
		[imageView release];

		contentOffsetX += imageView.frame.size.width;
		_scrollView.contentSize = CGSizeMake(contentOffsetX, _scrollView.frame.size.height);
	}
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat pageIndex = scrollView.contentOffset.x / scrollView.bounds.size.width;
    _pageControl.currentPage = pageIndex;
    [_pageControl updateCurrentPageDisplay];
}

#pragma mark - User Interaction

- (IBAction) actionPageControlTapped:(UIPageControl*)control {
    NSInteger pageIndex = control.currentPage;
    CGFloat contentOffsetX = pageIndex * _scrollView.bounds.size.width;
    [_scrollView setContentOffset:CGPointMake(contentOffsetX, 0.0) animated:YES];
}

@end
