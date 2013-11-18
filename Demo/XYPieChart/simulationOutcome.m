//
//  simulationOutcome.m
//  XYPieChart
//
//  Created by Tia on 11/18/13.
//  Copyright (c) 2013 Xiaoyang Feng. All rights reserved.
//

#import "simulationOutcome.h"

@implementation simulationOutcome
@synthesize simOutcome = _simOutcome;

-(id) init{
    _simOutcome = [[NSMutableArray alloc] initWithCapacity:35];
    return self;
}

- (id) initWith: (NSString*)retrievedData{
    NSArray *keyArray = [[NSArray alloc] initWithObjects: @"runID", @"studyID",@"privateInstall",@"publicInstall",@"privateMaintain", @"publicMaintain", @"privateDamage", @"publicDamage", @"timeToFlood", @"timeToLargeFlood", @"timeOfFlood", @"timeOfLargeFlood", @"timeToDry",@"waterInSewers", @"standingWater", @"waterInAllGI",@"waterInRoofs", @"waterInRainBarrels", @"waterInSwales", @"privateInstallN", @"publicInstallN",@"publicMaintainN", @"publicDamageN", @"privateDamageN",@"privateMaintainN", @"timeToFloodN", @"timeOfFloodN", @"timeToLargeFloodN", @"timeOfLargeFloodN", @"timeToDryN", @"waterInSewersN", @"standingWaterN",@"waterInAllGIN",@"waterInRoofsN", @"waterInRainBarrelsN", @"waterInSwalesN", nil];
    NSArray *captureData = [retrievedData componentsSeparatedByString:@"\n"];
    _simOutcome = [[NSMutableArray alloc] initWithCapacity:captureData.count];
    for( int i = 0; i < captureData.count; i++){
        NSString *recordText = [ [captureData objectAtIndex:i ] stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
        NSLog(@"%@", recordText);
        NSArray *record = [recordText componentsSeparatedByString: @"\t"];
        NSMutableDictionary *recordDic =[[NSMutableDictionary alloc] initWithObjects:record forKeys:keyArray];
        [_simOutcome addObject:recordDic];
        
    }
    for(int i = 0 ; i < _simOutcome.count; i++){
        NSLog(@"%@\n\n" , [_simOutcome objectAtIndex:i]);
    }
    return self;
}
@end
