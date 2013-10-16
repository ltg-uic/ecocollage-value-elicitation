//
//  ViewController.m
//  XYPieChart
//
//  Created by XY Feng on 2/24/12.
//  Copyright (c) 2012 Xiaoyang Feng. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@implementation ViewController

@synthesize pieChartLeft = _pieChartCopy;
@synthesize numOfSlices = _numOfSlices;
@synthesize indexOfSlices = _indexOfSlices;
@synthesize slices = _slices;
@synthesize sliceColors = _sliceColors;
@synthesize textFields = _textFields;


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    PieChartHandles *test = [[PieChartHandles alloc] init];
    [test setCenter:CGPointMake(self.pieChartLeft.pieCenter.x + 10, self.pieChartLeft.pieCenter.y+self.pieChartLeft.pieRadius +5)];
    [self.pieChartLeft addSubview:test];
    
    self.numOfSlices = 7;
    self.slices = [NSMutableArray arrayWithCapacity:10];
    self.textFields = [NSArray arrayWithObjects:_publicInstall, _privateInstall, _timeFlooded, _amountInfiltrated, _areaFlooded, _runOff, _installTime, nil];
    
    for(int i = 0; i < _numOfSlices; i ++)
    {
        NSNumber *one = [NSNumber numberWithInt: 1 ];
        [_slices addObject:one];
    }
    
    [self.pieChartLeft setDataSource:self];
    [self.pieChartLeft setStartPieAngle:M_PI_2];
    [self.pieChartLeft setAnimationSpeed:1.0];
    [self.pieChartLeft setLabelFont:[UIFont fontWithName:@"DBLCDTempBlack" size:24]];
    [self.pieChartLeft setLabelRadius:160];
    [self.pieChartLeft setShowPercentage:YES];
    [self.pieChartLeft setPieBackgroundColor:[UIColor colorWithWhite:0.95 alpha:1]];
    [self.pieChartLeft setPieCenter:CGPointMake(240, 240)];
    [self.pieChartLeft setUserInteractionEnabled:NO];
    [self.pieChartLeft setLabelShadowColor:[UIColor blackColor]];
    
    self.sliceColors =[NSArray arrayWithObjects:
                       [UIColor colorWithRed:246/255.0 green:155/255.0 blue:0/255.0 alpha:1],
                       [UIColor colorWithRed:129/255.0 green:195/255.0 blue:29/255.0 alpha:1],
                       [UIColor colorWithRed:62/255.0 green:173/255.0 blue:219/255.0 alpha:1],
                       [UIColor colorWithRed:229/255.0 green:66/255.0 blue:115/255.0 alpha:1], 
                       [UIColor colorWithRed:30/255.0 green:141/255.0 blue:3/255.0 alpha:1],
                       [UIColor colorWithRed:60/255.0 green:141/255.0 blue:239/255.0 alpha:1],
                       [UIColor colorWithRed:90/255.0 green:15/255.0 blue:139/255.0 alpha:1],
                       nil];

}

- (void)viewDidUnload
{
    [self setPieChartLeft:nil];
    [self setIndexOfSlices:nil];
    [self setNumOfSlices:nil];
    [self setResetButton:nil];
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.pieChartLeft reloadData];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return UIInterfaceOrientationIsLandscape(interfaceOrientation);
}

- (IBAction)SliceNumChanged:(id)sender 
{
    UIButton *btn = (UIButton *)sender;
    NSInteger num = self.numOfSlices;
    if(btn.tag == 100 && num > -10)
        num = num - ((num == 1)?2:1);
    if(btn.tag == 101 && num < 10)
        num = num + ((num == -1)?2:1);
    
    self.numOfSlices = num;
}

- (IBAction)clearSlices {
    [_slices removeAllObjects];
    [self.pieChartLeft reloadData];
}



- (IBAction)updateSlices
{
    for(int i = 0; i < _slices.count; i ++)
    {
        [_slices replaceObjectAtIndex:i withObject:[NSNumber numberWithInt:rand()%60+20]];
    }
    [self.pieChartLeft reloadData];

}

- (IBAction)showSlicePercentage:(id)sender {
}

#pragma mark - XYPieChart Data Source

- (NSUInteger)numberOfSlicesInPieChart:(XYPieChart *)pieChart
{
    return self.slices.count;
}

- (CGFloat)pieChart:(XYPieChart *)pieChart valueForSliceAtIndex:(NSUInteger)index
{
    //NSLog(@"The value for slice at index %d is : %@", index, [self.slices objectAtIndex:index] );
    return [[self.slices objectAtIndex:index] intValue];
}

- (UIColor *)pieChart:(XYPieChart *)pieChart colorForSliceAtIndex:(NSUInteger)index
{
    return [self.sliceColors objectAtIndex:(index % self.sliceColors.count)];
}

#pragma mark - XYPieChart Delegate
- (void)pieChart:(XYPieChart *)pieChart willSelectSliceAtIndex:(NSUInteger)index
{
    NSLog(@"will select slice at index %d",index);
}
- (void)pieChart:(XYPieChart *)pieChart willDeselectSliceAtIndex:(NSUInteger)index
{
    NSLog(@"will deselect slice at index %d",index);
}
- (void)pieChart:(XYPieChart *)pieChart didDeselectSliceAtIndex:(NSUInteger)index
{
    NSLog(@"did deselect slice at index %d",index);
}
- (void)pieChart:(XYPieChart *)pieChart didSelectSliceAtIndex:(NSUInteger)index
{
    NSLog(@"did select slice at index %d",index);
    //self.selectedSliceLabel.text = [NSString stringWithFormat:@"$%@",[self.slices objectAtIndex:index]];
}
- (IBAction)updatePressed:(id)sender {
    [_slices removeAllObjects];
    for (UITextField * textField in _textFields){
        NSNumber * one = [NSNumber numberWithInt: [textField.text intValue]];
        [_slices addObject:one];
    }
    [self.pieChartLeft reloadData];
}
- (IBAction)resetPressed:(id)sender {
    [_slices removeAllObjects];
    NSNumber * one = [NSNumber numberWithInt:1];
    for (UITextField * textField in _textFields){
        textField.text = @"1";
        [_slices addObject:one];
        
    }
    [self.pieChartLeft reloadData];
}

@end
