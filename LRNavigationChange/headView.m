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
}

@end
