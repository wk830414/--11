//
//  FindDuoDomainVC.h
//  万网
//
//  Created by Ibokan 王珂 on 12-11-28.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FindDuoDomainVC : UIViewController<UIScrollViewDelegate,UITextViewDelegate>//拖得也要加代理
{
    UIScrollView *scroll;
    UIPageControl *page;
    NSString *panDuan;//传到下个页面 是英文还是中文
}
@property (retain, nonatomic) IBOutlet UIButton *englishButton;
@property (retain, nonatomic) IBOutlet UIButton *chineaseButton;
@property (retain, nonatomic) IBOutlet UITextView *searchTextView;
@property (retain, nonatomic) IBOutlet UILabel *zhanWeiLabel;

@end
