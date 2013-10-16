//
//  ViewController.h
//  XYPieChart
//
//  Created by XY Feng on 2/24/12.
//  Copyright (c) 2012 Xiaoyang Feng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XYPieChart.h"
#import "PieChartHandles.h"

@interface ViewController : UIViewController <XYPieChartDelegate, XYPieChartDataSource>


@property (strong, nonatomic) IBOutlet XYPieChart *pieChartLeft;
@property(strong, nonatomic) IBOutlet UITextField * publicInstall;
@property(strong, nonatomic) IBOutlet UITextField * privateInstall;
@property(strong, nonatomic) IBOutlet UITextField * timeFlooded;
@property(strong, nonatomic) IBOutlet UITextField * amountInfiltrated;
@property(strong, nonatomic) IBOutlet UITextField * areaFlooded;
@property(strong, nonatomic) IBOutlet UITextField * runOff;
@property(strong, nonatomic) IBOutlet UITextField * installTime;
@property (strong, nonatomic) IBOutlet UISegmentedControl *indexOfSlices;
@property(nonatomic, strong) NSMutableArray *slices;
@property(nonatomic, strong) NSArray        *sliceColors;
@property(nonatomic, strong) NSArray *textFields;
@property(nonatomic, strong) IBOutlet UIButton *updateButton;
@property (strong, nonatomic) IBOutlet UIButton *resetButton;
@property(nonatomic) NSInteger numOfSlices;
@property(strong, nonatomic) UIView *circleView;
@end
