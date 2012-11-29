//
//  ViewController.m
//  万网
//
//  Created by Ibokan 王珂 on 12-11-27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "FindDomainVC.h"
#import "JieXiVC.h"
#define ITEM_SPACING 200
@implementation ViewController
@synthesize carousel;
@synthesize wrap;
@synthesize scroll;
@synthesize page;
@synthesize indexImage;
- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder]))
    {
        wrap = YES;
    }
    
    return self;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //旋转木马
    carousel=[[iCarousel alloc]initWithFrame:CGRectMake(0, 200, 320, 120)];
    carousel.delegate = self;
    carousel.dataSource = self;
    carousel.type = iCarouselTypeRotary;
    [self.view addSubview:carousel];
    //下面的广告
    scroll=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 460-120, 320, 85)];
    scroll.delegate=self;
    scroll.pagingEnabled=YES;
    for (int i=0; i<2; i++) {
        UIView *vie=[[UIView alloc]initWithFrame:CGRectMake(320*i, 0, 320, 85)];
        vie.backgroundColor=[UIColor greenColor];
        vie.tag=i+1;
        [scroll addSubview:vie];
        if (vie.tag==2) {
            vie.backgroundColor=[UIColor redColor];
        }
    }
    scroll.contentSize=CGSizeMake(320*2, 85);
     [self.view addSubview:scroll];
    //pageView
    page=[[UIPageControl alloc]initWithFrame:CGRectMake((320-50)/2, 460-35, 50, 35)];
    page.currentPage=0;
    page.numberOfPages=2;
    [self.view addSubview:page];
}
//分页显示
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    page.currentPage=scrollView.contentOffset.x/320;
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}
- (NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return 6;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index
{
    UIView *view = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.png",index+1]]] autorelease];
    view.frame = CGRectMake(0, 0, 120, 120);
    return view;
}
- (void)carousel:(iCarousel *)carousel1 didSelectItemAtIndex:(NSInteger)index
{
    indexImage=index+1;

    //只能写在这里
    FindDomainVC *findvc=[[FindDomainVC alloc]init];
    UINavigationController *nc1=[[UINavigationController alloc]initWithRootViewController:findvc];
    
    JieXiVC *jievc=[[JieXiVC alloc]init];
    //下面是针对每一个
    switch (indexImage) {
        case 0:
            break;
        case 1:
        [self presentModalViewController:nc1 animated:YES];
            NSLog(@"1");
            break;
        case 2:
            NSLog(@"2");
            [self presentModalViewController:jievc animated:YES];
            break;
        case 3:
            NSLog(@"3");
            break;
        case 4:
            NSLog(@"4");
            break;
        case 5:
            NSLog(@"5");
            break;
        case 6:
            NSLog(@"6");
            break;
        default:
            break;
    }
}



- (NSUInteger)numberOfPlaceholdersInCarousel:(iCarousel *)carousel
{
	return 0;
}

- (NSUInteger)numberOfVisibleItemsInCarousel:(iCarousel *)carousel
{
    return 6;
}

- (CGFloat)carouselItemWidth:(iCarousel *)carousel
{
    return 150;
}

- (CATransform3D)carousel:(iCarousel *)_carousel transformForItemView:(UIView *)view withOffset:(CGFloat)offset
{
    view.alpha = 1.0 - fminf(fmaxf(offset, 0.0), 1.0);
    
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = self.carousel.perspective;
    transform = CATransform3DRotate(transform, M_PI / 8.0, 0, 1.0, 0);
    return CATransform3DTranslate(transform, 0.0, 0.0, offset * carousel.itemWidth);
}

- (BOOL)carouselShouldWrap:(iCarousel *)carousel
{
    wrap=YES;
    return wrap;
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}



@end
