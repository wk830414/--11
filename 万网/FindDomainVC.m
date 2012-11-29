//
//  FindDomainVC.m
//  万网
//
//  Created by Ibokan 王珂 on 12-11-27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "FindDomainVC.h"
#import "FindDuoDomainVC.h"
@implementation FindDomainVC
@synthesize domainLabel;
@synthesize searchText;
@synthesize englishButton;
@synthesize chineaseButton;
//单域名和多域名
- (IBAction)duoToDan:(id)sender {
    FindDuoDomainVC *duovc=[[FindDuoDomainVC alloc]init];
    [self.navigationController pushViewController:duovc animated:YES];
}
- (IBAction)back:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}
//搜索
- (IBAction)searchButton:(id)sender {
}
//选择英语button
- (IBAction)englishButton:(id)sender {
    [self.chineaseButton setImage:[UIImage imageNamed:@"notselected.png"] forState:UIControlStateNormal];
    [self.englishButton setImage:[UIImage imageNamed:@"selected.png"] forState:UIControlStateNormal];
    self.searchText.keyboardType=UIKeyboardTypeURL;
    if (searchText.text.length>0) {
        self.searchText.placeholder=@"";
    }else{
    self.searchText.placeholder=@"请您输入英文域名：taobao/taobao.com";
        [self.searchText resignFirstResponder];
    }
}
//选择中文button
- (IBAction)chineaseButton:(id)sender {
    [self.englishButton setImage:[UIImage imageNamed:@"notselected.png"] forState:UIControlStateNormal];
    [self.chineaseButton setImage:[UIImage imageNamed:@"selected.png"] forState:UIControlStateNormal];
    self.searchText.keyboardType=UIKeyboardTypeDefault;
    if (searchText.text.length>0) {
        self.searchText.placeholder=@"";
    }else{
        self.searchText.placeholder=@"请您输入中文域名:万网/万网.com";
        [self.searchText resignFirstResponder];
    }
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //影藏导航条
    [self.navigationController setNavigationBarHidden:YES];
    
     [self.englishButton setImage:[UIImage imageNamed:@"selected.png"] forState:UIControlStateNormal];
    self.searchText.keyboardType=UIKeyboardTypeDefault;
    self.searchText.borderStyle=UITextBorderStyleNone;
    //textfield 设置背景图片
    [self.searchText setBackground:[UIImage imageNamed:@"seachbox.png"]];
    self.searchText.clearButtonMode=UITextFieldViewModeWhileEditing;
    self.searchText.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
//    [self.searchText setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"seachbox.png"]]];
    self.searchText.placeholder=@"请您输入英文域名：taobao/taobao.com";
    
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


- (void)viewDidUnload
{
    [self setDomainLabel:nil];
    [self setSearchText:nil];
    [self setEnglishButton:nil];
    [self setChineaseButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [domainLabel release];
    [searchText release];
    [englishButton release];
    [chineaseButton release];
    [super dealloc];
}
@end
