//
//  MeViewController.m
//  LRNavigationChange
//
//  Created by Tony on 15/7/15.
//  Copyright (c) 2015年 RomitLee. All rights reserved.
//
#define centerViewHeight 250
#define contentViewHeight 800
#import "MeViewController.h"
#import "headView.h"

@interface MeViewController ()


@property (nonatomic,strong) UIView *view3;
@property (nonatomic,assign) float headHeight;

@property (nonatomic,strong) headView *headViewC;
@property (nonatomic,strong) headView *headViewF;
@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    headView *headViewC=[[[NSBundle mainBundle]loadNibNamed:@"headView" owner:self options:nil]lastObject];
    headViewC.frame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width*headViewC.frame.size.height/headViewC.frame.size.width);
    
    headView *headViewF=[[[NSBundle mainBundle]loadNibNamed:@"headView" owner:self options:nil]lastObject];
    headViewF.frame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width*headViewF.frame.size.height/headViewF.frame.size.width);
    self.headViewF=headViewF;
    
    self.headHeight=headViewC.frame.size.height;
    self.headViewC=headViewC;
    
    
    
    UIScrollView *sc=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    
    sc.delegate=self;
    sc.bounces=YES;
    sc.showsVerticalScrollIndicator=NO;
    
    UIView *view1=[[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, self.headHeight)];
    
    [view1 addSubview:headViewC];
    
    
    sc.backgroundColor=[UIColor whiteColor];
    
    
    
    UIView *view2=[[UIView alloc]initWithFrame:CGRectMake(0, self.headHeight, [UIScreen mainScreen].bounds.size.width, contentViewHeight)];
    view2.backgroundColor=[UIColor greenColor];
    
    UIImageView *imageee=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"1234"]];
    imageee.frame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, contentViewHeight);
    imageee.contentMode=UIViewContentModeScaleToFill;
    
    [view2 addSubview:imageee];
    
    [sc addSubview:view1];
    sc.contentSize=CGSizeMake([UIScreen mainScreen].bounds.size.width, self.headHeight+contentViewHeight);
    [sc addSubview: view2];
    
    
     UIView *view3=[[UIView alloc]initWithFrame:CGRectMake(0, 64-self.headHeight, [UIScreen mainScreen].bounds.size.width, self.headHeight)];
    [view3 addSubview:headViewF];
    view3.hidden=YES;
    self.view3=view3;
    
    
     [self.view addSubview:sc];
    [self.view insertSubview:view3 aboveSubview:sc];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGPoint point=scrollView.contentOffset;
    
    
    if(point.y>self.headHeight-64)
    {
        self.view3.hidden=NO;
        self.headViewF.fototView.hidden=YES;
        
        UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 30)];
        label.textAlignment=NSTextAlignmentCenter;
        label.text=@"测试这个功能点";
        label.textColor=[UIColor whiteColor];
        
        label.frame=CGRectMake(0, self.headHeight-30-10, [UIScreen mainScreen].bounds.size.width, 30);
        [self.headViewF addSubview:label];
    }
    else
    {
        self.view3.hidden=YES;
        
    }
    
    if(point.y<0)
    {
        
        self.headViewC.gogo.frame=CGRectMake(0+point.y*[UIScreen mainScreen].bounds.size.width/self.headHeight, 0+point.y, [UIScreen mainScreen].bounds.size.width-point.y*3*[UIScreen mainScreen].bounds.size.width/self.headHeight, self.headHeight-point.y*3);
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [UIView animateWithDuration:2 animations:^{
        self.headViewC.frame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, self.headHeight);

    }];
    }


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
