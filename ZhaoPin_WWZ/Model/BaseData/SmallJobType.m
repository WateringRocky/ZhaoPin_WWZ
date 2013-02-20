//
//  SmallJobType.m
//  ZhaoPin_WWZ
//
//  Created by Ibokan on 13-2-19.
//  Copyright (c) 2013年 Ibokan. All rights reserved.
//

#import "SmallJobType.h"

@implementation SmallJobType
@synthesize categoryid = _categoryid,code = _code,text = _text;

-(void)dealloc
{
    self.categoryid = nil;
    self.code = nil;
    self.text = nil;
    [super dealloc];
}
@end
