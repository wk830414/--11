//
//  ViewController.h
//  万网
//
//  Created by Ibokan 王珂 on 12-11-27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iCarousel.h"
@interface ViewController : UIViewController<iCarouselDataSource,iCarouselDelegate,UIActionSheetDelegate,UIScrollViewDelegate>
@property (nonatomic, retain)  iCarousel *carousel;
@property (nonatomic,retain) UIScrollView *scroll;
@property (nonatomic,assign) BOOL wrap;
@property (nonatomic,retain) UIPageControl *page;
@property (nonatomic,assign)int indexImage;//第几个原图
@end
