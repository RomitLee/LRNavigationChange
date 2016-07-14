//
//  MainViewController.m
//  LRNavigationChange
//
//  Created by RomitLee on 15/7/15.
//  Copyright (c) 2015年 RomitLee. All rights reserved.
//

#define centerViewHeight 264
#define contentViewHeight 800

#import "MainViewController.h"

@interface MainViewController ()


@property (nonatomic,strong) UIView *centerView;
@property (nonatomic,strong) UIView *contentView;

@property (nonatomic,assign) float centerY;
@property (nonatomic,assign) float contentY;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, centerViewHeight)];
    view.backgroundColor=[UIColor yellowColor];
    //goubi
    self.centerView=view;
    [self.view addSubview:view];
    
    
    UIView *table=[[UIView alloc]initWithFrame:CGRectMake(0, centerViewHeight, [UIScreen mainScreen].bounds.size.width, contentViewHeight)];
    
    table.backgroundColor=[UIColor redColor];
    table.alpha=0.4;
    self.contentView=table;
    
    
    [self.view insertSubview:table belowSubview:view];
    self.centerY=self.centerView.frame.origin.y;
     self.contentY=self.contentView.frame.origin.y;
    
    UIImageView *imageee=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"1234"]];
    imageee.frame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, contentViewHeight);
    imageee.contentMode=UIViewContentModeScaleToFill;
    
    [self.contentView addSubview:imageee];
    self.view.backgroundColor=[UIColor blackColor];
    
    UIPanGestureRecognizer *pan=[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(test:)];
    
    [self.view addGestureRecognizer:pan];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)test:(UIPanGestureRecognizer *)gest
{
    if(gest.state==UIGestureRecognizerStateChanged)
    {
        CGPoint point=[gest translationInView:gest.view];
        
        
        //头只漏了64个高度的时候
        float ff=64-centerViewHeight-self.centerY;
        
        
        //控制头超出64
        if(point.y<0)
        {
            //if()
            if(self.contentView.frame.origin.y<64)
                
            {
                self.contentView.frame=CGRectMake(0, 64+point.y, [UIScreen mainScreen].bounds.size.width, contentViewHeight);
            }
            else
            if(self.contentView.frame.origin.y<=centerViewHeight)
            {
                self.centerView.frame=CGRectMake(0, point.y, [UIScreen mainScreen].bounds.size.width, centerViewHeight);
                self.contentView.frame=CGRectMake(0, centerViewHeight+point.y, [UIScreen mainScreen].bounds.size.width, contentViewHeight);
            }
            
            
            
        }
        if(point.y>0)
        {
            if(self.contentView.frame.origin.y<64)
            {
                self.contentView.frame=CGRectMake(0, 64+point.y, [UIScreen mainScreen].bounds.size.width, contentViewHeight);
            }
            else
            {
                
                self.centerView.frame=CGRectMake(0, 64-centerViewHeight+point.y, [UIScreen mainScreen].bounds.size.width, centerViewHeight);
                self.contentView.frame=CGRectMake(0, 64+point.y, [UIScreen mainScreen].bounds.size.width, contentViewHeight);
            }
        }
        
       
    }
    
    if(gest.state==UIGestureRecognizerStateEnded)
    {
         self.centerY=self.centerView.frame.origin.y;
        self.contentY=self.contentView.frame.origin.y;
    }
}

//- (void)scrollViewDidScroll:(UIScrollView *)scrollView
//{
//    
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
