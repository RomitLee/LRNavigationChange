//
//  headView.m
//  LRNavigationChange
//
//  Created by Tony on 15/7/15.
//  Copyright (c) 2015年 RomitLee. All rights reserved.
//

#import "headView.h"

@implementation headView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)awakeFromNib
{
    self.headImage.layer.cornerRadius=self.headImage.frame.size.width/2;
    self.headImage.layer.masksToBounds=YES;
    
    self.fototView.layer.cornerRadius=self.fototView.frame.size.height/2;
    self.fototView.layer.masksToBounds=YES;
    
    self.fototView.backgroundColor=[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.2];
    
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.fototView.frame.size.width, self.fototView.frame.size.height)];
    label.textAlignment=NSTextAlignmentCenter;
    label.text=@" 李锐大帅哥，绝逼最帅";
    label.textColor=[UIColor orangeColor];
    
    
    [self.fototView addSubview:label];
}

@end
