//
//  SelectHouZuiVC.h
//  万网
//
//  Created by Ibokan 王珂 on 12-11-28.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectHouZuiVC : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
//    UIButton *but;
    int a;//控制第一个but的点击次数
    int b;//控制cell中的button的点击次数
//    UIButton *bu;//单元格中的button
}
@property (retain,nonatomic)UITableView *table;
@property (retain,nonatomic)NSMutableArray *array;
@property (retain,nonatomic)NSMutableDictionary *dic;
@property(retain,nonatomic)UIView *vie;
@property (retain,nonatomic) NSString *panDuan;
@end
