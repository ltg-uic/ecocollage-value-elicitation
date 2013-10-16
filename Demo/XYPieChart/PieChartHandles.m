//
//  PieChartHandles.m
//  XYPieChart
//
//  Created by Tia on 10/16/13.
//  Copyright (c) 2013 Xiaoyang Feng. All rights reserved.
//

#import "PieChartHandles.h"
#import <QuartzCore/QuartzCore.h>

@implementation PieChartHandles
@synthesize radius     = _radius;

-(id) init
{
    _radius = 15;
    self = [super initWithFrame:CGRectMake(0, 0, _radius*2, _radius*2)];
    self.alpha = 1;
    self.layer.cornerRadius = _radius;
    self.backgroundColor = [UIColor whiteColor];
    
    return self;
}
@end
