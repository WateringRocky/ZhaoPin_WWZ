//
//  CompType.m
//  ZhaoPin_WWZ
//
//  Created by Ibokan on 13-2-19.
//  Copyright (c) 2013年 Ibokan. All rights reserved.
//

#import "CompType.h"

@implementation CompType
@synthesize code = _code,text = _text;

-(void)dealloc
{
    self.code = nil;
    self.text = nil;
    [super dealloc];
}
@end
