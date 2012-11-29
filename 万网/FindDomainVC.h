//
//  FindDomainVC.h
//  万网
//
//  Created by Ibokan 王珂 on 12-11-27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FindDomainVC : UIViewController<UIScrollViewDelegate>
{
    UIScrollView *scroll;
    UIPageControl *page;
}
@property (retain, nonatomic) IBOutlet UILabel *domainLabel;
@property (retain, nonatomic) IBOutlet UITextField *searchText;
@property (retain, nonatomic) IBOutlet UIButton *englishButton;
@property (retain, nonatomic) IBOutlet UIButton *chineaseButton;

@end
