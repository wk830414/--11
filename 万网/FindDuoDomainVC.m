//
//  FindDuoDomainVC.m
//  万网
//
//  Created by Ibokan 王珂 on 12-11-28.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "FindDuoDomainVC.h"
#import "SelectHouZuiVC.h"
@implementation FindDuoDomainVC
@synthesize englishButton;
@synthesize chineaseButton;
@synthesize searchTextView;
@synthesize zhanWeiLabel;

- (IBAction)back:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}
- (IBAction)duoToDan:(id)sender {
     [self.navigationController popViewControllerAnimated:YES];
}
//英文按钮
- (IBAction)enlish:(id)sender {
    [self.chineaseButton setImage:[UIImage imageNamed:@"notselected.png"] forState:UIControlStateNormal];
    [self.englishButton setImage:[UIImage imageNamed:@"selected.png"] forState:UIControlStateNormal];
    self.searchTextView.keyboardType=UIKeyboardTypeURL;
    [self.searchTextView resignFirstResponder];
    self.zhanWeiLabel.hidden=NO;
    self.zhanWeiLabel.text=@"请您输入英文域名的前缀：（每输入完一个请\n换行，最多可输入10个不同的进行查询）\nabc\n123\nxyz";
    panDuan=@"0";
}
//中文按钮
- (IBAction)chinease:(id)sender {
    [self.englishButton setImage:[UIImage imageNamed:@"notselected.png"] forState:UIControlStateNormal];
    [self.chineaseButton setImage:[UIImage imageNamed:@"selected.png"] forState:UIControlStateNormal];
    self.searchTextView.keyboardType=UIKeyboardTypeDefault;
    [self.searchTextView resignFirstResponder];
    self.zhanWeiLabel.hidden=NO;
    self.zhanWeiLabel.text=@"请您输入中文域名的前缀：（每输入完一个请\n换行，最多可输入10个不同的进行查询）\n你\n我\n他";
    panDuan=@"1";
}
//到后缀页面
- (IBAction)houZui:(id)sender {
    SelectHouZuiVC *houvc=[[SelectHouZuiVC alloc]init];
    houvc.panDuan=panDuan;//传过去是中文还是英文状态
    [self.navigationController pushViewController:houvc animated:YES];
}
- (IBAction)findAll:(id)sender {
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
    [self.englishButton setImage:[UIImage imageNamed:@"selected.png"] forState:UIControlStateNormal];
    panDuan=@"0";
//    self.searchTextView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"search_more_1.png"]];
    self.searchTextView.backgroundColor=[UIColor clearColor];
    self.zhanWeiLabel.backgroundColor=[UIColor clearColor];
    self.zhanWeiLabel.text=@"请您输入英文域名的前缀：（每输入完一个请\n换行，最多可输入10个不同的进行查询）\nabc\n123\nxyz";
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
#pragma textView 的代理
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    self.zhanWeiLabel.hidden=YES;
}
- (void)viewDidUnload
{
    [self setEnglishButton:nil];
    [self setChineaseButton:nil];
    [self setSearchTextView:nil];
    [self setZhanWeiLabel:nil];
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
    [englishButton release];
    [chineaseButton release];
    [searchTextView release];
    [zhanWeiLabel release];
    [super dealloc];
}
@end
