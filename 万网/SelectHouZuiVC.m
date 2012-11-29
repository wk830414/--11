//
//  SelectHouZuiVC.m
//  万网
//
//  Created by Ibokan 王珂 on 12-11-28.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "SelectHouZuiVC.h"
@implementation SelectHouZuiVC
@synthesize table;
@synthesize array;
@synthesize dic;
@synthesize vie;
@synthesize panDuan;
- (IBAction)back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
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
    a=0;
    b=0;
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.table=[[UITableView alloc]initWithFrame:CGRectMake(0, 49, 320, 460-49) style:UITableViewStylePlain];
    table.delegate=self;
    table.dataSource=self;
    [table setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:table];
    //数组赋值
    if ([self.panDuan isEqualToString:@"0"]) {
        self.array=[[NSMutableArray alloc]initWithObjects:@".com",@".cn",@".mobi",@".co",@".net",@".com.cn",@".net.cn",@".so",@".org",@".gov.cn",@".org.cn",@".tel",@".tv",@".biz",@".cc",@".hk",@".name",@".info",@".asia",@".me", nil];
        //字典
        self.dic=[[NSMutableDictionary alloc]initWithObjectsAndKeys:[NSNumber numberWithBool:YES],@".com",[NSNumber numberWithBool:NO],@".cn",[NSNumber numberWithBool:NO],@".mobi",[NSNumber numberWithBool:NO],@".co",[NSNumber numberWithBool:NO],@".net",[NSNumber numberWithBool:NO],@".com.cn",[NSNumber numberWithBool:NO],@".net.cn",[NSNumber numberWithBool:NO],@".so",[NSNumber numberWithBool:NO],@".org",[NSNumber numberWithBool:NO],@".gov.cn",[NSNumber numberWithBool:NO],@".org.cn",[NSNumber numberWithBool:NO],@".tel",[NSNumber numberWithBool:NO],@".tv",[NSNumber numberWithBool:NO],@".biz",[NSNumber numberWithBool:NO],@".cc",[NSNumber numberWithBool:NO],@".hk",[NSNumber numberWithBool:NO],@".name",[NSNumber numberWithBool:NO],@".info",[NSNumber numberWithBool:NO],@".asia",[NSNumber numberWithBool:NO],@".me", nil];
    }else if([self.panDuan isEqualToString:@"1"]){
        self.array=[[NSMutableArray alloc]initWithObjects:@".com",@".net",@".tv",@".biz",@".cc",@".公司",@".网络",@".中国", nil];
        self.dic = [[NSMutableDictionary alloc]initWithObjectsAndKeys:[NSNumber numberWithBool:YES],@".com",[NSNumber numberWithBool:NO],@".net",[NSNumber numberWithBool:NO],@".tv",[NSNumber numberWithBool:NO],@".biz",[NSNumber numberWithBool:NO],@".cc",[NSNumber numberWithBool:NO],@".公司",[NSNumber numberWithBool:NO],@".网络",[NSNumber numberWithBool:NO],@".中国", nil];
    }
    
}
#pragma tableView的代理
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.array count];
}
//在tableView上面加一个header   这个是不可划走的
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (self.vie==nil)
    {
        self.vie=[[UIView alloc]init];
        vie.backgroundColor=[UIColor whiteColor];
        
        UILabel *labe=[[UILabel alloc]initWithFrame:CGRectMake(0, 5, 100, 30)];
        labe.text=@"  全选";
        labe.backgroundColor=[UIColor clearColor];
        labe.font=[UIFont systemFontOfSize:18];
        [vie addSubview:labe];
        
        UIButton *but=[UIButton buttonWithType:UIButtonTypeCustom];
        but.frame=CGRectMake(280, 5, 30, 30);
        [but setImage:[UIImage imageNamed:@"suffix_notselected.png"] forState:UIControlStateNormal];
        [but setImage:[UIImage imageNamed:@"suffix_selected.png"] forState:UIControlStateSelected];
        [but addTarget:self action:@selector(changeg:) forControlEvents:UIControlEventTouchUpInside];
        [vie addSubview:but];
    }
    return vie;
}
- (void)changeg:(UIButton *)send
{
    //选中
    if (send.selected==NO)
    {
        send.selected=YES;
        for (int i=0; i<[[self.dic allKeys ] count]; i++) {
           NSString *str= [[self.dic allKeys] objectAtIndex:i];
            [self.dic setObject:[NSNumber numberWithBool:YES] forKey:str];
        }
//        [self.table reloadData];
    }
    //取消
   else if(send.selected==YES)
   {
       send.selected=NO;
        for (int i=0; i<[[self.dic allKeys ] count]; i++) {
            NSString *str= [[self.dic allKeys] objectAtIndex:i];
            [self.dic setObject:[NSNumber numberWithBool:NO] forKey:str];
        }
        
    }
    [self.table reloadData];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}
//
- (void)change:(UIButton *)sender
{
    UITableViewCell *cell=(UITableViewCell *)sender.superview;
    if (sender.selected==YES) {
        sender.selected=NO;
        [self.dic setObject:[NSNumber numberWithBool:NO] forKey:cell.textLabel.text];
    }
    else{
        sender.selected=YES;
        [self.dic setObject:[NSNumber numberWithBool:YES] forKey:cell.textLabel.text];
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify=@"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:identify];
    cell.backgroundColor=[UIColor clearColor];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
        
        UIButton *bu=[UIButton buttonWithType:UIButtonTypeCustom];
        bu.frame=CGRectMake(280, 5, 30, 30);
        bu.tag=100;
        [bu addTarget:self action:@selector(change:) forControlEvents:UIControlEventTouchUpInside];
        [cell addSubview:bu];
        [bu setImage:[UIImage imageNamed:@"suffix_selected.png"] forState:UIControlStateSelected];
        [bu setImage:[UIImage imageNamed:@"suffix_notselected.png"] forState:UIControlStateNormal];
    }
    cell.textLabel.text=[self.array objectAtIndex:indexPath.row];
    
    UIButton *buj=(UIButton *)[cell viewWithTag:100];
    buj.selected=[[self.dic objectForKey:[self.array objectAtIndex:indexPath.row]] boolValue];    
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
