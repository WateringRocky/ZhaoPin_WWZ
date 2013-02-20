//
//  JobType.m
//  ZhaoPin_WWZ
//
//  Created by Ibokan on 13-2-19.
//  Copyright (c) 2013年 Ibokan. All rights reserved.
//

#import "JobType.h"

@implementation JobType
@synthesize code = _code,text = _text,smallJobType = _smallJobType;

-(id)init
{
    if(self = [super init]){
        self.smallJobType = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)dealloc
{
    self.code = nil;
    self.text = nil;
    self.smallJobType = nil;
    [super dealloc];
}
@end
